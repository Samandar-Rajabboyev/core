import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension Navigation on BuildContext {
  Future<void> popX<T extends Object?>([T? result]) async {
    try {
      pop<T>(result);
    } catch (e) {
      debugPrint("😡🚧🤯 pop error: $e");
      Navigator.pop<T>(this, result);
    }
  }
}
