//
//  CitiesView.swift
//  Guidebook
//
//  Created by Avilay Parekh on 7/4/23.
//

import SwiftUI

struct CitiesView: View {
    @State var cities: [City] = []
    var dataService = DataService()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(cities) { city in
                    NavigationLink {
                        AttractionsView(city: city)
                    } label: {
                        CityView(city: city).padding(.bottom)
                    }
                }
            }
            .navigationTitle("Guidebook")
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
        }
        .onAppear {
//            cities = dataService.cities
            cities = dataService.fetchCities()
        }
    }
}

struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
    }
}
