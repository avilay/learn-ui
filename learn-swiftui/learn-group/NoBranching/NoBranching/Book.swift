//
//  Book.swift
//  NoBranching
//
//  Created by Avilay Parekh on 8/27/23.
//

import Foundation

class Book: ObservableObject {
    @Published var title: String
    @Published var isRead: Bool
    
    init() {
        title = "Default Title"
        isRead = false
    }
    
    init(title: String, isRead: Bool) {
        self.title = title
        self.isRead = isRead
    }
    
    func toString() -> String {
        return "<Book(title: \(title), isRead: \(isRead)>"
    }
}
