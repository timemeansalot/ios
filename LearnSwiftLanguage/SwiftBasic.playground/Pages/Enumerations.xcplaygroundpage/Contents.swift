//: [Previous](@previous)

import Foundation

var greeting = "Hello Enumerations"
print(greeting)

//:# basic enmerations syntax
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

myEnum = .east // if we have create variable of one enumeration, we can assign it to another case without the enumeration name.
print(myEnum.rawValue)


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


var defaultArray=Array(repeating: 0.0, count: 3)
print(defaultArray)
