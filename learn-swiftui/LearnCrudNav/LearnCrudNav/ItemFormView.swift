//
//  ItemFormView.swift
//  LearnCrudNav
//
//  Created by Avilay Parekh on 8/20/23.
//

import SwiftUI

struct ItemFormView: View {
    @Binding var item: Item
    @State var scoreUpdated = false
    
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $item.name, prompt: Text("Name"))
                Picker("Card Suit", selection: $item.suit) {
                    CardSuitView(suit: CardSuit.diamonds).tag(CardSuit.diamonds)
                    CardSuitView(suit: CardSuit.spades).tag(CardSuit.spades)
                    CardSuitView(suit: CardSuit.clubs).tag(CardSuit.clubs)
                    CardSuitView(suit: CardSuit.hearts).tag(CardSuit.hearts)
                }
                
                VStack {
                    HStack {
                        Text("Score").padding(.trailing, 10)
                        Slider(value: $item.score, in: 0...100) {
                            Text("Score")  // This won't show up in the UI
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("100")
                        } onEditingChanged: { done in
                            scoreUpdated = done
                        }
                    }
                    if scoreUpdated {
                        Text("\(item.score, specifier: "%.2f")").font(.caption).fontWeight(.ultraLight)
                    } else {
                        Text("\(item.score, specifier: "%.2f")").font(.caption)
                    }
                }
                Toggle("Important", isOn: $item.isImportant)
                
                Section(header: Text("Description")) {
                    TextEditor(text: $item.description).frame(height: 100)
                }
            }
        }
    }
}

struct ItemFormView_Previews: PreviewProvider {
    static var previews: some View {
        ItemFormView(item: Binding.constant(Item()))
    }
}
