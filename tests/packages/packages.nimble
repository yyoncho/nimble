# Package

version       = "0.1.0"
author        = "Ivan Yonchovski"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["packages"]

# Dependencies

requires "nim",
         "https://github.com/yyoncho/nimble?subdir=pkgutils#HEAD",
         "https://github.com/nimble-test/packagea"

task echoPaths, "":
    echo getPaths()

task vanillaNim, "":
  exec "nim c --run src/packages.nim"
