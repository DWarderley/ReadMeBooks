//
//  WishlistItemContextMenu.swift
//  ReadMe
//
//  Created by David Warderley on 30/11/2021.
//

import SwiftUI

struct WishlistItemContextMenu: ListItemMenu {
    let callbacks:WishlistListViewItemCallbacks
    @State private var book: IBook? = nil
    
    init(callbacks:WishlistListViewItemCallbacks) {
        self.callbacks = callbacks
    }
    
    init(callbacks:WishlistListViewItemCallbacks, book:IBook) {
        self.callbacks = callbacks
        self.book = book
    }
    
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
    
    func setBook(book: IBook) {
        self.book = book
    }
}
