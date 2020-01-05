import math

proc isArmstrongNumber*(n: int): bool =
    if n < 10:
        return true

    let length = floor(log10(n.float) + 1).int

    var num = n
    var digit, res: int
    while num > 0:
        digit = num mod 10
        res += digit ^ length
        num = num div 10

    return n == res
