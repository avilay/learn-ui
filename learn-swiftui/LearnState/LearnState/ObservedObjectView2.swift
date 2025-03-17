//
//  ObservedObjectView2.swift
//  LearnState
//
//  Created by Avilay Parekh on 8/12/23.
//

import SwiftUI

/*
 See docstring of ObservedObjectView.
 */

struct ObservedObjectView2: View {
    @ObservedObject var book: Book
        
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Observed Object View 2").font(.title).foregroundColor(.gray)
            Text("Book id is \(ObjectIdentifier(book).debugDescription)")
            TextField("Title", text: $book.title).border(.secondary)
            if book.isRead {
                Text("is read")
            } else {
                Text("not read yet")
            }
        }
        .padding([.leading, .trailing], 30)
    }
}

struct ObservedObjectView2_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectView2(book: Book())
    }
}
