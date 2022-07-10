//:# This Guide is leart from [A Swfit Tour](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)

import Foundation
import _Concurrency



//:## `var` vs `let`
/*:
 we can change value of `var`, while we can't change value of `let`
 */
var age = 12
let name = "Fu Jie"

print("my age is \(age), my name is \(name)")


//:we can explicity show the type of variable, like:
var food: String = "Apple"
print("I love eatting \(food)")


//:we can create array and dict both using []
var myArray = [1,2,3] // create array of Int
var myEmptyArray: [String] = [] // create empty, we must explicity show its variable type, because Swift is very type sensitive

var myDict = [1:"apple",2:"orange",3:"watermelon"]
print(myArray)
print(myDict)
//var myEmptyDict = [Int: String]()
var myEmptyDict:[Int:String]=[:]
print("myEmptyDict is : \(myEmptyDict)")

// access data by index or key
print(myArray[0])
print(myDict[1]!)

/*:
 ## Control FLow
 1. switch, if
 2. for-in
 3. while
 4. repeat-while
 
 ### if and switch
 */
let scores=[32,123,43,243]
var teamScores=0
for s in scores{
    if s>50{
        teamScores+=3
    } else {
        teamScores+=1
    }
}
print(teamScores)

//: add ? to make a variable become an optional variable, which means its value can be nil, optional type is not String, Int nor Double
var optionalName: String? = "Optional Fu Jie"
if optionalName != nil{
    print("hello \(optionalName!)") // use ! after option object, we can get its value
} else {
    print("name is nil")
}

var vegetable = "cucumber"
switch vegetable {
case "been":
    print("this is been")
case "celery", "cucumber":
    print("This is celery and cucumber")
    print("It's very delicious")
default:
    print("The default value is pepper")
}

//:### for-in
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest=0
for (_, numbers) in interestingNumbers{
    for number in numbers{
        if number>largest{
            largest=number
        }
    }
}
print("the largest number is :\(largest)")


var count=0
var n=1
while n < 100{
    count+=1
    n+=1
}
print("count is: \(count)")
//:`repeat xx while xx` is like `do-while` in C++
repeat{
    count-=1
    n-=1
} while n>0
print("now count is: \(count)")

//:## Function and Closures
func greet(person: String, day: String)->String{
    return "Hello \(person), today is \(day)"
}

print(greet(person: "Fu Jie", day: "2022-07-09"))

// array as parameter
func calculateStatistic(scores: [Int])->(min: Int, max: Int){
    var min=scores[0]
    var max=scores[0]
    
    for score in scores{
        if score < min{
            min=score
        }
        if score > max{
            max = score
        }
    }
    return (min,max)
}

var s=[1,2,3,4,5]
var (min, max)=calculateStatistic(scores: s)
print("min= \(min), max= \(max)")
// we can't declare the same variable twice
//var s=[1,2,3]
//print(s)


//: we can add function inside another function
func outer_func(input: Int)->Int{
    
    // declare a function inside another function
    func inner_func(input: Int)->Int{
        return input+1
    }
    
    return inner_func(input: input)+1
}

print(outer_func(input: 1))

//: function can be used as return type
func returnFunction()->(()->Int){
    func returnOne()->Int{
        return 1
    }
    return returnOne // this function returns another function which take in nothing, but return Int
}
print(returnFunction())   // return a function
print(returnFunction()()) // return one function, and call the returned function


//: function can be used as parameter
func paramFunction(input: Int, function: (Int)->Int){
    // parameter is a function, which inputs an Int and outputs an Int
    print("parameter function output is: \(function(input))")
}

func increase(input: Int)-> Int{
    return input+1
}

paramFunction(input: 10, function: increase)
//： Closures are blocks of code that can be called later, we can create a closure using {}

var member=[44,22,33]
let mappedMember=member.map({number in 3*number}) // the {...} part is a closure
print(mappedMember)
//let sortedMember=member.sorted(by: {$0 > $1})
let sortedMember=member.sorted{$0 > $1}// omit the () and by:
print(sortedMember)


//: ## Object and CLasses, the OOP feature
class Shape{
    private var numberOfSides=0
    
    // the _ in behind the parameter means the we don't need to add label when call the function
    init(_ sides: Int){
        numberOfSides=sides
    }
    func show()->String{
        return "A shape with \(numberOfSides) sides"
    }
}

var myOjbect: Shape = Shape(3)
print(myOjbect.show())

//: inheritance of class
class namedShape{
    private(set) var numberOfSides:Int=0
    var name:String
    
    init(_ name:String){
        self.name=name
    }
    
    func setSides(sides: Int){
        numberOfSides=sides
    }
    
    func simpleInfo()->String{
        return "A shape with \(numberOfSides), name is \(name)"
    }
}

var myNamedShape = namedShape("Fu Jie")
print(myNamedShape.simpleInfo())
myNamedShape.setSides(sides: 30)
print(myNamedShape.numberOfSides)

class Square : namedShape{
    var sideLength: Double
    
    init(sideLength: Double, name: String, sides: Int){
        self.sideLength=sideLength
        super.init(name)
        super.setSides(sides: sides)
//        super.numberOfSides=3
    }
    
    // when create functions with same name in subclasses, must use keyword override
    override func simpleInfo() -> String {
        return "sideLength= \(sideLength), \(super.simpleInfo())"
    }
}

var mySquare=Square(sideLength: 30.33, name: "FMT", sides: 23)
print("show mySqure: ")
print(mySquare.simpleInfo())


//:## Enumeration and Structures
enum Rank: Int {
    case ace = 1 // set raw value of items in Enum, each items floowing will increase the rawValue by 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
print(aceRawValue)

func compareRawValue(left: Rank, right: Rank)-> Bool{
    return left.rawValue>right.rawValue
}
let two=Rank.two
print(compareRawValue(left: ace, right: two))


// another enum example
enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color()->String {
        switch self{
        case .spades,.clubs:
            return "black"
        case .hearts,.diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts // type is Suit
let heartsDescription = hearts.simpleDescription() // type is String
let blackOrRed = hearts.color()
print(hearts,heartsDescription)
print(blackOrRed)

//: ### The main difference between struct and class is that: structs are always pass by value while classes are always pass by referrence

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: Rank.three, suit: Suit.spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpadesDescription)


//: ## Concurrency
////: use `async` to mark a function that runs synchronously
//func fetchUserID(from server: String) async ->Int{
//    if server=="primary"{
//        return 97
//    }else {
//        return 501
//    }
//}
////: call an asynchronous function by adding `await` in front of it
//func fetchUsername(from server: String) async -> String{
//    let userID=await fetchUserID(from: server)
//    if userID==501{
//        return "John Applessed"
//    }else{
//        return "Guest"
//    }
//}
//
////: use `async let` to run functions in parallel
//func connectUser(to server: String) async {
//    async let userID=fetchUserID(from: server)
//    async let username=fetchUsername(from: server)
//    let greeing = await "Hello \(username), user ID \(userID)" // use value returnd from sync functions must add `await`
//    print(greeing)
//}
//
////: use Tasks to call aysnchronouns functions
//Task{
//    await connectUser(to: "primary")
//}




//: ## Protocols and Extensions

