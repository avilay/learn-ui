//
//  ContentView.swift
//  LearnIOS3
//
//  Created by Avilay Parekh on 7/1/23.
//

import SwiftUI

struct ListExampleView: View {
    
    var books = [
        "Atomic Habits",
        "The Dip: A Little Book That Teaches When to Quit",
        "Thinkertoys: A Handbook of Creative-Thinking Techniques",
        "Change the Way You See Everything Through Asset-Based Thinking",
        "The Power of Habit: Why We Do What We Do in Life and Business",
        "A Mind at Play: How Claude Shannon INvented the Information Age",
        "The Existential Pleasures of Engineering",
        "Thinking, Fast and Slow",
        "The Art of Doing Science and Engineering: Learning to Learn",
        "The Book of Why: The New Science of Cause and Effect"
    ]
    
//    var body: some View {
//        // List itself is a container, no need to wrap it any other layout container
//        List(books, id:\.self) { book in
//            Text(book)
//        }
//    }
    
//    var body: some View {
//        List(books, id:\.self) { book in
//            Text(book)
//                .listRowSeparator(.hidden)
//        }
//    }
    
    var body: some View {
        List(books, id:\.self) { book in
            Section(book.prefix(10)) {
                Text(book)
            }
        }
    }
    
    enum Flavor: String, CaseIterable, Identifiable {
            var id: String { self.rawValue }
            case vanilla, chocolate, strawberry
        }
    
//    var body: some View {
//        List {
//            ForEach(Flavor.allCases) {
//                Text($0.rawValue)
//                    .listRowBackground(Ellipse()
//                                        .background(Color.clear)
//                                        .foregroundColor(.purple)
//                                        .opacity(0.3)
//                    )
//            }
//        }
//    }
    
//    var body: some View {
//        List {
//            ForEach(Flavor.allCases) {
//                Text($0.rawValue)
//                    .listRowInsets(.init(top: 50,
//                                         leading: 25,
//                                         bottom: 0,
//                                         trailing: 0))
//            }
//        }
//    }
}

struct ListExampleViewView_Previews: PreviewProvider {
    static var previews: some View {
        ListExampleView()
    }
}
