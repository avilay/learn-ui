//
//  CalorieButton.swift
//  LearnState
//
//  Created by Avilay Parekh on 8/12/23.
//

import SwiftUI

struct CalorieButton: View {
    @Binding var cookie: Cookie
    
    var body: some View {
        HStack {
            Text("\(cookie.calories) calories")
            Button {
                cookie.calories += 100
            } label: {
                Label("100", systemImage: "plus")
            }
        }
    }
}

struct CalorieButton_Previews: PreviewProvider {
    static var previews: some View {
        CalorieButton(cookie: Binding.constant(Cookie()))
    }
}
