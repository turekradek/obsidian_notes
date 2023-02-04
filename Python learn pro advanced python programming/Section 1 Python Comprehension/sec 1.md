# 3 List Comprehension part 1

[[4 List Comprehension part 2]]

[ expression   for item in list if condition ]
```
for item in list:
	if conditional:
		expression
```

new_list = [ expression(i) for i in old_list if filter(i) ]

```
num = [1,2,3,4,5]

squares = []

for n in num:
    squares.append(n**2)

print(squares)

squares2 = [ n**2 for n in num ]

print(squares2)
```

# 4 List Comprehension part 2
[[3 List Comprehension part 1]]

| a.py | n | n |
|-|-|-|
|[[a]]| | |


# 5

# 6 parsing a file using list comprehension
## find line with "world" in line
```
op - open("python.txt", 'r')
output = [ i for i in op if "world" in i]
```

# 7 accessing function using list comprehension

# 8 dictionary comprehension
```
dict = { 'one': {'a':10}, 'two':{'b':20}}

for ( external_key, external_value ) in dict.items():
	for (internal_key, internal_value) in external_value.items():
		external_value.update({internal_key: float(internal_value)})
dict.update({external_key:external_value})
```

# 9 set cemprehension
