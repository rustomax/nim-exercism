import math

proc isPrime(n: int): bool =
    if n == 2: return true
    for i in 2 .. int(ceil(sqrt(float(n)))):
        if n mod i == 0:
            return false
    return true

proc prime*(n: int): int =
    if n < 1: raise newException(ValueError, "invalid argument")

    var candidate = 1
    for i in 1 .. n:
        while true:
            inc candidate
            if candidate.isPrime():
                result = candidate
                break
