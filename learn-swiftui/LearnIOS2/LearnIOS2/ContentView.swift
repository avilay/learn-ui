//
//  ContentView.swift
//  LearnIOS2
//
//  Created by Avilay Parekh on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemMint).ignoresSafeArea()
        
            // Leading alignment left aligns all the widgets inside the VStack.
            // Spacing adds some spacing in between two adjacent widgets.
            
            // Padding modifier is add padding in between the container boundary and other visible widgets.
            // I can put this VStack inside a rectangle but using the background modifier. I pass in the Rectangle object
            // as the background.
            // Order of these modifiers matters. The first padding adds some padding between the VStack contents and the
            // background. The second padding adds some padding between the background and the VStack boundary.
            VStack(alignment: .leading, spacing: 20.0) {
                Image("mount_ranier").resizable().aspectRatio(contentMode: .fit).cornerRadius(15)
                
                HStack {
                    Text("Mount Ranier")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Spacers are interesting. They will calculate the total empty space and then divide it evenly
                    // amongst themselves. Below I just have a single Spacer element, so it will be insert itself
                    // between the text and images resulting in these widgets being pushed away as far as possible
                    // from each other.
                    Spacer()
                    
                    VStack {
                        HStack {
                            // Icons in iOS apps come from a desktop app called SF Symbols. I can search for icons and
                            // its corresponding `systemName` keyword.
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.leadinghalf.filled")
                        }
                        Text("Reviews 361")
                    }.foregroundColor(.orange).font(.caption)
                }
                
                Text("Come visit for an experience of a lifetime!")
                
                HStack {
                    Spacer()
                    Image(systemName: "binoculars.fill")
                    Image(systemName: "fork.knife")
                }.foregroundColor(.gray).font(.caption)
                
            }
                .padding()
                .background(
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 15)
                )
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
