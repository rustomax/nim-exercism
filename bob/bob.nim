import strutils

proc hey*(s: string): string =
    let stripped = s.strip() # Remove leading and trailing whitespace
    let normalized = s.split(AllChars - Letters).join() # Remove all non-letters
    
    let isEmpty = stripped.len() == 0
    let isQuestion = stripped.endsWith('?')
    let isShouting = normalized.toUpper() == normalized and normalized.len() != 0

    if isEmpty:
        "Fine. Be that way!"
    elif isQuestion and isShouting:
        "Calm down, I know what I'm doing!"
    elif isQuestion:
        "Sure."
    elif isShouting:
        "Whoa, chill out!"
    else:
        "Whatever."