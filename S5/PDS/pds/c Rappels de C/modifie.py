def modifie(n, t):
    n += 1
    t[0] += 1

def main():
    n = 0
    t = [0]

    print('avant')
    print('n: {}'.format(n))
    print('t: {}'.format(t))

    modifie(n, t)

    print('après')
    print('n: {}'.format(n))
    print('t: {}'.format(t))

main()
