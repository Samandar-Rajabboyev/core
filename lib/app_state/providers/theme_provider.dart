import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/services.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  Future _init() async {
    String? darkMode = await Prefs.getString('app_theme_data');
    state = darkMode == null ? ThemeMode.system : ThemeMode.values.firstWhere((element) => element.name == darkMode);
  }

  ThemeModeNotifier() : super(ThemeMode.system) {
    _init();
  }

  String get name => state.name.capitalize;

  void toggle() async {
    state = ThemeMode.dark == state ? ThemeMode.light : ThemeMode.dark;
    Prefs.setString('app_theme_data', state.name);
  }

  void changeMode(ThemeMode mode) async {
    state = mode;
    Prefs.setString('app_theme_data', state.name);
  }
}

setSystemNavigationBarColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: color));
}
