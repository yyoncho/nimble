# Copyright (C) Dominik Picheta. All rights reserved.
# BSD License. Look at license.txt for more info.

{.used.}

import unittest, os, osproc, strutils, strformat

import testscommon
from nimblepkg/common import cd

suite "Features":
  test "Install with feature flags":
    cd "features/hello-features":
      let (output, exitCode) = execCmdEx(nimblePath & " --features=demo-feature -y install")
      echo ">>", output
      check exitCode == QuitSuccess
