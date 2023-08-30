# Copyright (C) Dominik Picheta. All rights reserved.
# BSD License. Look at license.txt for more info.

{.used.}

import unittest, os, osproc
import testscommon, strutils
from nimblepkg/common import cd

suite "pkgutils":
  proc cleanup() =
    cd "packages":
      removeFile "nimble.paths"
      removeFile ".gitignore"

  test "pkgutils working":
    cleanup()
    cd "packages":
      let (output, exitCode) =
        execCmdEx(nimblePath & " -y run")
      check exitCode == QuitSuccess
      check output.contains("99999999")
      check output.contains("PackageA-0.5.0")

  test "setup working":
    cleanup()
    cd "packages":
      check execCmdEx(nimblePath & " -y setup").exitCode == QuitSuccess
      check execCmdEx(nimblePath & " -y vanillaNim").exitCode == QuitSuccess
