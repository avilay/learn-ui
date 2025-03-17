//
//  ForEachExampleView.swift
//  LearnIOS3
//
//  Created by Avilay Parekh on 7/2/23.
//

import SwiftUI

struct ForEachExampleView: View {
    
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
        
    var body: some View {
        // ForEach can be replaced with a bunch of Text views one after the other. However, the body getter needs to
        // return a single View object, which is why it is important to wrap ForEach inside some sort of layout
        // container.
        VStack(alignment: .leading, spacing: 10) {
            ForEach(books, id: \.self) { book in
                Text(book)                
            }
        }
    }
}

struct ForEachExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachExampleView()
    }
}
