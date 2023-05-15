import 'package:core/app_state/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension Theming on ThemeMode {
  bool get set {
    try {
      ProviderContainer().read(themeModeProvider.notifier).changeMode(this);
      return true;
    } catch (e) {
      return false;
    }
  }
}
