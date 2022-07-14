# Basics about enumerations
1. enumeration is used to define a group of values with the same type. 
2. C map variables into `int` when creating enumerations
3. We must provide a type for enumeration then we can add rawValue to it. If we don't add rawValue, Swift will set the default rawValue to 0 for us.
```
enum CompassPoint: Int{ // set type to be int, then I can set rawValue
    case north // default rawValue is 0
    case south
    case east
    case west // use `case` keyword to introduce new enumeration cases
}

var myEnum=CompassPoint.north
print(myEnum)
print(myEnum.rawValue)
```
> By default, the rowValue of `int` or `Double` type is stated at 0, the rawValue of `String` is set to match the case name.

we can create a enum variable by rawValue
```
var secondCase=CompassPoint(rawValue: 1)
print(secondCase!)
```
3. We must provide a type for enumeration then we can add rawValue to it. If we don't add rawValue, Swift will set the default rawValue to 0 for us.
```
enum CompassPoint: Int{ // set type to be int, then I can set rawValue
    case north // default rawValue is 0
    case south
    case east
    case west // use `case` keyword to introduce new enumeration cases
}

var myEnum=CompassPoint.north
print(myEnum)
print(myEnum.rawValue)
```
3. We must provide a type for enumeration then we can add rawValue to it. If we don't add rawValue, Swift will set the default rawValue to 0 for us.
```
//: basic enmerations syntax
enum CompassPoint: Int{ // set type to be int, then I can set rawValue
    case north // default rawValue is 0
    case south // use `case` keyword to introduce new enumeration cases
    case east, west // we can create multiple case in one line
}

var myEnum=CompassPoint.north
print(myEnum)
print(myEnum.rawValue)

var myEnum1=CompassPoint.south
print(myEnum1.rawValue)

var myEnum2=CompassPoint.west
print(myEnum2.rawValue)
```
4. If we have already create a variable of some enumeration, we can change its value to another case without the name of that enumeration, like:
```
myEnum = .east // if we have create variable of one enumeration, we can assign it to another case without the enumeration name.
print(myEnum.rawValue)
```
5. `enum` with `switch`
```
//:# Matching enumerations with switch
switch myEnum {
case .north:
    print("North")
case .south:
    print("South")
case .east:
    print("East")
default:
    print("west")
}
```

6. Enumeration is not iterable by default, we can make it inherit from *CaseIterable* to make it iterable, because at that time it will have a method called *allCases*

7. recursive enumeration: **call the enumeration inside the enum body, use keyword `indirect`**
```
//: # recursive enumerations, use keyword `indirect`
indirect enum calculate{
    case number(Int)
    
    // recursive part
    case add(calculate,calculate)
    case minus(calculate,calculate)
}

let op1=calculate.number(1)
let op2=calculate.number(2)
let sum=calculate.add(op1, op2)
print(sum)

// function to calculate value of the above enumeration
func evaluate(_ experssion: calculate)->Int{
    switch experssion{
    case let .number(value):
        return value
    case let .add(left, right):
        return evaluate(left)+evaluate(right)
    case let .minus(left, right):
        return evaluate(left)-evaluate(right)
    }
}

print(evaluate(sum))
```
