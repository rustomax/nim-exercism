import strutils, sequtils

proc encode*(str: string): string =
    if str.len() < 2 or str.deduplicate == str:
        return str

    # padding with \0 char to correctly process
    # last character in the input string 
    let str = str & '\0'

    var i: int
    var count = 1
    while i < str.high():
        while str[i] == str[i + 1]:
            inc count
            inc i
        if count > 1:
            result &= $count
        result &= str[i]
        inc i
        count = 1

proc decode*(str: string): string =
    if str.len() < 2:
        return str

    # padding with \0 char to correctly process
    # last character in the input string 
    let str = str & '\0'

    var i: int
    while i < str.high():
        var multiplier: string
        while str[i].isDigit():
            multiplier &= str[i]
            inc i
        if multiplier == "":
            multiplier = "1"
        let character = str[i]
        result &= character.repeat(parseInt(multiplier))
        inc i
