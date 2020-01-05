proc distance*(a, b: string): int =
    if a.len() != b.len():
        raise newException(ValueError, "invalid arguments")
    
    for i in 0 .. a.high:
        if a[i] != b[i]:
            result += 1