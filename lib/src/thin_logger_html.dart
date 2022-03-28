// Copyright (c) 2022, Alexander Iurovetski
// All rights reserved under MIT license (see LICENSE file)

import 'dart:html';

/// A global method to print to stderr (web)
///
void printErr(String msg) => window.console.error(msg);
