// Copyright (c) 2022, Alexander Iurovetski
// All rights reserved under MIT license (see LICENSE file)

import 'package:thin_logger/src/thin_logger_io.dart'
    if (dart.library.html) 'package:thin_logger/src/thin_logger_html.dart';

/// A class for simple logging
///
class Logger {
  /// Print essential data to stdout if not quiet
  ///
  static const int levelOut = -1;

  /// Do not log anything
  ///
  static const int levelQuiet = 0;

  /// Print informational and error messages (moderate level)
  ///
  static const int levelNormal = 10;

  /// Print everything above as well as extra debug info
  ///
  static const int levelVerbose = 20;

  /// Default logging level
  ///
  static const int levelDefault = levelNormal;

  /// Logging level get accessor
  ///
  int get level => _level;
  int _level = levelDefault;

  /// Logging level set accessor
  ///
  set level(int value) => _level = value < 0
      ? levelDefault
      : value >= levelVerbose
          ? levelVerbose
          : value;

  /// The constructor with the optional logging level
  ///
  Logger([int newLevel = levelDefault]) {
    level = newLevel;
  }

  /// A flag indicating that all printing is disabled
  ///
  bool get isQuiet => (_level == levelQuiet);

  /// A flag indicating normal (default) logging is enabled
  ///
  bool get isNormal => (_level >= levelNormal);

  /// A flag indicating that excessive logging is enabled
  ///
  bool get isVerbose => (_level >= levelVerbose);

  /// A method to log an error (normal or higher)
  ///
  String? error(String data) => writeln(data, levelNormal);

  /// Returns [msg] itself if it can be printed or null otherwise
  ///
  String? getPrintableMessage(String msg, int level) =>
      ((_level == levelQuiet) || (level > _level) || (level == levelQuiet)
          ? null
          : msg);

  /// Print an informational [msg] (normal or higher) to stderr
  ///
  String? info(String msg) => writeln(msg, levelNormal);

  /// Print data to stdout
  ///
  String? out(String data) => writeln(data, levelOut);

  /// Print the detailed [msg] to stderr
  ///
  String? verbose(String msg) => writeln(msg, levelVerbose);

  /// A central method to print any [msg] depending on [level] and Logger's level
  ///
  String? writeln(String msg, int level) {
    var msgPrn = getPrintableMessage(msg, level);

    if (msgPrn != null) {
      if (level == levelOut) {
        print(msgPrn);
      } else {
        printErr(msgPrn);
      }
    }

    return msgPrn;
  }
}
