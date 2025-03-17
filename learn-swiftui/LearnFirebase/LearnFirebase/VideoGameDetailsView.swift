//
//  VideoGameDetailsView.swift
//  LearnFirebase
//
//  Created by Avilay Parekh on 9/1/23.
//

import SwiftUI

/*
 @DocumentID var id: String?
 var title: String
 var publishedBy: String
 var developedBy: String
 var releaseDate: Date
//    var genre: Genre
 var rating: Float
 var numReviews: Int
 var price: Float
 var isOnPc: Bool
 var thumbnailPath: String
 var description: String
 */

struct VideoGameDetailsView: View {
    @State var videoGame: VideoGame
    
    func dateToString(_ date: Date) -> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .none
        return df.string(from: date)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("ID: \(videoGame.id!)").font(.caption).foregroundColor(.gray)
                Text(videoGame.title).font(.title2)
                Text("Releasing on \(dateToString(videoGame.releaseDate))")
                HStack {
                    Text("\(videoGame.rating, specifier: "%.1f") stars")
                    Text("\(videoGame.numReviews) reviews")
                }
                Text(videoGame.genre?.name ?? "")
                Text("Publisher: \(videoGame.publishedBy)")
                Text("Developer: \(videoGame.developedBy)")
                HStack {
                    Text("$\(videoGame.price, specifier: "%.2f")")
                    if videoGame.isOnPc {
                        Text("Also available on the PC!")
                    }
                }
                Text(videoGame.thumbnailPath)
                Text(videoGame.description)
            }
            .padding()
        }
    }
}

struct VideoGameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoGameDetailsView(videoGame: PreviewHelper.getDefaultVideoGame())
    }
}
