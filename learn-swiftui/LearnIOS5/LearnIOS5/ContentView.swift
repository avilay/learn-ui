//
//  ContentView.swift
//  LearnIOS5
//
//  Created by Avilay Parekh on 7/4/23.
//

import SwiftUI

struct ContentView: View {
    @State var nClicks = 0
    
    func onButtonClick() {
        nClicks += 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Button clicked \(nClicks) times.")
            
            Button("Default", action: onButtonClick) // Uses the .automatic style
            Button("Bordered", action: onButtonClick).buttonStyle(.bordered)
            Button("Bordered Prominent", action: onButtonClick).buttonStyle(.borderedProminent)
            Button("Borderless", action: onButtonClick).buttonStyle(.borderless)
            // Button("Card", action: onButtonClick).buttonStyle(.card) .card is unavailable in iOS
            // Button("Bordered", action: onButtonClick).buttonStyle(.link) .link is unavailable in iOS
            Button("Plain", action: onButtonClick).buttonStyle(.plain)  // no style is applied at all
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
