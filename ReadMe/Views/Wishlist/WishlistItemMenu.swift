//
//  WishlistItemMenu.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI

struct WishlistItemMenu: ListItemMenu {
    let callbacks:WishlistListViewItemCallbacks
    let bookCollection:BookCollection
    
    public func render(book:IBook) -> some View {
        Menu {
            let menu = WishlistItemContextMenu(callbacks: callbacks, bookCollection: bookCollection)
            menu.render(book: book)
        } label: {
            Image(systemName: "ellipsis")
        }
    }
}
