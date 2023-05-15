import 'package:core/app_state/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_state/localization.dart';

extension Localise on BuildContext {
  bool get uz {
    try {
      ProviderContainer().read(localeProvider.notifier).changeLocale(Localization.uz);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get en {
    try {
      ProviderContainer().read(localeProvider.notifier).changeLocale(Localization.en);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get ru {
    try {
      ProviderContainer().read(localeProvider.notifier).changeLocale(Localization.ru);
      return true;
    } catch (e) {
      return false;
    }
  }
}
