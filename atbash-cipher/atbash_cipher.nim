import strutils, std/wordwrap

proc normalized(s: string): string {.inline.} =
    s.split(AllChars - Letters - Digits).join().toLower()

proc decode*(s: string): string =
    for letter in s.normalized():
        if letter in {'a' .. 'z'}:
            result.add char(219 - ord(letter))
        else:
            result.add letter

proc encode*(s: string): string =
    s.decode().wrapWords(maxLineWidth = 5, newLine = " ")
