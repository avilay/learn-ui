//
//  GalleryView.swift
//  Restaurant
//
//  Created by Avilay Parekh on 7/1/23.
//

import SwiftUI

struct GalleryView: View {
    @State var photos: [String] = []
    @State var isVisible = false
    @State var tappedPhoto = ""
    
    var dataService = DataService()
    
    var colGutter = 10.0
    var rowGutter = 10.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gallery").font(.largeTitle).bold()
            
            GeometryReader { proxy in
                let numCols: Double = 3
                let totalGutter = colGutter * (numCols - 1)
                let maxWidth: Double = (proxy.size.width - totalGutter) / numCols
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(spacing: colGutter), GridItem(spacing: colGutter), GridItem(spacing: colGutter)], spacing: rowGutter) {
                        ForEach(photos, id: \.self) { photo in
                            Image(photo)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: maxWidth)
                                .clipped()
                                .onTapGesture {
                                    isVisible = true
                                    tappedPhoto = photo
                                }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            photos = dataService.photos
        }
        .sheet(isPresented: $isVisible) {
            Photo(tappedPhoto: tappedPhoto, isVisible: $isVisible)
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
