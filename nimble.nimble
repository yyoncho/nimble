# Package

version       = "0.14.0"
author        = "Dominik Picheta"
description   = "Nim package manager."
license       = "BSD"

bin = @["nimble"]
srcDir = "src"
installExt = @["nim"]

# Dependencies

requires "nim >= 0.13.0"

# import os

when defined(nimdistros):
  import distros
  if detectOs(Ubuntu):
    foreignDep "libssl-dev"
  else:
    foreignDep "openssl"

when defined(buildNim):
  task install, "Run the Nimble tester!":
    echo "First iteration..."
    exec "/home/yyoncho/Sources/nim/nimble/nimble -d:buildNim install"
else:
  before install:
    echo "Foo bar..."





task test, "Run the Nimble tester!":
  withDir "tests":
    exec "nim c -r tester"
