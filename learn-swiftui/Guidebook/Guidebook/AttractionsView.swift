//
//  AttractionsView.swift
//  Guidebook
//
//  Created by Avilay Parekh on 7/4/23.
//

import SwiftUI

struct AttractionsView: View {
    var city: City
    
    var body: some View {
//        List(city.attractions) { attraction in
//            NavigationLink {
//                AttractionDetailsView(attraction: attraction)
//            } label: {
//                AttractionView(attraction: attraction)
//            }
//        }
//        .navigationTitle(city.name)
        ScrollView {
            VStack {
                ForEach(city.attractions) {attraction in
                    NavigationLink {
                        AttractionDetailsView(attraction: attraction)
                    } label: {
                        AttractionView(attraction: attraction).padding(.bottom)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .navigationTitle(city.name)
        .padding([.top, .horizontal])
    }
}

struct AttractionsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AttractionsView(city: DataService().cities[0])
        }
    }
}
