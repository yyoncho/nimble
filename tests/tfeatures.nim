# Copyright (C) Dominik Picheta. All rights reserved.
# BSD License. Look at license.txt for more info.

{.used.}

import unittest

import testscommon

suite "Features":
  test "can generate lock file":
    echo "X"
