import 'package:logger/logger.dart';

/// Global logger instance
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

/// Simple logger for production
final productionLogger = Logger(
  printer: SimplePrinter(),
  level: Level.warning,
);
