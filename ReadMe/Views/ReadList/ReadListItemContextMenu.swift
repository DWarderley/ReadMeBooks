//
//  ReadListItemContextMenu.swift
//  ReadMe
//
//  Created by David Warderley on 12/12/2021.
//

import SwiftUI

struct ReadListItemContextMenu: ListItemMenu {
    let callbacks:ReadListViewItemCallbacks
    let bookCollection:BookCollection
    
    @ViewBuilder
    public func render(book:IBook) -> some View {
        Button {
           callbacks.onDelete(book)
        } label: {
           Label("Delete", systemImage: "minus.circle")
        }

        if shouldRenderMoveUp(book: book) {
            Button {
               callbacks.onMoveUp(book)
            } label: {
               Label("Move Up", systemImage: "arrow.up")
            }
        }
        
        if shouldRenderMoveDown(book: book) {
            Button {
               callbacks.onMoveDown(book)
            } label: {
               Label("Move Down", systemImage: "arrow.down")
            }
        }

        Button {
           callbacks.onMoveToReading(book)
        } label: {
           Label("Read again", systemImage: "book")
        }
        
        Button {
           callbacks.onMoveToWishlist(book)
        } label: {
           Label("Move back to Wishlist", systemImage: "star.circle")
        }
    }
    
    func shouldRenderMoveUp(book:IBook) -> Bool {
        if let index = bookCollection.index(of: book) {
            return index > 0
        }
        
        return false
    }
    
    func shouldRenderMoveDown(book:IBook) -> Bool {
        if let index = bookCollection.index(of: book) {
            return (index + 1) < bookCollection.count()
        }
        
        return false
    }
}
