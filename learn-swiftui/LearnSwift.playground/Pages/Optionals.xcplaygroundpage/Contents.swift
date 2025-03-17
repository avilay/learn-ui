//: [Previous](@previous)

import Foundation

// ? indicates that cookie is nullable
var cookie: String? = "Oatmeal Raisin"

// I can play with fire by using the trailing !. This is called unwrapping.
// If cookie is NULL it will throw a null pointer exception at runtime, otherwise it will just work.
print("Unwrapped cookie: ", cookie!)

// Of course a safer way to do this is to first check for NULL.
// There is no special syntax to check for NULL, just use the == or the != op
if cookie != nil {
    // Yes, this might look like I am playing with fire, but I am pretty sure that cookie is not nil
    print("Safely unwrapped cookie: ", cookie!)
} else {
    print("No cookie for you")
}

// I can use the walrus operator to check for nil
if let readyToEat = cookie {
    print("Walrus op cookie: ", readyToEat)
} else {
    print("No cookie for you")
}

// I can also reuse the variable name
if let cookie = cookie {
    print("Walrus op with name reuse cookie: ", cookie)
} else {
    print("No cookie for you")
}

// A short form of reusing the variable name is to omit is completely
if let cookie {
    print("Short form walrus op cookie: ", cookie)  // No need to unwrap
} else {
    print("No cookie for you")
}

// If I am accessing a member method or property, then I can use ? as suffix. This will ensure that if the variable
// is pointing to a nil then invocation result will also be nil. Normally, String.count returns an Int, but in this
// case it will return an optional Int?
var len = cookie?.count
print(type(of: len))
if let len {
    print("Length of cookie is \(len)")
} else {
    print("Cookie is nil")
}

// ?? is a way of saying if not cookie: return "Chocolate Chip Cookie" else return cookie
var readyCookie = cookie ?? "Chocolate Chip"
print(cookie ?? "No cookie for you")

// Alternately the variable can be born of fire, by using the trailing ! instead of ? in the type decl.
// Now I don't need to unwrap it when using it.
var biscuit: String! = "Parle G"
print(biscuit!)
// This might seem like a silly thing to do, but it is useful in this one obscure scenario where I want to use two way unowned references - from one object to another and back again.


//: [Next](@next)
