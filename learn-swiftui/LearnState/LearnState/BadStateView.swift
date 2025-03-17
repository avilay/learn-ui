//
//  BadStateView.swift
//  LearnState
//
//  Created by Avilay Parekh on 8/11/23.
//

import SwiftUI

/*
 ### Bad Smells
 When a bare class obejct from the parent view is passed in as an editable @State object to the child view. Any changes
 made to the object in the child view will not be reflected in the child view, but will be reflected in the parent view.
 
 When an observable class object declared as a @StateObject in the parent view is passed in as another @StateObject in
 the child view. The object is supposed to re-instantiated every time the child view is loaded, but I have not been able
 to verify this behavior experimentally.
 
 ### Demo Explanation
 It is a bad idea to declare a class as a @State object. Changes made to the object will not refresh the view, so I'll
 still see the old values. See this by clicking "Decrease Price", the view will not reflect the decreased price. However
 the actual class does change. If I "Log Beverage" then I'll see that the price has changed. The object has also
 changed in the parent view. If I "Log objects" then I'll see this. This is because the object being a class type was
 passed by reference, so any changes made anywhere are reflected.
 
 However, if I change the actual object here, where the variable points to completely different object on the stack,
 that will refresh the view. This is because the object is still a @State variable and the actual object being
 referenced has changed. See this by clicking the "Change Object" button. However, now this variable is completely
 disassociated from the main view's object. If I "Log objects" now, it will still show the old beverage.
 
 It is also a bad idea to pass a @StateObject from the main view as a @StateObject in the child view. According to some
 stuff I read, a new object will be instantiated in the child view. However, I don't actually see that happening.
 Compare the object identifier in this view with the main view's object identifier printed by "Log objects".
 */

struct BadStateView: View {
    @State var beverage: Beverage
    @StateObject var book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(beverage.toString())
            
            Button {
                beverage.price -= 0.5
            } label: {
                Label("Decrease Price", systemImage: "minus.circle")
            }
            .buttonStyle(.bordered)
            
            Button {
                print(beverage.toString())
            } label: {
                Label("Log Beverage", systemImage: "doc")
            }
            
            Button {
                beverage = Beverage(name: "Chai Tea Latte", price: 4.10)
            } label: {
                Label("Change object", systemImage: "pencil")
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text(book.toString())
            }
            .padding([.leading, .trailing], 30)
        }
    }
}

struct BadStateView_Previews: PreviewProvider {
    static var previews: some View {
        BadStateView(beverage: Beverage(), book: Book())
    }
}
