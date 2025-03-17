//
//  ReadView.swift
//  WithVStack
//
//  Created by Avilay Parekh on 8/27/23.
//

import SwiftUI

struct ReadView: View {
    @ObservedObject var book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(book.title).font(.title)
            Text("Good job finishing this book!")
            Toggle("Read Status", isOn: $book.isRead)
        }
        .foregroundColor(.mint)
        .padding(20)
    }
}

struct ReadView_Previews: PreviewProvider {
    static var previews: some View {
        ReadView(book: Book(title: "Book Title Here", isRead: true))
    }
}
