import sequtils, sugar

# Pre-compute board and total values at compile time
const
    cBoard = toSeq(1..64).map(x => 1'u64 shl (x.uint64 - 1'u64))
    cTotal = foldl(cBoard, a + b)

proc onSquare*(i: int): uint64 =
    if i < 1 or i > 64:
        raise newException(ValueError, "invalid argument")
    cBoard[i - 1]

proc total*(): uint64 =
    cTotal