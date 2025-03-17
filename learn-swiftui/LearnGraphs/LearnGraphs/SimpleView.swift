//
//  SimpleView.swift
//  LearnGraphs
//
//  Created by Avilay Parekh on 7/28/23.
//

import SwiftUI
import Charts

struct ToyShape: Identifiable {
    var id = UUID()
    var type: String
    var count: Float
}


struct SimpleView: View {
    var data: [ToyShape] = [
        .init(type: "Cube", count: 5),
        .init(type: "Sphere", count: 4),
        .init(type: "Pyramid", count: 4)
    ]
    
    var body: some View {
        Chart {
            ForEach(data) { toy in
                BarMark(x: .value("Shape Type", toy.type), y: .value("Total Count", toy.count))
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct SimpleView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleView()
    }
}
