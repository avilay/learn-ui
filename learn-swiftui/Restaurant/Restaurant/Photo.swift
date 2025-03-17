//
//  Photo.swift
//  Restaurant
//
//  Created by Avilay Parekh on 7/3/23.
//

import SwiftUI

struct Photo: View {
    @State var tappedPhoto: String
    @Binding var isVisible: Bool
    
    var body: some View {
        ZStack {
            Image(tappedPhoto).resizable().aspectRatio(contentMode: .fit)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isVisible = false
                    } label: {
                        Image(systemName: "x.circle.fill").scaleEffect(2)
                    }.padding()
                }
                Spacer()
            }

        }
    }
}

struct Photo_Previews: PreviewProvider {
    static var previews: some View {
        Photo(tappedPhoto: "gallery1", isVisible: Binding.constant(true))
    }
}
