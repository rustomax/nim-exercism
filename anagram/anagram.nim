import sequtils, algorithm, strutils

proc isAnagram*(word, candidate: string): bool =
    let lWord = word.toLower()
    let lCandidate = candidate.toLower()
    lWord != lCandidate and lWord.sorted == lCandidate.sorted

proc detectAnagrams*(word: string, candidates: seq[string]): seq[string] =
    candidates.filterIt(word.isAnagram(it))