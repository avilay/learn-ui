//
//  AddView.swift
//  LearnCrudNav
//
//  Created by Avilay Parekh on 8/19/23.
//

import SwiftUI

struct AddView: View {
    @State var item = Item()
    @State var suit: CardSuit = .diamonds
    @State var errors: [String] = []
    @State var hasErrors = false
    @Environment(\.dismiss) var dismiss
        
    var body: some View {
        ItemFormView(item: $item)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Add") {
                    item.id = UUID().uuidString
                    item.suit = suit
                    guard item.name != "" else {
                        errors.append("Name is required")
                        hasErrors = true
                        return
                    }
                    DataService.dataService(caller: "AddView.button").addItem(item: item, caller: "AddView.button")
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    // pop a path from the navigation stack to go back to the item details
                    dismiss()
                }
            }
        }        
        .navigationBarBackButtonHidden()
        .navigationTitle("New Item")
        .alert("Incorrect Item", isPresented: $hasErrors) {
            // Just show the default OK button
        } message: {
            ForEach(errors, id: \.self) { error in
                // Color does not show up
                Text(error).foregroundColor(.red)
            }
        }

    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
    }
}
