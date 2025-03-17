//
//  MenuItem.swift
//  Restaurant
//
//  Created by Avilay Parekh on 7/1/23.
//

import Foundation

struct MenuItem: Identifiable {
    var id: UUID = UUID()
    var name: String
    var price: String
    var imageName: String
}
