import Foundation

//: > Classes are more powerful but more complex, so at most time we prefer Structures to Classes.


struct Resolution{
    var width=0 // refer to type of Int because we set the init value to be 0
    var height=0
}

class videoMode{
    var resolution=Resolution()
    var interlaced=false
    var frameRate=0.0
    var name:String? // Optional Type, default value is nil
}

var myResolution=Resolution()
print(myResolution)

//: Access data of class and struct
print("width of resolutions is \(myResolution.width)")

let myClass=videoMode()
print("video width before: \(myClass.resolution.width)")
myClass.resolution.width=2
print("video width after: \(myClass.resolution.width)")

//:# structures have automatically generated initializer, but Swift doesn't provide copy init like C++
let initStruct=Resolution(width: 30, height: 20)
print("copyInit witdh: \(initStruct.width)")


//: Struct is **Value Type**, which means Swift do a copy of them when assigned to new value or passed to functions.
let firstInstance=Resolution(width: 1920, height: 1080)
var secondInstance=firstInstance
secondInstance.width=2048

print("first width: \(firstInstance.width), second width: \(secondInstance.width)")
// we can see when change the value of second width, we don't influence the first width

//: Classes are **Reference Type**, not copied when assigned to new variable or passed to function, it's like simple pointer in C++.
let firstClass=videoMode()
var secondClass=firstClass
print("first class before: \(firstClass.resolution.width)")
secondClass.resolution.width=20
print("first class after: \(firstClass.resolution.width)")
// will infer the firstClass

//: we can check if two instance of class refer to the same object using `===` or `!==`
if firstClass===secondClass{
    print("refer to the same obj")
}else{
    print("refer to the same obj")
}
