//
//  AttractionView.swift
//  Guidebook
//
//  Created by Avilay Parekh on 7/4/23.
//

import SwiftUI

struct AttractionView: View {
    var attraction: Attraction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(attraction.imageName).resizable().aspectRatio(contentMode: .fill).frame(height: 120).cornerRadius(15)
            Text(attraction.name).font(.title).bold()
            Text(attraction.summary).multilineTextAlignment(.leading)
        }
    }
}

struct AttractionView_Previews: PreviewProvider {
    static var previews: some View {
        AttractionView(attraction: DataService().cities[0].attractions[0])
    }
}
