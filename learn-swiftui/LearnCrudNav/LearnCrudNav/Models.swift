//
//  Models.swift
//  LearnCrudNav
//
//  Created by Avilay Parekh on 8/19/23.
//

import Foundation

enum CardSuit: String, CaseIterable, Identifiable {
    case clubs = "Clubs"
    case diamonds = "Diamonds"
    case hearts = "Hearts"
    case spades = "Spades"
    var id: Self {self}
}

struct ItemSummary: Identifiable, Hashable {
    var id: String = ""
    var name: String = ""
    var suit: CardSuit = .hearts
}


struct Item: Identifiable, Hashable {
    var id: String = ""
    var name: String = ""
    var score: Float = 0
    var description: String = ""
    var isImportant: Bool = false
    var suit: CardSuit = .hearts
    
    func summary() -> ItemSummary {
        return ItemSummary(id: id, name: name, suit: suit)
    }
    
    func toString() -> String {
        return """
Item:
  id: \(id)
  name: \(name)
  suit: \(suit.rawValue)
  score: \(score)
  description: \(description)
  isImportant: \(isImportant)
"""
    }
}

class DataService {
    var db: [Item]
    static var instance: DataService?
    
    static func dataService(caller: String = "") -> DataService {
        print("DataService.dataService from \(caller)")
        if instance == nil {
            instance = DataService()
        }
        return instance!
    }
    
    private init() {
        print("DataService.init")
        db = [
            Item(
                id: "5817434C-8C05-4B20-9CAB-5D099F32F1A1",
                name: "bitter-limit",
                score: 83.27,
                description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
""",
                isImportant: true,
                suit: .diamonds
            ),
            Item(
                id: "7C025B1D-ED99-4994-8B84-0B0124455F18",
                name: "autumn-sky",
                score: 2.594,
                description: """
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
""",
                isImportant: false,
                suit: .clubs
            ),
            Item(
                id: "7FC79E86-AE4F-4238-95B3-F82101187555",
                name: "hidden-lab",
                score: 86.94,
                description: """
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
""",
                isImportant: true,
                suit: .hearts
            ),
            Item(
                id: "E0234238-4DD4-4A1C-B4E0-67C29B7E4BA9",
                name: "solitary-sun",
                score: 8.1,
                description: """
Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.
""",
                isImportant: false,
                suit: .spades
            ),
            Item(
                id: "70B19C04-74F5-4BEC-985C-C1F6354DA748",
                name: "restless-sun",
                score: 162.1,
                description: """
Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
""",
                isImportant: false,
                suit: .spades
            ),
        ]
    }
            
    func getPreviewItemSummary() -> ItemSummary {
        return db[0].summary()
    }
    
    func getPreviewItem() -> Item {
        return db[0]
    }
    
    func getItems(caller: String = "") -> [ItemSummary] {
        print("DataService.getItems from \(caller)")
        return db.map { $0.summary() }
    }
    
    func getItem(id: String, caller: String = "") -> Item? {
        print("DataService.getItem from \(caller)")
        return db.first(where: {$0.id == id})
    }
    
    func deleteItem(id: String, caller: String = "") {
        print("DataService.deleteItem \(caller)")
        db.removeAll(where: {$0.id == id})
    }
    
    func addItem(item: Item, caller: String = "") {
        print("DataService.addItem from \(caller)")
        print("Adding - ")
        print(item)
        db.append(item)
    }
    
    func updateItem(item: Item, caller: String = "") {
        print("DataService.updateItem from \(caller)")
        print("Updating -")
        print(item)
        if db.first(where: {$0.id == item.id}) != nil {
            db.removeAll(where: {$0.id == item.id})
            db.append(item)
        }
    }
}
