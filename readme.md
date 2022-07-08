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
> conclusion: Swift is very **Type-Sensitive**, it's not like Python which does a lot of implicity type conversion for programmers.

# Stanford Class for SwiftUI
[Link for Stanford Class for SwiftUI: CS193p](https://cs193p.sites.stanford.edu)
## Lecture 1 & 2
1. hold option key and click a variable in Swift, you can get a brief about the variablein Swift.
2. ForEach
3. VStack, HStack, ZStack, LazyVGrid
4. Text, Button(action:{},label:{}), Image, Spacer, padding, onTapGesture
5. @State var xx: turn xx into pointer, so we can change value of xx. By default, we can't change value of variables in a SwiftUI, no matter we define them as `var` or `let`.
6. Apple provide a lot of symbols for SwiftUI, we can find the name of these UI in SF-Symbols app. Then we can include these UI in our code by using their name: `Image(systemName: "plus.circle.fill")`

## Lecture 3 & 4: MVVM
1. six main types in Swift
- *struct*
- *class*
- protocol
- "Don't care" type
- enum
- *functions*
2. struct vs class
**Same Part**
- both have `var` & `let`
- both have functions
- both have initializers
**Difference Part**
- struct are value types(pass value by copy), class are referrence type(pass value by pointer)
- struct use functional programming while class use object-oriented programming.
- struct don't have inheritance while class has inheritance.
- the *ViewModel*  is always a class type
3. **functions are types** like other types in Swift, eg:
```
var operation: (Double)->Double // operation is a variable whose type is a function which input a Double and output a Double
func square(operand: Double)->Double{
	return operand*operand
}

// we can assign operation to square
operation = square // functions are just type like other type in Swift
let result = operation(4) // result equal to 16
```
4. to declare a function: `parameter in body`, the keyword `in` seperate the parameter and the body.
5. we must use keywords `mutating` to explicity specify when want change variables in a struct, while we don't need to do that for class.
6. if we want to re_render UI whenever the model changes, we:
- define the view model class as type of ObservableObject
- use keywords `@Published` in front of the variable inside the class
- use keywords `@ObservedObject` in front of the variable inside the ContentViews
7. to loop an Array and find hit target: `cards.firstIndex(where: {$0.id==card.id})`

## Lecture 5
1. Views in Swift are read-only
2. `@State`: rebuild the views whenever some variable changes, it's can only be private
3. we can use `extension` to add function or variable to existing class or struct
```
extension Array{
    var oneAndOnly: Element?{
        if self.count==1{
            return first
        }else {
            return nil
        }
    }
}
```
4. calculated value has get and set method, use functional programming to reduce codes
```
    private var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly}
        set{cards.indices.forEach{cards[$0].isFaceUp=($0==newValue)}} // newValue is keyword
    }
```
5. create some constants to make our UI the way we want:
```
    // some contants used to make UI the way we want
    private struct DrawingConstants{
        static let cornerRadius: CGFloat=20
        static let lineWidth:CGFloat=3
        static let fontScale:CGFloat=0.8
    }
```
## Lecture 6
1. protocol
- used as types, but not all protocols can be used as types
- used to specify the *behavior* of class and struct
- turn don't-care type into some-care type, behave like some protocol
- to restrict extension to only work on certain things
- the most powerful use of protocol is facilitate *code sharing*

