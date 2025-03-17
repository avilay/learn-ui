//
//  VideoGamesView.swift
//  LearnFirebase
//
//  Created by Avilay Parekh on 9/1/23.
//

import SwiftUI

struct VideoGamesView: View {
    @State var videoGames: [VideoGame]?
    
    var body: some View {
        NavigationStack {
            if let videoGames {
                Group {
                    List(videoGames) { videoGame in
                        NavigationLink(videoGame.title, value: videoGame)
                    }
                }
                .navigationDestination(for: VideoGame.self, destination: { videoGame in
                    VideoGameDetailsView(videoGame: videoGame)
                })
            } else {
                ProgressView()
            }
        }
        .onAppear {
            let db = DataService()
            Task {
                videoGames = await db.fetchVideoGames()
            }
        }
    }
}

struct VideoGamesView_Previews: PreviewProvider {
    static var previews: some View {
        VideoGamesView()
    }
}
