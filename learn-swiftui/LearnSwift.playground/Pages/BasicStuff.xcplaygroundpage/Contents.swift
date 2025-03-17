//: [Previous](@previous)
import Foundation

print("Hello, World!")

// Type inference
// let means immutable
let myConst = 42
//myConst += 10

var myVar = 10
myVar += 10

// Explicit type declaration
let learningRate: Double = 0.0002

// Another way to declare type
let lrSchedule = 10 as Float

// To get the type of a variable use the type function
// The type of typeOfMyVar will be Int.Type
var typeOfMyVar = type(of: myVar)

// String interpolation
print("The value of myConst is \(myConst) which is a constant.")

// Arrays
var myList = ["strawberries", "limes", "tangerines"]
myList[1] = "grapes"
//var tp = myList[10] --> Fatal error: Index out of range
myList.append("apples")
print(myList)

// Declare an empty array is only possible with an explicit type decl
var empty: [Int] = []
var anotherWayToDeclareEmpty: [Int] = [Int]()

// Can set an existing variable to an empty array because the type
// has already been inferred.
myList = []

// Possible to have arrays with heterogenous types, just need to explicitly declare the type
// as Any, without explicit type decl it won't work.
// ary = ["strawberries", 10, 3.14] --> wont work
var ary = ["strawberry", 1.1, 10] as [Any]
var ary2: [Any] = ["strawberry", 1.1, 10]


// Dictionaries
var myDict = [
    "One": 1,
    "Two": 2
]
myDict["Two"] = 4

// This will be nil
var three = myDict["Three"]

// A dict always returns an optional
// So whenever I am using a dict, I need to follow all the safety rules of dealing with optionals.
print(type(of: myDict["One"]))

// Declare an empty dict
var emptyDict: [String: Int] = [:]

// Control Flow
var scores = [75, 43, 103, 87, 12]
var numHighScores = 0
var numLowScores = 0
for score in scores {
    if score > 50 {
        numHighScores += 1
    } else {
        numLowScores += 1
    }
}

var stockPrices = [
    "MSFT": 258.06,
    "META": 172.88,
    "U": 39.67
]
for (stock, price) in stockPrices {
    print(stock, price)
}

var n = 2
while n < 100 {
    n *= 2
}

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// this is interval [0, 4) just like python
for i in 0..<4 {
    print("This is the range op: ", i)
}

// this is internval [0, 4]
for i in 0...4 {
    print("This is the range op: ", i)
}

// To go in reverse
for i in stride(from: 3, to: 0, by: -1) {
    print(i)
}


let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


print("\n\n")
// Gaurd statements provide an elegant way to check for pre-conditions
func cookieJar(numCookies: Int) {
    guard numCookies > 0 else {
        print("Cookie jar cannot have negative number of cookies.")
        return
    }
    print("There are \(numCookies) cookies in the cookie jar.")
}

cookieJar(numCookies: -10)

// It can also be used as a walrus op
func cookieJar_2(kwargs: [String: Any]) {
    guard let numCookies = kwargs["numCookies"] else {
        print("Must provide number of cookies in the cookie jar.")
        return
    }
    print("There are \(numCookies) cookies in the cookie jar.")
}

cookieJar_2(kwargs: ["numCookies": 10])


//: [Next](@next)
