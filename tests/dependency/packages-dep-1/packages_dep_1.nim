import pkgutils

importPackage PackageA/packagea

proc test2*(a, b: int): int =
  return test(a, b)
