//
//  ObservedObjectView.swift
//  LearnState
//
//  Created by Avilay Parekh on 8/12/23.
//

import SwiftUI

/*
 ### Usage Scenario:
 When the parent view owns some editable data, i.e., has instantiated it somehow, and passes it along to a child view
 where it can also be edited. Not only do I want the child view to be refreshed whenever the user edits the data, I want
 the changes made in the child view reflect back in the parent view. Moreover, if this object is passed from the parent
 view to *another* child view, the changes will be reflected in the other child as well.
 
 ### Demo Explanation:
 The Book class implements the ObservableObject protocol. It is then declared as a @StateObject in the parent view. When
 passed to the child ObservedObjectView view, it is accepted as an @ObservedObject. Now any changes made to @Published
 properties of the class will be reflected both in the child as well as the parent views. This can be seen if toggle the
 read book, this view will immediately update to reflect this. And if I "Log objects" I'll see that the parent object
 has also changed. When I go back to the parent view, I'll see the changes reflected in the UI.
 
 Now if I go the another child ObservedObjectView2 view, I'll see the change reflected there as well. I can change the
 title of the book there and the changes are reflected in the entire view tree.
 */

struct ObservedObjectView: View {
    @ObservedObject var book: Book
        
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Observed Object View 1").font(.title).foregroundColor(.gray)
            Text(book.toString())
            Toggle("Read Book", isOn: $book.isRead)
        }
        .padding([.leading, .trailing], 30)
    }
}

struct ObservedObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectView(book: Book())
    }
}
