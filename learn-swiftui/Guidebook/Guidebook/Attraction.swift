//
//  Attraction.swift
//  Guidebook
//
//  Created by Avilay Parekh on 7/3/23.
//

import Foundation

struct Attraction: Identifiable, Decodable {
    let id: UUID = UUID()
    var name: String
    var summary: String
    var longDescription: String
    var imageName: String
    var latLong: String
}
