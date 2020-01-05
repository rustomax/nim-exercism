import strutils

proc isPangram*(s: string): bool =

    # If the string is too short to include all
    # alphabet characters, return `false` right away
    if s.len() < 26:
        return false

    let letters = {'a'..'z'}
    let lc = s.toLowerAscii()

    for l in letters:
        if l notin lc:
            return false
    
    return true