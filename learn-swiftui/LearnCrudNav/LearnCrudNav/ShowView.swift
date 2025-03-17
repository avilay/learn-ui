//
//  ShowView.swift
//  LearnCrudNav
//
//  Created by Avilay Parekh on 8/19/23.
//

/*
 var id: String
 var name: String
 var suit: CardSuit
 var score: Float
 var description: String
 var isImportant: Bool
 */

import SwiftUI

struct ShowView: View {
    let itemSummary: ItemSummary
    @Binding var path: NavigationPath
    @State var item: Item?
    var dataService = DataService.dataService(caller: "ShowView.ctor")
    @State var confirmDelete = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let item {
                Text("ID: \(item.id)").font(.caption).foregroundColor(.gray)
                HStack {
                    CardSuitView(suit: item.suit).font(.title2)
                    Text(item.name).font(.title).bold()
                }.padding(.bottom, 15)
                HStack {
                    if item.isImportant {
                        Image(systemName: "exclamationmark.triangle.fill")
                    }
                    Text("Score: \(item.score, specifier: "%.2f")")
                }
                Text(item.description)
            } else {
                ProgressView()
            }
        }
        .padding([.leading, .trailing], 20)
        .toolbar {
            ToolbarItem(placement: .automatic) {
                NavigationLink(value: item) {
                    Text("Edit")
                }
            }
             
            ToolbarItem(placement: .status) {
                Button("Delete Item") {
                    confirmDelete = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
        }
        .alert("Are you sure?", isPresented: $confirmDelete, actions: {
            Button("Delete") {
                dataService.deleteItem(id: itemSummary.id, caller: "ShowView.deleteButton")
                path.removeLast()
            }
            
            Button("Cancel") {}
        })
        .onAppear {
            item = dataService.getItem(id: itemSummary.id, caller: "ShowView.onAppear")
        }
    }
}

struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ShowView(itemSummary: DataService.dataService().getPreviewItemSummary(), path: Binding.constant(NavigationPath()))
        }
    }
}
