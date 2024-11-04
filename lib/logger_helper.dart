import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

mixin LoggerHelper {
  Logger logger =Logger();

   bool showLog=kDebugMode;
  logDebug(String message)=>showLog?logger.d(message):null;
  logVerbose(String message)=>showLog?logger.v(message):null;
  logInfo(String message)=>showLog?logger.i(message):null;
  logWarning(String message)=>showLog?logger.w(message):null;
  logError(String message)=>showLog?logger.e(message,):null;
  logWhat(String message)=>showLog?logger.f(message,):null;
  logTrace(String message)=>showLog?logger.t(message):null;
  logDeveloper(String message)=>showLog?log(message):null;

}