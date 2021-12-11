//
//  WishlistItemContextMenu.swift
//  ReadMe
//
//  Created by David Warderley on 30/11/2021.
//

import SwiftUI

struct WishlistItemContextMenu: ListItemMenu {
    let callbacks:WishlistListViewItemCallbacks
    
    @ViewBuilder
    public func render(book:IBook) -> some View {
        Button {
           callbacks.onDelete(book)
        } label: {
           Label("Delete", systemImage: "minus.circle")
        }

        Button {
           callbacks.onMoveDown()
        } label: {
           Label("Move Down", systemImage: "arrow.down")
        }

        Button {
           callbacks.onMoveUp()
        } label: {
           Label("Move Up", systemImage: "arrow.up")
        }

        Button {
           callbacks.onMoveToRead(book)
        } label: {
           Label("Move to Read", systemImage: "hand.thumbsup")
        }

        Button {
           callbacks.onMoveToStarted(book)
        } label: {
           Label("Move to Started", systemImage: "book")
        }
    }
}
