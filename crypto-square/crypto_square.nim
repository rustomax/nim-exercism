import strutils, math, std/wordwrap

proc encrypt*(s: string): string =

    let norm = s.split(AllChars - Letters - Digits).join().toLower()
    echo norm
    if norm.len == 0:
        return ""

    echo "Normalized = ", norm

    let r = sqrt((float)norm.len)

    var i: float
    var sentence: string
    var word: string
    while i < r:
        var j: float
        word = ""
        while j < r:
            word.add norm[(int)j+i]
            j += 1
        i += 1
    sentence.add word
    sentence.add " "
    sentence = sentence.strip().alignLeft(norm.len)
    echo sentence
    return sentence

    #[
    let c = int(sqrt((float)norm.len))
    let r = norm.len() div c
    echo "r = ", r, " c = ", c
    if r < 2:
        return norm

    var rect = norm.wrapWords(maxLineWidth = c).split()
    rect[^1] = rect[^1].alignLeft(c)
    echo rect

    for col in 0 .. c - 1:
        for row in rect:
            result.add row[col]
        result.add " "
    
    result.strip().alignLeft(norm.len)
    ]#