//
//  WishlistItemMenu.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI

struct WishlistItemMenu: ListItemMenu {
    
    let callbacks:WishlistListViewItemCallbacks
    @State private var book: IBook? = nil
    
    var body: some View {
        Menu {
            if(book != nil) {
                WishlistItemContextMenu(callbacks: callbacks, book: book!)
            }
        } label: {
            Image(systemName: "ellipsis")
        }
    }
    
    func setBook(book: IBook) {
        self.book = book
    }
}
