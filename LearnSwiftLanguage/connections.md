# Connections Basic
1. There 3 kindes of collections in swift:
- Array: ordered
- Set: Unordered
- Dict: Unordered, Key-Value
> all 3 kinds of collections are type-sensitive, all items in the connection must have the same type.

2. mutability
- if you use `var` to create an `array`,`set` or `dict`, you can both change its item and point it to another collection.
- if you use `let` to create a collect, you can change its value, but you cannot point it to another collection.

# Arrays
1. Arrays store value in ordered list, arrays can have the same value appears multiple times.

2. Create an empty arrya:
```
var emptyArray: [Int] = []
```
- the [Int] tells the type of array, if we don't know the type of array we must provide its type in this way.
- the [] in the behind means it's an empty array

3. Create an array with default type
```
var defaultArray = Array(repeating: 0.0, count: 3)
```
- we don't need to provide type, because Swift can refer the type is Double from **0.0**
- the count infers there are 3 items in the array whose value is 0.0



