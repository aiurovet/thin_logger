// Copyright (c) 2022, Alexander Iurovetski
// All rights reserved under MIT license (see LICENSE file)

/// An export for a simple logger
///
library thin_logger;

export 'src/thin_logger_base.dart';
export 'src/thin_logger_io.dart'
    if (dart.library.html) 'src/thin_logger_html.dart';
