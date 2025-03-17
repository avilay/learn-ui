//
//  BindingStateView.swift
//  LearnState
//
//  Created by Avilay Parekh on 8/11/23.
//

import SwiftUI

struct BindingStateView: View {
    @State var cookie: Cookie
    
    var body: some View {
        VStack {
            Text(cookie.toString())
            CalorieButton(cookie: $cookie)
        }
    }
}

struct BindingStateView_Previews: PreviewProvider {
    static var previews: some View {
        BindingStateView(cookie: Cookie())
    }
}
