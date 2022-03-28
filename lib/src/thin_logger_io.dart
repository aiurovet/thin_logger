// Copyright (c) 2022, Alexander Iurovetski
// All rights reserved under MIT license (see LICENSE file)

import 'dart:io';

/// A global method to print to stderr (native)
///
void printErr(String msg) => stderr.writeln(msg);
