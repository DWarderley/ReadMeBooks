//
//  WishlistView.swift
//  ReadMe
//
//  Created by David Warderley on 01/12/2021.
//

import SwiftUI

struct WishlistView: View {
    @State private var showSearch: Bool = false
    let bookOperations:IBookOperations
    private var wishlists:BookCollection?
    
    init(bookOperations:IBookOperations) {
        self.bookOperations = bookOperations
        wishlists = bookOperations.fetchStageCollection(stage: Stage.Wishlist)
     }
    
    var body: some View {
        ZStack {
            let callbacks = WishlistListViewItemCallbacks(
                onMoveToRead: { book in
                    print("On move to read")
                    bookOperations.moveToRead(book: book)
                },
                onMoveToStarted: { book in
                    print("On move started")
                    bookOperations.moveToReading(book: book)
                },
                onMoveUp: {
                    print("On move up")
                }, onMoveDown: {
                    print("On move down")
                }, onDelete: { book in
                    wishlists?.remove(book: book)
                })
            
            ListView(books: wishlists!, menu: WishlistItemMenu(callbacks: callbacks), contextMenu: WishlistItemContextMenu(callbacks: callbacks), title: "Wishlist", emptyListText: "You don't have any books in your wishlist. Try adding some")
            
            ZStack(alignment: .bottomTrailing) {
                Color.clear
                Button {
                    showSearch = true
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
            }
            .padding(.bottom, 20)
            .padding(.trailing, 20)
        }
        .sheet(isPresented: $showSearch) {
            SearchView(isVisible: $showSearch, items:PreviewData().items) { bookSummary in
                bookOperations.createBook(book: bookSummary)
                print("Created book")
            }
        }
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView(bookOperations: MockBookOperations(books: PreviewData().items))
    }
}
