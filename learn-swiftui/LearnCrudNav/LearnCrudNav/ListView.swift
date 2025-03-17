//
//  ListView.swift
//  LearnCrudNav
//
//  Created by Avilay Parekh on 8/19/23.
//

import SwiftUI


struct ListView: View {
    @State var items: [ItemSummary] = []
    @State var path = NavigationPath()
    @State var showAdd = false
    var dataService: DataService = DataService.dataService(caller: "ListView ctor")
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 0) {
                List(items) { item in
                    NavigationLink(value: item) {
                        VStack {
                            Text(item.id).font(.caption).foregroundColor(.gray)
                            HStack {
                                Text(item.name)
                                CardSuitView(suit: item.suit)
                            }
                        }
                    }
                }
            }
            .padding(.top, 0)
            .navigationDestination(isPresented: $showAdd, destination: {
                AddView()
            })
            .navigationDestination(for: ItemSummary.self) { itemSummary in
                ShowView(itemSummary: itemSummary, path: $path)
            }
            .navigationDestination(for: Item.self) { item in
                EditView(item: item, path: $path)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showAdd = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            
                    }

                }
            }
            .onAppear {
                print("ListView::onAppear")
                items = dataService.getItems(caller: "ListView.onAppear")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
