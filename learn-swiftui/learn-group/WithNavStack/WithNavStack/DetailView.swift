//
//  DetailView.swift
//  WithNavStack
//
//  Created by Avilay Parekh on 8/27/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(book.title).font(.title)
            Toggle("Read Status", isOn: $book.isRead)
        }
        .padding(20)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: Book(title: "Book Title Here", isRead: true))
    }
}
