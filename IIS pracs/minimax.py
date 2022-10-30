import math
def fun_minmax(cd, node, maxt, scr, td):
    if(cd == td):
        return scr[node]
    if(maxt):
        return max(fun_minmax(cd+1, node*2, False, scr, td),fun_minmax(cd+1, node*2+1, False, scr, td))
    else:
        return min(fun_minmax(cd+1, node*2, True, scr, td),fun_minmax(cd+1, node*2+1, True, scr, td))


scr = []
x =int(input("Enter total number of leaf Node = "))
for i in range(x):
    y = int(input("Enter leaf value: "))
    scr.append(y)

td = math.log(len(scr), 2)
cd = int(input("Enter current depth value: "))
nodev = int(input("Enter node value: "))
maxt = True

print("The answer is: ", end=" ")
answer = fun_minmax(cd, nodev, maxt, scr, td)
print(answer)