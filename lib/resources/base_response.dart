import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';

import '../app.dart';

class BaseResponse<T> {
  T? data;
  String? message;
  Map<String, String>? messages;
  bool? accept;

  BaseResponse.fromJson(dynamic json) {
    if (json['message'] is String) {
      message = json['message'];
    } else if (json['message'] is Map<String, String>) {
      messages = json['message'];
    }
    accept = json['accept'];
    data = json['data'] != null ? makeModel<T>(json['data']) : null;
  }
}

typedef DataFactory<T> = T Function(dynamic json);

T makeModel<T>(dynamic json) {
  if (!dataModelFactories.containsKey(T)) {
    throw ErrorDescription("TypeError: please add model to factories!");
  }
  try {
    return dataModelFactories[T]!(json) as T;
  } catch (e) {
    print(
      'Error when making model with $T type: $e\n'
      '${json.containsKey('id') ? 'Model contains id: ${json['id']}\n' : ''}'
      'The raw data which make this error is:\n'
      '${convert.json.encode(json)}',
    );
    rethrow;
  }
}
