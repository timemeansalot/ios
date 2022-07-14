import Foundation

//: # Array
//: This is empty array
var emptyArray: [Int]=[] // we must explicity show the type of an empty array when first create it
//: add item in to array
emptyArray.append(contentsOf: [1,2,3]) // add a sequence
print(emptyArray)

//: Create an array with default value
var defaultArray: [Double]=Array(repeating: 3.2, count: 4) // the array type must match its item type
print("Default array \(defaultArray)")

//: conbine two array together by +
var arrayTwo=Array(repeating: 2.2, count: 2)
print(defaultArray,arrayTwo)
var arrayCombine=defaultArray+arrayTwo
print(arrayCombine)


//: modify array
var shoppingList=["Eggs","Apples"]
print("init array: \(shoppingList)")
print("array count: \(shoppingList.count)")
if shoppingList.isEmpty{
    print("array is empty")
}else{
    print("array is not empty")
}
shoppingList.append("Flour")
print("array after append: \(shoppingList)")

shoppingList+=["baker","juice"]
print("array after+=: \(shoppingList)")

var firstItem=shoppingList.first
print("first item: \(firstItem!)")
firstItem=shoppingList[0]
print(("first item by index: \(firstItem!)")) // without the !, we get an Option type

// change items
shoppingList[1...3]=["banana","watermelon","watch"]
print("array after modify: \(shoppingList)")

// insert at index
shoppingList.insert("InsertAt0", at: 0)
print(shoppingList)
// remove at index
shoppingList.remove(at: 0)
print(shoppingList)
// remove last index
shoppingList.removeLast()
print("array removeLast: \(shoppingList)")

//: iterating over an array
for shoplist in shoppingList{
    print(shoplist)
}
// iterate with index
for (index,value) in shoppingList.enumerated(){
    print("Item \(index+1): \(value)")
}

//: # Set
//: a set stores the same type variable with *no ordering*, in set each value can occur at most once(an item must be hashable to be put into a set, which means it must provide a method to calculate its hash value).
//: for custom type, we can comfort it to the *Hashable Protocol* to make it hashable

//: unlike array, we must explicitly use keyword Set to create a set or we don't konw it's an array or set because both array and set use [item]

// create an empty Set
var emptySet=Set<Character>() // Character is a type in Swift
print("emptySet size: \(emptySet.count)")
emptySet.insert("A")
emptySet.insert("B")
emptySet.insert("A")
print(emptySet)
print("emptySet size: \(emptySet.count)")

// create Set with Array
var setByArray:Set<String>=["Rock","Classical","Hip Hop"]
print(setByArray)

//: Access and Modify Set
if setByArray.isEmpty{
    print("Set is empty")
}else {
    print("Set is not empty")
}

//: remove item in set, `if let` is deal with empty value
if let removeItem=setByArray.remove("Rok"){
    print("removed \(removeItem)")
}else{
    print("don't have such item")
}

//: check if have some item
if (setByArray.contains("Rock")){
    print("Have Rock")
}else{
    print("Don't have Rock")
}
setByArray.insert("Ala")
//: loop through a set
for song in setByArray{
    print(song)
}

print("Song sorted:")
for song in setByArray.sorted(){
    print(song)
}

//: Performing set operation
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

let oddUninEven=oddDigits.union(evenDigits)
print("OddUninEven: \(oddUninEven)")

let oddSemetricDiffEven=oddDigits.symmetricDifference(singleDigitPrimeNumbers)
print("symetricDifference: \(oddSemetricDiffEven)")

let oddSustract=oddDigits.subtracting(singleDigitPrimeNumbers)
print("substract: \(oddSustract)")

let oddIntersection=oddDigits.intersection(singleDigitPrimeNumbers)
print("intersection: \(oddIntersection)")

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

print(houseAnimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))
print(farmAnimals.isDisjoint(with: cityAnimals))
print(farmAnimals.isDisjoint(with: houseAnimals))


//: # Dictionary
/*: dict stores <key,value> items with the same type, *no ordering*
 - [type: type]=[:] to create an empty dict
 */
var emptyDict:[Int: String]=[:]
print("empty dict size: \(emptyDict.count)")

// create Dict with dictionary literal
var dictInit:[String:String]=["A":"Apple","B":"Banana"]
print(dictInit)
print(dictInit["A"]!)
if let tryItem=dictInit["C"]{ // try let deal with emtpy value
    print(tryItem)
}else{
    print("NO suc item")
}

// size and emtpy
print("size: \(dictInit.count)")
if(dictInit.isEmpty){
    print("dict is emtpy")
}else{
    print("dict is not empty")
}
// change value
dictInit["A"]="About"
print(dictInit)
if let oldValue=dictInit.updateValue("But", forKey: "B"){
    print("oldValue: \(oldValue)")
}else{
    print("NO such key")
}
print("new dict: \(dictInit)")

//: Iterate through dict
for (dictKey, dictValue) in dictInit{
    print("key: \(dictKey), value: \(dictValue)")
}
for dictKey in dictInit.keys{
    print("key is: \(dictKey)")
}
for dictValue in dictInit.values{
    print("value is: \(dictValue)")
}
