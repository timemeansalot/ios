# This is readme file

## Swift Basic
> PS: when learning Swift, we can write code in **Playground**, it's something like the jupyter notebook for Python.

1. var for variable and let for contant, you can only assign value to constant once
2. you can explicitly set type fo var or constant, like `var my_value: Double = 4`
3. swift doesn't implicity convert variable type, you must explicity convert a variable to another type if you want, like `widthLabel=label+String(width)`
4. more convinient way to include variables in a string: `"I have \(sum) apples"`
5. use """xxx""" for strings which take multiple lines
6 \[\] is both for array and dict
```
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]

var shoppingList = ["catfish", "water", "tulips"]
```
7. like vectors in C++, you can **appen** to array in Swift, and it will grow size automaticlly. `shoppingList.append("water melon")**
8. if you want to create empty array or empty dict, you must specify its type:
```
var emptyArray:[String]=[]
var emptyDict:[String:Float]=[:]
```
> conclusion: Swift is cares much about type, it's not like Python which does a lot of implicity type conversion for programmers.
