//
//  CityView.swift
//  Guidebook
//
//  Created by Avilay Parekh on 7/4/23.
//

import SwiftUI

struct CityView: View {
    var city: City
    
    var body: some View {
        ZStack {
            Rectangle().background {
                Image(city.imageName).resizable().aspectRatio(contentMode: .fill)
            }
            .foregroundColor(.clear)
            .cornerRadius(15)
            
            Rectangle().foregroundColor(.black).opacity(0.5).cornerRadius(15)
            
            VStack(alignment: .leading) {
                Text(city.name).font(.title).bold()
                Spacer()
                Text(city.summary).multilineTextAlignment(.leading)
            }
            .padding()
            .foregroundColor(.white)
        }
        .frame(height: 400)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(city: DataService().cities[0])
    }
}
