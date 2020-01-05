import strutils

type
    RequestType = enum
        Question
        AngryQuestion
        Yelling
        Empty
        Unknown

proc requestType(s: string): RequestType =
    let stripped = s.strip() # Remove leading and trailing whitespace
    let normalized = s.split(AllChars - Letters).join() # Remove all non-letters

    result = Unknown
    if stripped == "":
        return Empty
    if stripped[^1] == '?':
        result = Question
        if normalized.toUpper == normalized and normalized.len() != 0:
            result = AngryQuestion
        return
    if normalized.toUpper == normalized and normalized.len() != 0:
        return Yelling
    
proc hey*(s: string): string =
    case requestType(s):
        of Question: "Sure."
        of AngryQuestion: "Calm down, I know what I'm doing!"
        of Yelling: "Whoa, chill out!"
        of Empty: "Fine. Be that way!"
        of Unknown: "Whatever."