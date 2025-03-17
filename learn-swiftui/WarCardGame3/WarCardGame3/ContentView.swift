//
//  ContentView.swift
//  WarCardGame3
//
//  Created by Avilay Parekh on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card2"
    @State var cpuCard = "card10"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background-plain").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            VStack() {
                Spacer()
                Image("logo")
                Spacer()
                HStack() {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                // Button has many different constructors. This one takes into two functions as input, the first one is
                // the event which takes in no params and outputs nothing, i.e., () -> Void, the second one takes in
                // no input params but outputs a View object, i.e., () -> View. Note the use of closure syntax here.
                Button(
                    action: deal,
                    label: {Image("button")}
                )
                Spacer()
                HStack() {
                    Spacer()
                    VStack() {
                        Text("Player").font(.headline).padding(.bottom, 10)
                        Text(String(playerScore)).font(.largeTitle)
                    }
                    Spacer()
                    VStack() {
                        Text("CPU").font(.headline).padding(.bottom, 10)
                        Text(String(cpuScore)).font(.largeTitle)
                    }
                    Spacer()
                }.foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    func deal() {
        var playerCardNumber = Int.random(in: 2...14)
        var cpuCardNumber = Int.random(in: 2...14)
        
        if playerCardNumber > cpuCardNumber {
            playerScore += 1
        } else if playerCardNumber < cpuCardNumber {
            cpuScore += 1
        }
        
        playerCard = "card" + String(playerCardNumber)
        cpuCard = "card" + String(cpuCardNumber)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
