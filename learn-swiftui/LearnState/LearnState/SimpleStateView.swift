//
//  SimpleStateView.swift
//  LearnState
//
//  Created by Avilay Parekh on 8/11/23.
//

import SwiftUI

/*
 ### Usage Scenario:
 The view owns some editable data, i.e., the data was instantiated in the view somehow, and I want the view to refresh
 whenever the user edits the data. Make data of struct type and declare its object as a @State variable in the view.
 
 ### Bad Smell:
 When a struct object from a parent view is passed in as an editable @State object to the child view. Any changes made
 in the child view will be lost when the user returns back to the parent view.
 
 ### Demo Explanation:
 Structs and primitive types declared as @State variables cause the view to be updated whenever they change within the
 view itself. This is demonstrated by both counter and cookie. Normal variables, even though they are declared as var,
 cannot be changed in the view.
 
 Structs that were passed from some parent view and are accepted as @State variables in this view behave like normal
 @State variables while on this page, but the original struct in the parent view will not reflect any changes made here.
 This is demonstrated by cookie. I can decrease the calories here and this view will be immediately refreshed. But if
 I log objects from the parent page I'll see that cookie has not changed. Furthermore, if I go back to the parent view
 I'll see cookie unchanged.
 */

struct SimpleStateView: View {
    // Simple state
    @State var counter: Int
    
    var name: String
    
    @State var cookie: Cookie
    
    var body: some View {
        VStack {
            HStack {
                Text("Counter: \(counter)")
                Button {
                    counter += 1
                } label: {
                    Label("Increment", systemImage: "plus.square")
                }
                .buttonStyle(.bordered)
            }
            HStack {
                Text("Name: \(name)")
                Button {
                    // name = "Some other name"
                    print("Unable to change name")
                } label: {
                    Label("Change Name", systemImage: "pencil")
                }
                .buttonStyle(.bordered)
            }
            HStack {
                Text(cookie.toString() )
                Button {
                    cookie.calories -= 10
                } label: {
                    Label("Decrease Calories", systemImage: "minus.circle")
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

struct SimpleStateView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleStateView(counter: 0, name: "Preview Provider", cookie: Cookie())
    }
}
