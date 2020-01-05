import stacks

proc isPaired*(s: string): bool =
    ## Algorithm to detect unbalanced brackets using a stack
    var stack = Stack[char]()
    
    for c in s:
        case c:
            of '{': stack.push('}')
            of '[': stack.push(']')
            of '(': stack.push(')')
            of '}', ']', ')':
                if stack.empty or stack.pop() != c: return false
            else: discard

    stack.empty()
