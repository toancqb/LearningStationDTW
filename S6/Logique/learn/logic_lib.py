
def AND(lst):
    m = lst[0]
    for i in lst:
        if m > i:
            m = i
    return m

def OR(lst):
    m = lst[0]
    for i in lst:
        if m < i:
            m = i
    return m

def NOT(x):
    return 1 - x

