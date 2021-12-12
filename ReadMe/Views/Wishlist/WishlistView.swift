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
    private var wishlists:BookCollection
    
    init(bookOperations:IBookOperations) {
        self.bookOperations = bookOperations
        wishlists = BookCollection()
        wishlists = bookOperations.fetchStageCollection(stage: Stage.Wishlist)
     }
    
    var body: some View {
        ZStack {
            let callbacks = WishlistListViewItemCallbacks(
                onMoveToRead: { book in
                    bookOperations.moveToRead(book: book)
                },
                onMoveToStarted: { book in
                    bookOperations.moveToReading(book: book)
                },
                onMoveUp: { book in
                    wishlists.moveUp(book: book)
                },
                onMoveDown: { book in
                    wishlists.moveDown(book: book)
                },
                onDelete: { book in
                    wishlists.remove(book: book)
                    bookOperations.delete(book: book)
                })
            
            ListView(books: wishlists, menu: WishlistItemMenu(callbacks: callbacks, bookCollection: wishlists), contextMenu: WishlistItemContextMenu(callbacks: callbacks, bookCollection: wishlists), title: "Wishlist", emptyListText: "You don't have any books in your wishlist. Try adding some")
            
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
            SearchView(isVisible: $showSearch, items:availableBooks) { bookSummary in
                bookOperations.createBook(book: bookSummary)
                print("Created book")
            }
        }
    }
    
    var availableBooks: [IBook] {
        PreviewData().items.filter { book in
            return (bookOperations.isTracked(isbn: book.isbn) == false)
        }
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView(bookOperations: MockBookOperations(books: PreviewData().items))
    }
}
