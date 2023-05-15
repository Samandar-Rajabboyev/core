import 'package:habit_tracker/src/core/app_state/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../app_state/localization.dart';

extension Localise on BuildContext {
  String get locale => S.of(this).langCode;

  bool get uz {
    try {
      read<AppCubit>().changeLocale(Localization.uz);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get en {
    try {
      read<AppCubit>().changeLocale(Localization.en);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get ru {
    try {
      read<AppCubit>().changeLocale(Localization.ru);
      return true;
    } catch (e) {
      return false;
    }
  }
}
