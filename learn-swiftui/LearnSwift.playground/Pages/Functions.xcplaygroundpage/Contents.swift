//: [Previous](@previous)
var tp: String = ""

// This function can only be invoked using keyword args **in order** of declaration
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
// greet(day: "Saturday", person: "Anu") will not work.

tp = greet(person: "Anu", day: "Sunday")
// greet("Anu", "Sunday") --> This will raise compiler error

// This function can only be invoked using positional args
func sayGreet(_ person: String, _ day: String) -> String {
    return "Hello \(person), today is \(day)"
}

tp = sayGreet("Anu", "Sunday")
// tp = sayGreet(person: "Anu", day: "Sunday") --> Compiler error

// This function is a mix of positional and keyword args
func sayHello(_ person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}

tp = sayHello("Anu", day: "Sunday")

// This function has a custom label for its named args
func greetings(person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}

tp = greetings(person: "Anu", on: "Sunday")

// This function has default parameter values
func greet(greeting: String = "hello", name: String) {
    print("\(greeting), \(name)!")
}

greet(name: "Anu")

// Function can return another function
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var adder = makeIncrementer()
adder(100)

func doNothing() {
    print("doing nothing")
}

doNothing()

func doNothingStill() -> Void {
    print("still doing nothing")
}

doNothingStill()

// Function taking another function as input param
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

var powersOfTwo = [0, 2, 4, 8, 16, 32]
var isBig = hasAnyMatches(list: powersOfTwo, condition: {$0 > 20})

/* Lambdas called Closures in Swift */
var numbers = [20, 19, 7, 12]

// Full form way of declaring lambda
var tpList = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

// If the type of the lambda (input and output) can be
// inferred then no need to specify
let mappedNumbers = numbers.map({ number in 3 * number })

// Can use numbered args
// If the lambda is the sole argument, no need for parens
var sortedNumbers = numbers.sorted { $0 > $1 }

// A more common invocation is
var reversed = numbers.sorted { m, n in m > n}

print(tp)

let x = 10
let y = 20

func doSomething(_ op: (Int, Int) -> Int) -> String {
    if op(x, y) > 20 {
        return "Greater than 20"
    } else {
        return "Less than equal to 20"
    }
}

// Full form
var a = doSomething({(i: Int, j: Int) -> Int in return i + j})
print(a)

// Type inference and lose the return keyword
a = doSomething({(i, j) in i + j})
print(a)

// Numbered args
a = doSomething({$0 + $1})
print(a)

// Lose the parens
a = doSomething {$0 + $1}
print(a)

func calculate(_ op: () -> Int) {
    if op() > 20 {
        print("Greater than 20")
    } else {
        print("Less than or equal to 20")
    }
}

// Type inference and lose the return statement
calculate {15}

// Even more weird closure syntax
func doNothing(_ f1: () -> Void, f2: () -> Void) -> Void {
    f1()
    f2()
}

doNothing({print("hello")}, f2: {print("world")})

doNothing {print("hello")} f2: {print("world")}


//: [Next](@next)
