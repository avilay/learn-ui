//: [Previous](@previous)

import Foundation

/*
Structs are same as the classes in terms of behavior. The biggest difference is that classes
 are passed by reference and structs will be passed by value. The ctor is automatically created
 for structs. There is a default string representation added. Moreover, by default struct properties cannot be changed
 from within the struct.
*/



class PlainCookie {
    var flavor: String
    var calories: Int
    
    // Compiler error if init is not defined
    init(flavor: String, calories: Int) {
        self.flavor = flavor
        self.calories = calories
    }
}

var pc = PlainCookie(flavor: "Chocolate Chip", calories: 200)
// No default repr implementation
print(pc)





//: [Next](@next)
