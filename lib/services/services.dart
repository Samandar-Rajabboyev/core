import 'package:habit_tracker/src/core/extensions/dio_error.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:habit_tracker/src/core/resources/base_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:retrofit/retrofit.dart';

import '../../../generated/l10n.dart';
import '../router/route_config.dart';

part 'prefs.dart';
part 'logger.dart';
