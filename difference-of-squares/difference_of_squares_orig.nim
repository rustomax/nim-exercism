import sequtils, math, os, strutils

proc squareOfSum*(n: int): int =
    toSeq(1..n).foldl(a + b) ^ 2

proc sumOfSquares*(n: int): int =
    toSeq(1..n).mapIt(it ^ 2).foldl(a + b)

proc difference*(n: int): int =
    squareOfSum(n) - sumOfSquares(n)

when isMainModule:
   echo difference paramStr(1).parseInt()