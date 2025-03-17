//
//  UnreadView.swift
//  WithIf
//
//  Created by Avilay Parekh on 8/27/23.
//

import SwiftUI

struct UnreadView: View {
    @ObservedObject var book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(book.title).font(.title)
            Text("You need to catch up to your reading!")
            Toggle("Read Status", isOn: $book.isRead)
        }
        .foregroundColor(.purple)
        .padding(20)
    }
}

struct UnreadView_Previews: PreviewProvider {
    static var previews: some View {
        UnreadView(book: Book(title: "Book Title", isRead: false))
    }
}
