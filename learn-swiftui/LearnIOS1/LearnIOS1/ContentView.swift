//
//  ContentView.swift
//  LearnIOS1
//
//  Created by Avilay Parekh on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 199/255, green: 168/255, blue: 225/255).ignoresSafeArea()
            VStack {
                Image("bapu_baby")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15.0)
                    .padding(.all)
                Text("Bapu Baby Enjoying Summer")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
