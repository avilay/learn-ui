//
//  UnreadView.swift
//  WithNavStack
//
//  Created by Avilay Parekh on 8/27/23.
//

import SwiftUI

struct UnreadView: View {
    @StateObject var book = Book(title: "Thinking Fast and Slow", isRead: false)
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(book.title).font(.title)
                Text("You need to catch up to your reading!")
                Toggle("Read Status", isOn: $book.isRead)
            }
            .navigationDestination(isPresented: $book.isRead, destination: {
                ReadView(book: book)
            })
            .foregroundColor(.purple)
            .padding(20)
        }
    }
}

struct UnreadView_Previews: PreviewProvider {
    static var previews: some View {
        UnreadView(book: Book(title: "Book Title", isRead: false))
    }
}
