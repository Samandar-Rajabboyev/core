import 'package:core/app_state/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/services.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  Future<void> _init() async {
    String? locale = await Prefs.getString('app_locale_lang_code');
    if (locale != null) state = Locale(locale);
  }

  LocaleNotifier() : super(Localization.uz) {
    _init();
  }

  String get name => state.languageCode.substring(0, 1).toUpperCase() + state.languageCode.substring(1).toLowerCase();

  void changeLocale(Locale mode) async {
    state = mode;
    Prefs.setString('app_locale_lang_code', state.languageCode);
  }
}
