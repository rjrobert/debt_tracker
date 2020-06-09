import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/handlers/sentry_handler.dart';
import 'package:catcher/handlers/toast_handler.dart';
import 'package:catcher/mode/silent_report_mode.dart';
import 'package:catcher/model/catcher_options.dart';
import 'package:sentry/sentry.dart';

CatcherOptions get loggerDebugOptions => CatcherOptions(
      SilentReportMode(),
      [
        ConsoleHandler(enableStackTrace: true),
      ],
    );

CatcherOptions get loggerReleaseOptions => CatcherOptions(
      SilentReportMode(),
      [
        ToastHandler(),
        SentryHandler(
          SentryClient(
              dsn:
                  'https://eda589356d0d4c54988f4cf1583edd4b@o319042.ingest.sentry.io/5262401'),
          enableApplicationParameters: true,
          enableDeviceParameters: true,
        ),
      ],
    );
