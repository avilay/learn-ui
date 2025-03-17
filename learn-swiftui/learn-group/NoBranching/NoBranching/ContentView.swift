//
//  ContentView.swift
//  NoBranching
//
//  Created by Avilay Parekh on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var book = Book(title: "Thinking Fast and Slow", isRead: true)
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text(book.toString())
                NavigationLink("Details") {
                    DetailView(book: book)
                }
            }.navigationTitle(Text("Content View"))            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(book: Book())
    }
}
