[[4 List Comprehension part 2]]




```
num = [1,2,3,4,5]
squares = []

for n in num:
    squares.append(n**2)
    
print(squares)

squares2 = [ n**2 for n in num ]

print(squares2) 
```

[[5 list comprehension vs lambda function]]

```
x = list(map(lambda x:x, "Hello"))
print( x )
```