from logic_lib import AND, OR, NOT

C = ['r', 'v', 'b']
E  = ['WA', 'NT', 'Q', 'SA', 'NSW', 'V', 'T']
L = [
    ['WA','NT'],['WA','SA'],['NT','Q'],['NT','SA'],['SA','Q'],['SA','NSW'],
    ['SA','V'],['Q','NSW'],['NSW','V'],['V','T']
]

D = {}
for i in E:
    for j in C:
        D[(i,j)] = 0

print(D[('NT','r')])

def T1():
    for e in E:
        if OR([AND([D[(e,'r')], NOT(D[(e,'v')]), NOT(D[(e,'b')])]),
            AND([D[(e,'r')], NOT(D[(e,'v')]), NOT(D[(e,'b')])]),
            AND([D[(e,'r')], NOT(D[(e,'v')]), NOT(D[(e,'b')])])]):
            return 1
    return 0

