import strutils, sequtils

proc isIsogram*(s: string): bool =
    let normalized = s
        .toLower()
        .multiReplace(("-", ""), (" ", ""))

    normalized.deduplicate().len == normalized.len()
