//
//  ContentView.swift
//  LearnState
//
//  Created by Avilay Parekh on 8/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var cookie = Cookie(flavor: "Choclate Chip", calories: 180)
    @State var beverage = Beverage(name: "Espresso", price: 2.10)
    @StateObject var book = Book(title: "Lord of the Rings", isRead: true)
    
    var body: some View {
        VStack {
            Button {
                print("\nLogging objects in main view")
                print("============================")
                print(cookie.toString())
                print(beverage.toString())
                print(book.toString())
            } label: {
                Label("Log objects", systemImage: "doc")
            }
            
            NavigationStack {
                NavigationLink {
                    SimpleStateView(counter: 0, name: "Happy Orange", cookie: cookie)
                } label: {
                    Text("Simple State \(cookie.toString())")
                }.padding(.bottom, 10)
                
                NavigationLink {
                    BadStateView(beverage: beverage, book: book)
                } label: {
                    Text("Bad State \(beverage.toString())")
                }.padding(.bottom, 10)
                
                NavigationLink {
                    ObservedObjectView(book: book)
                } label: {
                    Text("Observed State \(book.toString())")
                }.padding(.bottom, 5)
                
                NavigationLink {
                    ObservedObjectView2(book: book)
                } label: {
                    Text("Observed State 2 \(book.toString())")
                }.padding(.bottom, 10)
                
                NavigationLink {
                    EnvObjState().environmentObject(book)
                } label: {
                    Text("Env State \(book.toString())")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
