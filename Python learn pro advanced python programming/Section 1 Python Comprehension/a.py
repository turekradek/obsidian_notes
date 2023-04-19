num = [1,2,3,4,5]
squares = []

for n in num:
    squares.append(n**2)
    
print(squares)

squares2 = [ n**2 for n in num ]

print(squares2) 

lista=[1,2,3,4,5]
lista2=[2,3,4,5,6]
intersections = [x for x in lista for y in lista2 if x==y]
print(intersections)

intersections2 = [(x,y) for x in lista for y in lista2 if x!=y]
print(intersections2)

x = list(map(lambda x:x, "Hello"))
print( x )

x = list(map(lambda x:x.upper(), "Hello"))
print( x )