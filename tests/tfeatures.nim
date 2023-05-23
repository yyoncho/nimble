# Copyright (C) Dominik Picheta. All rights reserved.
# BSD License. Look at license.txt for more info.

{.used.}

import unittest, os, osproc, strutils, strformat

import testscommon
from nimblepkg/common import cd

suite "Features":
  # test "Install (no features enabled)":
  #   cd "features/hello-features":
  #     check execCmdEx(nimblePath & " -y install").exitCode == QuitSuccess
  test "Install with features":
    cd "features/hello-features":
      check execCmdEx(nimblePath & " --features=demo-feature -y build").exitCode == QuitSuccess
