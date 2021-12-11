//
//  ListView.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import SwiftUI

struct ListView<MenuRenderer: ListItemMenu, ContextMenuRenderer: ListItemMenu>: View {
    @State private var showDetail:Bool = false
    @ObservedObject var books:BookCollection
    @State var menu:MenuRenderer
    @State var contextMenu:ContextMenuRenderer
    
    let title:String
    let emptyListText:String
    
    var body: some View {
        VStack {
            var selected:IBook? = nil
            Text(title)
            List {
                if(books.items.count > 0) {
                    ForEach(books.items, id: \.isbn) { book in
                        ListItemView(book: book,
                             menu: menu,
                             contextMenu: contextMenu)
                            .onTapGesture {
                                selected = book
                                self.showDetail = true
                            }
                    }
                }
                else {
                    Text(emptyListText)
                }
            }
            .listStyle(PlainListStyle())
            .sheet(isPresented: $showDetail) {
                DetailView(item: selected!)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(books: BookCollection(items: PreviewData().items), menu: ListItemDummyRenderer(), contextMenu: ListItemDummyRenderer(), title: "Wishlist", emptyListText: "No entries")
    }
}
