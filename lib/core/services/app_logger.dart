import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';


class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  factory AppLogger() => _instance;
  AppLogger._internal();

  late final Logger _logger;

  void init() {
    _logger = Logger(
      filter: ProductionFilter(),
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8, 
        lineLength: 120, 
        colors: true,
        printEmojis: true, 
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      level: kDebugMode ? Level.debug : Level.warning,
    );

    info('AppLogger initialized');
  }

  /// Log Debug - للتطوير فقط
  void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log Info - معلومات عامة
  void info(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log Warning - تحذيرات
  void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log Error - أخطاء
  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);

    // Send to remote logging service in production
    if (error != null && !kDebugMode) {
      _sendToRemoteLogging(message, error, stackTrace);
    }
  }

  void _sendToRemoteLogging(
    String message,
    dynamic error,
    StackTrace? stackTrace,
  ) {
 
  }
}

final appLogger = AppLogger();
