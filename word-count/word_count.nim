import tables, strutils, sequtils

proc countWords*(str: string): CountTableRef[string] =
    result = newCountTable[string]()

    var words = str.toLower()
                   .split(AllChars - Letters - Digits - {'\''})
                   .filterIt(it.len() > 0)

    for word in words:
        result.inc(word.strip(chars = {'\''}))
