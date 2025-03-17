//
//  BookDetailView.swift
//  LearnState
//
//  Created by Avilay Parekh on 8/12/23.
//

import SwiftUI

/*
 See EnvObjState view.
 */

struct BookDetailView: View {
    @EnvironmentObject var book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Book Details").font(.title3).foregroundColor(.gray)
            Text("Title: \(book.title)")
            Toggle("Read Book", isOn: $book.isRead)
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView().environmentObject(Book())
    }
}
