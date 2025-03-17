//
//  GroupedView.swift
//  LearnGraphs
//
//  Created by Avilay Parekh on 7/28/23.
//

import SwiftUI
import Charts

struct ToyShapeColor: Identifiable {
    var id = UUID()
    var color: String
    var type: String
    var count: Float
}

struct GroupedView: View {
    var data: [ToyShapeColor] = [
        .init(color: "Green", type: "Cube", count: 2),
        .init(color: "Purple", type: "Cube", count: 1),
        .init(color: "Pink", type: "Cube", count: 1),
        .init(color: "Yellow", type: "Cube", count: 1),
        
        .init(color: "Green", type: "Sphere", count: 0),
        .init(color: "Purple", type: "Sphere", count: 1),
        .init(color: "Pink", type: "Sphere", count: 2),
        .init(color: "Yellow", type: "Sphere", count: 1),
        
        .init(color: "Green", type: "Pyramid", count: 1),
        .init(color: "Purple", type: "Pyramid", count: 1),
        .init(color: "Pink", type: "Pyramid", count: 0),
        .init(color: "Yellow", type: "Pyramid", count: 2),
    ]
    
    var body: some View {
        Chart {
            ForEach(data) { toy in
                BarMark(
                    x: .value("Toy Type", toy.type),
                    y: .value("Total Count", toy.count)
                )
                .foregroundStyle(by: .value("Toy Color", toy.color))
            }
        }
        .chartForegroundStyleScale(["Green": .green, "Purple": .purple, "Pink": .pink, "Yellow": .yellow])
        .frame(width: 300, height: 300)
    }
}

struct GroupedView_Previews: PreviewProvider {
    static var previews: some View {
        GroupedView()
    }
}
