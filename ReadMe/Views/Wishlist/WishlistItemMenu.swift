//
//  WishlistItemMenu.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI

struct WishlistItemMenu: ListMenu {
    
    let callbacks:WishlistListViewItemCallbacks
    var book: IBook?
    
    var body: some View {
        Menu {
            WishlistItemContextMenu(callbacks: callbacks, book: book)
        } label: {
            Image(systemName: "ellipsis")
        }
    }
}
