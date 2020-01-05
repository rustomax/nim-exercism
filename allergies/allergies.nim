import bitops

type
    Allergies* = object
        score*: int

const
    allergens* = ["eggs", "peanuts", "shellfish", "strawberries",
        "tomatoes", "chocolate", "pollen", "cats"]

proc isAllergicTo*(allergies: Allergies, food: string): bool =
    let index = allergens.find(food)
    if index != -1 and testbit(allergies.score, index):
        return true

proc lst*(allergies: Allergies): seq[string] =
    for i in 0 .. 7:
        if isAllergicTo(allergies, allergens[i]):
            result.add allergens[i]
