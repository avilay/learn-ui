//
//  Models.swift
//  LearnFirebase
//
//  Created by Avilay Parekh on 9/1/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Genre: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    var name: String
}

struct VideoGame: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    var title: String
    var publishedBy: String
    var developedBy: String
    var releaseDate: Date
    var genreRef: DocumentReference?
    var genre: Genre?
    var rating: Float
    var numReviews: Int
    var price: Float
    var isOnPc: Bool
    var thumbnailPath: String
    var description: String
}

struct PreviewHelper {
    static func getDefaultVideoGame() -> VideoGame {
        VideoGame(
            id: UUID().uuidString,
            title: "Default Title Here",
            publishedBy: "Default Publisher Here",
            developedBy: "Default Develoepr Here",
            releaseDate: Date.now,
            genre: Genre(id: UUID().uuidString, name: "Action & Adventure"),
            rating: 4.2,
            numReviews: 234,
            price: 19.99,
            isOnPc: true,
            thumbnailPath: "./path/here",
            description: "Here is a long long description of what this video game does."
        )
    }
}

class DataService {
    var db = Firestore.firestore()
    
    func fetchGenres() async -> [Genre] {
        do {
            var genres: [Genre] = []
            let ref = try await db.collection("videogame_genres").getDocuments()
            for snapshot in ref.documents {
                let genre = try snapshot.data(as: Genre.self)
                genres.append(genre)
            }
            return genres
        } catch {
            print(error, error.localizedDescription)
            return []
        }
    }
    
    func fetchVideoGames() async -> [VideoGame] {
        do {
            var videoGames: [VideoGame] = []
            let ref = try await db.collection("videogames").getDocuments()
            for snapshot in ref.documents {
                let decoder = Firestore.Decoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                var videoGame = try snapshot.data(as: VideoGame.self, decoder: decoder)
                videoGame.genre = try await videoGame.genreRef?.getDocument(as: Genre.self)
                videoGames.append(videoGame)
            }
            return videoGames
        } catch {
            print(error, error.localizedDescription)
            return []
        }
    }
}
