//
//  GenresView.swift
//  LearnFirebase
//
//  Created by Avilay Parekh on 9/1/23.
//

import SwiftUI

struct GenresView: View {
    @State var genres: [Genre]?
    
    var body: some View {
        Group {
            if let genres {
                List(genres) { genre in
                    Text(genre.name)
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            let db = DataService()
            Task {
                genres = await db.fetchGenres()
            }
        }
    }
}

struct GenresView_Previews: PreviewProvider {
    static var previews: some View {
        GenresView()
    }
}
