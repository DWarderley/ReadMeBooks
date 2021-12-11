//
//  ListViewItemCallbacks.swift
//  ReadMe
//
//  Created by David Warderley on 30/11/2021.
//

import Foundation

class WishlistListViewItemCallbacks : ObservableObject {
    var onMoveToRead:(IBook) -> Void
    var onMoveToStarted:(IBook) -> Void
    var onMoveUp:(IBook) -> Void
    var onMoveDown:(IBook) -> Void
    var onDelete:(IBook) -> Void
    
    init(onMoveToRead:@escaping (IBook) -> Void, onMoveToStarted:@escaping (IBook) -> Void,
         onMoveUp:@escaping (IBook) -> Void, onMoveDown:@escaping (IBook) -> Void, onDelete:@escaping (IBook) -> Void) {
        self.onMoveToRead = onMoveToRead
        self.onMoveToStarted = onMoveToStarted
        self.onMoveUp = onMoveUp
        self.onMoveDown = onMoveDown
        self.onDelete = onDelete
    }
    
    init() {
        self.onMoveToRead = { _ in }
        self.onMoveToStarted = { _ in }
        self.onMoveUp = { _ in}
        self.onMoveDown = { _ in }
        self.onDelete = { _ in }
    }
}
