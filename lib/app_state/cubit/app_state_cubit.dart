import 'package:bloc/bloc.dart';
import 'package:core/app_state/localization.dart';
import 'package:flutter/material.dart';

import '../../services/services.dart';

part 'app_state_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({ThemeMode? themeMode, Locale? locale})
      : super(
          AppState(
            themeMode: themeMode ?? ThemeMode.system,
            locale: locale ?? Localization.uz,
          ),
        );

  void init() async {
    // locale
    String? locale = await Prefs.getString('app_locale_lang_code');
    if (locale != null) emit(state.copyWith(locale: Locale(locale)));

    // theme
    String? darkMode = await Prefs.getString('app_theme_data');
    emit(
      state.copyWith(
        themeMode: darkMode == null
            ? ThemeMode.system
            : ThemeMode.values.firstWhere(
                (element) => element.name == darkMode,
              ),
      ),
    );
  }

  void changeThemeMode(ThemeMode mode) async {
    emit(state.copyWith(themeMode: mode));
    Prefs.setString('app_theme_data', mode.name);
  }

  void changeLocale(Locale locale) async {
    emit(state.copyWith(locale: locale));
    Prefs.setString('app_locale_lang_code', locale.languageCode);
  }
}
