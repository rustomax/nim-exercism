import strutils, tables

proc countWords*(s: string): CountTableRef[string] =
    # padding with whitespace, so [i +/- 1] indices below work
    let lc = " " & s.toLower() & " "

    result = newCountTable[string]()
    var word: string
    var inWord: bool

    for i in 1 .. lc.high - 1:
        if lc[i].isAlphaNumeric() or
                (lc[i] == '\'' and lc[i + 1].isAlphaNumeric() and lc[i - 1].isAlphaNumeric()):
            inWord = true
            word.add lc[i]
        else:
            inWord = false
        if i == lc.high - 1:
            inWord = false
        if word.len() > 0 and not inWord:
            result.inc(word)
            word = ""