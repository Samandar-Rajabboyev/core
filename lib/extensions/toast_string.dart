import 'package:fluttertoast/fluttertoast.dart';

extension ShowToast on String {
  bool get toast {
    Fluttertoast.showToast(msg: this);
    return true;
  }
}
