// Copyright (c) 2022, Alexander Iurovetski
// All rights reserved under MIT license (see LICENSE file)

import 'package:test/test.dart';
import 'package:thin_logger/thin_logger.dart';

/// A suite of tests for Logger
///
void main() {
  group('Logger -', () {
    test('level', () {
      var logger = Logger();

      logger.level = Logger.levelQuiet - 1;
      expect(logger.level, Logger.levelDefault);

      for (var level = Logger.levelQuiet;
          level < Logger.levelVerbose;
          level++) {
        logger.level = level;
        expect(logger.level, level);
      }

      logger.level = Logger.levelVerbose + 1;
      expect(logger.level, Logger.levelVerbose);
    });

    test('getPrintableMsg', () {
      var logger = Logger(Logger.levelQuiet);
      var text = 'Level: ${logger.level}';
      expect(logger.getPrintableMessage(text, Logger.levelQuiet - 1), null);
      expect(logger.getPrintableMessage(text, Logger.levelQuiet - 0), null);
      expect(logger.getPrintableMessage(text, Logger.levelQuiet + 1), null);

      for (var level = Logger.levelNormal;
          level <= Logger.levelVerbose;
          level++) {
        logger.level = level;
        text = 'Level: $level';
        expect(
            logger.getPrintableMessage(text, level - 1),
            ((level - 1 == Logger.levelQuiet) || (level - 1 > logger.level)
                ? null
                : text));
        expect(
            logger.getPrintableMessage(text, level - 0),
            ((level - 0 == Logger.levelQuiet) || (level - 0 > logger.level)
                ? null
                : text));
        expect(
            logger.getPrintableMessage(text, level + 1),
            ((level + 1 == Logger.levelQuiet) || (level + 1 > logger.level)
                ? null
                : text));
      }
    });
  });
}
