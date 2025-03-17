//
//  AttractionDetailsView.swift
//  Guidebook
//
//  Created by Avilay Parekh on 7/4/23.
//

import SwiftUI

struct AttractionDetailsView: View {
    var attraction: Attraction
    
    func cleanName(_ name: String) -> String {
        return name
            .replacingOccurrences(of: " ", with: "+")
            .folding(options: .diacriticInsensitive, locale: .current)
    }
    
    func cleanCoords(_ latLong: String) -> String {
        return latLong.replacingOccurrences(of: " ", with: "")
    }
    
    var body: some View {
        VStack {
            Image(attraction.imageName).resizable().aspectRatio(contentMode: .fill).frame(height: 300).padding(.bottom)
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    Text(attraction.longDescription).multilineTextAlignment(.leading)
                    let url = "maps://?q=\(cleanName(attraction.name))&sll=\(cleanCoords(attraction.latLong))&z=10&t=s"
                    if let mapUrl = URL(string: url) {
                        if UIApplication.shared.canOpenURL(mapUrl) {
                            Button("Get Directions") {
                                UIApplication.shared.open(mapUrl)
                            }.buttonStyle(.borderedProminent).padding(.top)
                        }
                    }
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .navigationTitle(attraction.name)
        .padding(.top)
    }
}

struct AttractionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AttractionDetailsView(attraction: DataService().cities[0].attractions[0])
        }
    }
}
