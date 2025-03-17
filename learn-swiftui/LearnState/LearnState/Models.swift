//
//  Models.swift
//  LearnState
//
//  Created by Avilay Parekh on 8/11/23.
//

import Foundation

struct Cookie {
    var flavor: String
    var calories: Int
    
    init() {
        flavor = "Default Cookie"
        calories = 0
    }
    
    init(flavor: String, calories: Int) {
        self.flavor = flavor
        self.calories = calories
    }
    
    func toString() -> String {
        return "Cookie(flavor: \(flavor), calories: \(calories))"
    }
}

class Beverage {
    var name: String
    var price: Double
    
    init() {
        name = "Default Beverage"
        price = 0.0
    }
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
    
    func toString() -> String {
        return "Beverage(\(ObjectIdentifier(self).debugDescription), name: \"\(name)\", price: $\(price.formatted(.number.precision(.fractionLength(2)))))"
    }
}

class Book: ObservableObject {
    @Published var title: String
    @Published var isRead: Bool
    
    init() {
        title = "Default Book"
        isRead = false
    }
    
    init(title: String, isRead: Bool) {
        self.title = title
        self.isRead = isRead
    }
    
    func toString() -> String {
        return "Book(\(ObjectIdentifier(self).debugDescription), title: \(title), isRead: \(isRead))"
    }
}
