//
//  ListView.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import SwiftUI

struct ListView: View {
    @State private var selectedEntry: IBook? = nil
    @State private var showDetail:Bool = false
    
    let bookOperations:IBookOperations
    let stage:Stage
    let title:String
    let emptyListText:String
    
    var body: some View {
        VStack {
            Text(title)
            List {
                let books:[IBook] = bookOperations.filterBy(stage: stage)
                
                if(books.count > 0) {
                    ForEach(books, id: \.isbn) { book in
                        let calbacks = WishlistListViewItemCallbacks(
                            onMoveToRead: { book in
                                print("On move to read")
                            },
                            onMoveToStarted: { book in
                                print("On move started")
                            },
                            onMoveUp: {
                                print("On move up")
                            }, onMoveDown: {
                                print("On move down")
                            }, onDelete: {
                                print("On delete")
                            })

                        ListItemView(book: book,
                             menu: WishlistItemMenu(callbacks: calbacks),
                             contextMenu: WishlistItemContextMenu(callbacks: calbacks))
                            .onTapGesture {
                                self.selectedEntry = book
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
                DetailView(item: selectedEntry!)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(bookOperations: MockBookOperations(books: PreviewData().items),
                 stage: Stage.Wishlist,
                 title:"Wishlist", emptyListText: "No entries")
    }
}
