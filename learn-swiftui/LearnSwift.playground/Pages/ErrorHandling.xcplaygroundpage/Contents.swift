//: [Previous](@previous)

import Foundation

// All user defined errors have to implement the Error protocol. There does not seem to be
// anything special in this protocol though.

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// Function has to have the throws keyword to indicate that it throws errors
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

// try? supresses any thrown errors and returns a nil instead.
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")

// defer keyword will always execute the code block regardless of an exception
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

enum FridgeError: Error {
    case isEmpty
    case doesNotHave
}

func getFromFridge(_ food: String) throws -> String {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    if fridgeContent.contains(food) {
        return food
    } else {
        throw FridgeError.doesNotHave
    }
}

do {
    try getFromFridge("banana")
} catch {
    print(error)
}
print(fridgeIsOpen)
//: [Next](@next)
