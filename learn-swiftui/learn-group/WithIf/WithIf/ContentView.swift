//
//  ContentView.swift
//  WithIf
//
//  Created by Avilay Parekh on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var book = Book(title: "Thinking Fast and Slow", isRead: true)
    
    var body: some View {
        if book.isRead {
            ReadView(book: book)
        } else {
            UnreadView(book: book)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(book: Book())
    }
}
