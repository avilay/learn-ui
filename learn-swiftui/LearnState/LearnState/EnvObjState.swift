//
//  EnvObjState.swift
//  LearnState
//
//  Created by Avilay Parekh on 8/12/23.
//

import SwiftUI

/*
 ### Usage Scenario:
 When the parent view owns some data - can be editable and wants its entire subtree of views to have access to it
 without having each parent pass it along to its child. Anywhere in the view tree the objects is edited, the changes
 show up in whichever other view the user traverses to.
 
 ### Demo Explanation
 The Content view passes along book, an observable object as an .environmentObject to this view. After that, any
 descendant views from here on onwards get automatic access to this object. See how nothing is explicitly passed to the
 BookDetailView. But if I go to BookDetailView, I'll see that it can just declare book as an @EnvironmentObject and
 start using it.
 */

struct EnvObjState: View {
    @EnvironmentObject var book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(book.toString())
            BookDetailView()
        }
    }
}

struct EnvObjState_Previews: PreviewProvider {
    static var previews: some View {
        EnvObjState().environmentObject(Book())
    }
}
