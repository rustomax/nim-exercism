import strutils, tables

const
    openBrackets = {'{', '[', '('}
    closeBrackets = {'}', ']', ')'}
    pairs = {'{': '}', '[': ']', '(': ')'}.toTable

proc normalized(s: string): string =
    ## Removes all characters that are not brackets
    s.split(AllChars - openBrackets - closeBrackets).join()

proc isPaired*(s: string): bool =
    var stack: seq[char]
    
    for c in s.normalized():
        if c in openBrackets:
            stack.add c
        else:
            if stack.len() > 0 and pairs[stack[stack.high]] == c:
                stack.delete(stack.high)
            else:
                return false

    if stack.len() != 0:
        return false
    
    return true