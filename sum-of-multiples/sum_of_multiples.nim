import sequtils

proc divisible(n: int, factors: seq[int]): bool =
    for factor in factors:
        if n mod factor == 0:
            return true

proc sum*(n: int, factors: seq[int]): int =
    let factors = factors.filterIt(it > 0)
    if factors.len == 0 or n < 1:
        return

    let multiples = toSeq(1 ..< n).filterIt(divisible(it, factors))
    if multiples.len > 0:
        return multiples.foldl(a + b)
