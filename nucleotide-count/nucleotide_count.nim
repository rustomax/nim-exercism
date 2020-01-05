import tables, strutils

proc countDna*(s: string): CountTable[char] =
    if s.split({'A', 'T', 'G', 'C'}).join().len() != 0:
        raise newException(ValueError, "invalid sequence")
    s.toCountTable()
