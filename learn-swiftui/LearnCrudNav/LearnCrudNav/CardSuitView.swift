//
//  CardSuitView.swift
//  LearnCrudNav
//
//  Created by Avilay Parekh on 8/19/23.
//

import SwiftUI

struct CardSuitView: View {
    let suit: CardSuit
    
    var body: some View {
        switch suit {
        case .spades:
            Image(systemName: "suit.spade.fill")
        case .hearts:
            Image(systemName: "suit.heart.fill").foregroundColor(.red)
        case .diamonds:
            Image(systemName: "suit.diamond.fill").foregroundColor(.red)
        case .clubs:
            Image(systemName: "suit.club.fill")
        }
    }
}

struct CardSuitView_Previews: PreviewProvider {
    static var previews: some View {
        CardSuitView(suit: CardSuit.diamonds)
    }
}
