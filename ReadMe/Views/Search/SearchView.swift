//
//  SearchView.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI

struct SearchView: View {
    @State private var toSearch = ""
    @Binding var isVisible: Bool
    var items:[IBook]
    let onSelected:(IBook) -> Void
    
    var body: some View {
        VStack{
            HStack {
                SearchBarView(toSearch: $toSearch, onCloseRequest: {
                    isVisible = false
                })
                Button("Cancel") {
                    isVisible = false
                }
                .padding(.trailing, 10)
                .padding(.leading, -10)
            }
            List {
                ForEach(search, id: \.isbn) { item in
                    ListItemView(book: item,
                         menu: ListItemDummyRenderer(),
                         contextMenu: ListItemDummyRenderer())
                        .onTapGesture {
                            onSelected(item)
                        }
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
    
    var search: [IBook] {
        if toSearch.isEmpty {
            return items
        } else {
            return items.filter {
                $0.getTitle().lowercased().contains(toSearch.lowercased()) ||
                $0.getAuthor().lowercased().contains(toSearch.lowercased())
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isVisible: .constant(true), items: PreviewData().items, onSelected: { _ in })
    }
}
