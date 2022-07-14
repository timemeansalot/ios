import Foundation // for basic stuff like Array, String, etc

/*:
 # Enumeration
 
 */

enum CompassPoint: Int{
    case north=1
    case south
    case east
    case west
}

var firstCase=CompassPoint.east
print(firstCase)
print(firstCase.rawValue)

var secondCase=CompassPoint(rawValue: 1)
print(secondCase!)
//: switch and enumeration

switch firstCase{
case .north:
    print("North")
case .south:
    print("South")
default:
    print("East or West")
}

//: Enumeration is not iterable in default, we can comfort case to the *CaseIterable* to make it iterable, because it will be able to call the *allCases* method
enum iterableEnum: CaseIterable{
    case coffee, tea, juich
}

//for f in firstCase{
//    print(f)
//} // it's illegal because firstCase is not iterable, it doesn't have the allCases method
for i in iterableEnum.allCases{
    print(i)
}

//: for enumeration, we can set the init value of its cases
enum barCode{
    case upc(Int,Int,Int,Int) // case with Init
    case qrCode(String)
}

var productBarcode=barCode.upc(8, 13231, 432, 2)
print(productBarcode)

productBarcode = .qrCode("ABCDFSDFDFSE")
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}


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
