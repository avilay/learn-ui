//
//  ContentView.swift
//  WithGroup
//
//  Created by Avilay Parekh on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var book = Book(title: "Thinking Fast and Slow", isRead: true)
    
    var body: some View {
        Group {
            if book.isRead {
                ReadView(book: book)
            } else {
                UnreadView(book: book)
            }
        }
        .onAppear {
            print("ContentView.onAppear")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(book: Book())
    }
}
