A minimal logger class, suitable mostly for console utilities rather than enterprise-grade applications.

## Features

Comprises a single class that, by default, allows just three levels of the output: quiet (none), normal (data, errors and info) and verbose (maximum).

## Usage

The usage is pretty straightforward. Please see the sample code below or in the `example` folder of the GitHub repository.

```dart
import 'package:thin_logger/thin_logger.dart';

/// Return the logger level based on CLI option
///
int parseLevel(String optLevel) {
  switch (optLevel) {
    case '-q':
      return Logger.levelQuiet;
    case '-v':
      return Logger.levelVerbose;
    default:
      return Logger.levelDefault;
  }
}

/// The application entry point
///
void main(List<String> args) {
  // Initializing the logger object
  //
  var level = parseLevel(args.isEmpty ? '' : args[0]);
  var logger = Logger(level);

  // Printing various-level data
  //
  logger.out('Plain data');
  logger.error('ERR');
  logger.info('INF');

  // This is the most expensive call, as every string will be interpolated
  // (substituted with the values like 'abc $d ef ${g.h}') unconditionally,
  // and the respective Logger method will be called
  //
  if (logger.isVerbose) {
    logger.verbose('VRB');
  }
}
```
