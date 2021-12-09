//
//  WishlistItemContextMenu.swift
//  ReadMe
//
//  Created by David Warderley on 30/11/2021.
//

import SwiftUI

struct WishlistItemContextMenu: ListMenu {
    
    let callbacks:WishlistListViewItemCallbacks
    var book: IBook?
    
    var body: some View {
        Button {
            callbacks.onDelete()
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
            callbacks.onMoveToRead(book!)
        } label: {
            Label("Move to Read", systemImage: "hand.thumbsup")
        }
        
        Button {
            callbacks.onMoveToStarted(book!)
        } label: {
            Label("Move to Started", systemImage: "book")
        }
    }
}
