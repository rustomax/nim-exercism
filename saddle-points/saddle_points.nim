import sequtils

proc saddlePoints*(m: openArray[seq[int]]): seq[(int, int)] =
    # Return empty list on empty input
    if m == @[]: return

    # Precompute row maximums and column minimums
    let rmax = m.mapIt(it.max)
    var cmin: seq[int]
    for col in 0 .. m[0].high:
        cmin.add m.mapIt(it[col]).min()

    # Find saddle points
    for row in 0 .. m.high:
        for col in 0 .. m[0].high:
            if rmax[row] == m[row][col] and cmin[col] == m[row][col]:
                result.add (row + 1, col + 1)
