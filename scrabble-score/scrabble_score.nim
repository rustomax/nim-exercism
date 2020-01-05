import tables, strutils

const
    weights = {
        'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't': 1,
        'd', 'g': 2,
        'b', 'c', 'm', 'p': 3,
        'f', 'h', 'v', 'w', 'y': 4,
        'k': 5,
        'j', 'x': 8,
        'q', 'z': 10
    }.toTable()

proc score*(word: string): int =
    for c in word.toLower():
        result += weights[c]
