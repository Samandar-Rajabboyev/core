import 'package:flutter/cupertino.dart';

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
