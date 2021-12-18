//
//  SearchView.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI
import Foundation
import Combine

struct SearchView: View {
    @Binding var isVisible: Bool
    var searchController:ISearchController
    let onSelected:(IBook) -> Void
    var subscription: Set<AnyCancellable> = []
    
    @State private var items:[IBook] = []
    @StateObject private var searchObserver:SearchFieldObserver = SearchFieldObserver()
    
    
    var body: some View {
        VStack{
            HStack {
                SearchBarView(toSearch: $searchObserver.searchText, onCloseRequest: {
                    isVisible = false
                })
                .onReceive(searchObserver.$toSearch) { toSearch in
                    RefreshSearch(toSearch: toSearch)
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
    
    func RefreshSearch(toSearch:String) {
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
