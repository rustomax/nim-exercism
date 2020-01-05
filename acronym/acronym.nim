import strutils, sequtils

proc abbreviate*(s: string): string =
    s.toUpper()
     .split({' ', '-', '_'})
     .filterIt(it.len > 0)
     .mapIt(it[0])
     .join()
