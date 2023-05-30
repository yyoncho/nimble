# Package

version       = "0.1.0"
author        = "Ivan Yonchovski"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["demo"]

# Dependencies

requires "nim"

# echo "demo-feature enabled"

feature "demo-feature":
  task checkEnabled, "":
    echo "demo-feature enabled"
  requires "with" # feature specific
