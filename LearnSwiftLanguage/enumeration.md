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

