//: [Previous](@previous)

import Foundation

// Enums are a type in their own right. The cases can be on separate line like enums
// in other languages

enum Compiler {
    case clang
    case gcc
    case gpp
    case msbuild
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print(heartsDescription)

// If I want Python like enum behavior where each value corresponds to an integer
// Enums that are derived from other types like this have a .rawValue property that
// returns the underlying type's value.
enum Day: Int {
    case today
    case yesterday
    case dayBeforeYesterday
}

var day = Day.today
print(day.rawValue)  // Will print 0
// Of course I can use this trick to derive enum from any type.

// For enums derived from Strings, the raw value is the case name
enum CardSuit: String {
    case clubs, diamonds, hearts, spades
}
print(CardSuit.clubs.rawValue)  // Will print "clubs"


// Apparently the use case to iterate through all the possible enum values is pretty common so
// Swift has a a protocol that does this -
enum Direction: CaseIterable {
    case north, south, east, west
}

for dir in Direction.allCases {
    print(dir)
}

/*
 # Use of .object syntax as function args
 Lets say I have a function that takes in an enum, then instead of typing out the full Compiler.clang, I can just
 type .clang. Swift will figure out from the context what I mean.
*/
func compile(code: String, with: Compiler) {
    print("Compiling \(code) with \(with) compiler")
}

compile(code: "int main(){}", with: .clang)

// Set the raw value to something other than the case name
enum Genre: String {
    case ACTION_ADVENTURE = "Action & Adventure"
    case FIGHTING = "Fighting"
    case SHOOTER = "Shooter"
    case SIMULATION = "Simulation"
    case FAMILY_KIDS = "Family & Kids"
    case PUZZLE_TRIVIA  = "Puzzle & Trivia"
    case ROLE_PLAYING = "Role playing"
}

print(Genre.ACTION_ADVENTURE.rawValue)


//: [Next](@next)
