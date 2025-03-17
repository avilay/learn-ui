//
//  City.swift
//  Guidebook
//
//  Created by Avilay Parekh on 7/3/23.
//

import Foundation

struct City: Identifiable, Decodable {
    let id: UUID = UUID()
    var name: String
    var summary: String
    var imageName: String
    var attractions: [Attraction]
}
