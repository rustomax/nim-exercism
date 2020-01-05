proc steps*(n: int): int =
    if n < 1:
        raise newException(ValueError, "invalid argument")

    var n = n
    while n > 1:
        if n mod 2 == 0:
            n = n div 2
        else:
            n = 3 * n + 1
        inc result