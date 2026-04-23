import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/core/services/app_logger.dart';

class AppErrorHandler {
  static void init() {
    // Pass all uncaught "fatal" errors from the framework to Crashlytics
    FlutterError.onError = (FlutterErrorDetails details) {
      if (_isEmitAfterClose(details.exception)) {
        appLogger.warning('Ignored emit after close (FlutterError handler)');
        return;
      }

      FlutterError.presentError(details);
      appLogger.error('Flutter Fatal Error', details.exception, details.stack);
    };

    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      if (_isEmitAfterClose(error)) {
        appLogger.warning('Ignored emit after close (PlatformDispatcher)');
        return true;
      }

      appLogger.error('Platform Dispatcher Error', error, stack);
      return true;
    };
  }

  static bool _isEmitAfterClose(Object error) {
    return error.toString().contains(
      'Cannot emit new states after calling close',
    );
  }
}
