//
//  EditView.swift
//  LearnCrudNav
//
//  Created by Avilay Parekh on 8/19/23.
//

import SwiftUI

struct EditView: View {
    @State var item: Item
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            ItemFormView(item: $item)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    // pop a path from the navigation stack to go back to the item details
                    path.removeLast()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    // save the edits
                    // pop a path from the navigation stack to go back to the item details
                    DataService.dataService().updateItem(item: item)
                    path.removeLast()
                }
            }
        }        
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EditView(
                item: DataService.dataService().getPreviewItem(),
                path: Binding.constant(NavigationPath())
            )
        }
    }
}
