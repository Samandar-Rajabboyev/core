import 'package:flutter/material.dart';

class Localization {
  Localization._();

  // locales in variable
  static const uz = Locale('uz', "UZ");
  static const en = Locale('en', 'US');
  static const ru = Locale('ru', 'RU');

  // locales in list
  static const all = [uz, en, ru];
}
