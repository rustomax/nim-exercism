const
    num = [1,4,5,9,10,40,50,90,100,400,500,900,1000]
    rom = ["I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"]

proc roman*(number: int): string =
    var number = number

    var i = 12
    while number > 0:
        var divider = number div num[i]
        number = number mod num[i]
        while divider > 0:
            result.add rom[i]
            dec divider
        dec i