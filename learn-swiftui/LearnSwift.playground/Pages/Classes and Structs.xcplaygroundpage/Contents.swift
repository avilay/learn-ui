//: [Previous](@previous)
import Foundation
/*
## Comparing Structures and Classes
Structures and classes in Swift have many things in common. Both can:
  * Define properties to store values
  * Define methods to provide functionality
  * Define subscripts to provide access to their values using subscript syntax
  * Define initializers to set up their initial state
  * Be extended to expand their functionality beyond a default implementation
  * Conform to protocols to provide standard functionality of a certain kind

Classes have additional capabilities that structures don’t have:
  * Inheritance enables one class to inherit the characteristics of another.
  * Type casting enables you to check and interpret the type of a class instance at runtime.
  * Deinitializers enable an instance of a class to free up any resources it has assigned.
  * Reference counting allows more than one reference to a class instance.

The additional capabilities that classes support come at the cost of increased complexity. As a general guideline, prefer structures because they’re easier to reason about, and use classes when they’re appropriate or necessary. In practice, this means most of the custom types you define will be structures and enumerations. For a more detailed comparison, see Choosing Between Structures and Classes.
*/

// Use === to determine if two class instances are pointing to the same underlying object.

class Cookie {
    var flavor: String = ""
    var calories: Int = 0
    
    init(flavor: String) {
        self.flavor = flavor  // Using self only to disambiguate
        
        switch self.flavor {
        case "Chocolate Chip":
            calories = 200
        case "Oatmeal Raisin":
            calories = 180
        case "Snicker Doodle":
            calories = 220
        default:
            calories = -1
        }
    }
    
    // Can also use the deinit to act as dtor
    
    func toString() -> String {
        return "<Cookie(flavor = \(flavor), calories = \(calories))>"
    }
}

var cc = Cookie(flavor: "Chocolate Chip")
print(cc.toString())

// Getters and Setters
class SoftCookie {
    var _flavor: String
    var _calories: Int
    
    init(flavor: String, calories: Int) {
        _flavor = flavor
        _calories = calories
    }
    
    // Default is getter
    var servingSize: Int {
        return _calories / 100
    }
    
    // A setter must also have a getter
    var flavor: String {
        get {
            return _flavor
        }
        set {
            _flavor = newValue
        }
    }
}

var softCookie = SoftCookie(flavor: "Chocolate Chip", calories: 200)
print(softCookie.servingSize)
softCookie.flavor = "Oatmeal Raisin"
print(softCookie.flavor)


// Class heirarchy
class Shape {
    var nSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func toString() -> String {
        return "<Shape(nSides= \(nSides), name = \(name))>"
    }
}

class Quadrilateral : Shape {
    var a: Double
    var b: Double
    var c: Double
    var d: Double
    var theta1: Double
    var theta2: Double
    
    init(name: String, sides: [Double], thetas: [Double]) {
        a = sides[0]
        b = sides[1]
        c = sides[2]
        d = sides[3]
        theta1 = thetas[0]
        theta2 = thetas[1]
        super.init(name: name)
        nSides = 4
    }
    
    func area() -> Double {
        var theta = theta1 + theta2
        var s = (a + b + c + d) / 2
        var a = sqrt((s-a) * (s-b) * (s-c) * (s-d) - a*b*c*d*pow(cos(theta/2), 2))
        return a
    }
    
    var perimeter: Double {
        get {
            return a + b + c + d
        }
        /*
        Can also have a set whose input param is named newValue by default
        set {
            newValue * 4
        }
        */
    }
}

class Square : Quadrilateral {
    var len: Double
    
    init(name: String, len: Double) {
        self.len = len
        super.init(name: name,
                   sides: [len, len, len, len],
                   thetas: [Double.pi/2, Double.pi/2]
        )
    }
    
    override func area() -> Double {
        return pow(len, 2)
    }
}

var quad = Quadrilateral(
    name: "q1",
    sides: [10, 20, 11, 22],
    thetas: [120 * (Double.pi/180), 160 * (Double.pi/180)]
)
var area = quad.area()
print(area)
print(quad.perimeter)

var square = Square(name: "s1", len: 4)
area = square.area()
print(area)
print(square.perimeter)

// Getters and Setters on steroids
// Declare methods which will be called before/after instance variables are set
// using willSet and didSet. Too lazy to write the example here.

struct YummyCookie {
    var flavor: String
    var calories: Int
    
    // Need the mutating keyword to indicate that this method is going to change the struct
    mutating func change(flavor: String, calories: Int) {
        self.flavor = flavor
        self.calories = calories
    }
}

// A memberwise ctor is automatically defined for Structs.
var cookie = YummyCookie(flavor: "Chocolate Chip", calories: 200)

// A default repr is also automatically created for structs
print(cookie)
// Changing the struct here is fine.
cookie.calories = 220
print(cookie)

cookie.change(flavor: "Oatmeal Raisin", calories: 220)
print(cookie)

var copyCookie = cookie
// Now copyCookie and cookie are pointing to two different instances. Contents of cookie were
// copied to a new instance of YummyCookie which was then assigned to copyCookie

// Use of .object syntax as function args with static struct instances
struct PackagedCookie {
    var calories: Int
    var flavor: String
    
    static let chocolateChip = PackagedCookie(calories: 200, flavor: "Chocolate Chip")
    static let snickerDoodle = PackagedCookie(calories: 180, flavor: "Snicker Doodle")
}

func serve(cookie: PackagedCookie) {
    print("Serving some cookies \(cookie)")
}

serve(cookie: .chocolateChip)

//: [Next](@next)
