//
//  SearchView.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI

struct SearchView: View {
    @Binding var isVisible: Bool
    var searchController:ISearchController
    let onSelected:(IBook) -> Void
    
    @State private var toSearch = ""
    @State private var items:[IBook] = []
    
    var body: some View {
        VStack{
            HStack {
                SearchBarView(toSearch: $toSearch, onCloseRequest: {
                    isVisible = false
                })
                .onChange(of: toSearch) { _ in
                    RefreshSearch()
                }
                Button("Cancel") {
                    isVisible = false
                }
                .padding(.trailing, 10)
                .padding(.leading, -10)
            }
            List {
                ForEach(items, id: \.isbn) { item in
                    ListItemView(book: item,
                         menu: ListItemDummyRenderer(),
                                 contextMenu: ListItemDummyRenderer(), onTapped: {
                        onSelected(item)
                        isVisible = false
                    })
                }
            }
            .listStyle(PlainListStyle())
            .gesture(DragGesture()
                 .onChanged({ _ in
                     UIApplication.shared.dismissKeyboard()
                 })
             )
        }
    }
    
    func RefreshSearch() {
        searchController.search(query: toSearch) { books in
            items = books
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isVisible: .constant(true), searchController: MockSearchController(), onSelected: { _ in })
    }
}
