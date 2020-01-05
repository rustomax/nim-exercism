import sequtils, algorithm

type
    Student* = tuple[name: string, grade: int]
    School* = object
      students*: seq[Student]

proc roster*(this: School): seq[string] =
    this.students
        .sortedByIt((it.grade, it.name))
        .mapIt(it.name)

proc grade*(this: School, grade: int): seq[string] =
    this.students
        .sortedByIt((it.grade, it.name))
        .filterIt(it.grade == grade)
        .mapIt(it.name)