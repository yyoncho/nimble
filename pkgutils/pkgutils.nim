import macros
import os
import sequtils
import strutils
import strformat

const pkgPathSuffix = "__pkgPath"

proc getPkgPath*(pkgName: string): string =
  result = getEnv(pkgName & pkgPathSuffix)
  if result == "":
    let packages = envPairs()
      .toSeq
      .filterIt(it[0].endsWith(pkgPathSuffix))
      .mapIt(it[0][0..^len(pkgPathSuffix) + 1])

    raise newException(ValueError, "Unable to find the path for package: {pkgName}. Available packages {packages}".fmt )

macro importPackage*(path: untyped): untyped =
  proc flatten(node: NimNode, list: var seq[NimNode]) =
    if node.kind == nnkInfix:
      if $node[0] != "/":
        raise newException(ValueError, "Expected format: PackageName/pathInPackage")
      flatten(node[1], list)
      flatten(node[2], list)
    else:
      list.add(node)

  var nodes: seq[NimNode] = @[]
  flatten(path, nodes)

  let
    parts = nodes.map(`$`)
    pkgRelativePath = parts[1..^1].join("/")
    pkgPath = getPkgPath(parts[0])
  quote do:
    import `pkgPath`/`pkgRelativePath`
