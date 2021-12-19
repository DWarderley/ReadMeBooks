//
//  ReadingListViewItemCallbacks.swift
//  ReadMe
//
//  Created by David Warderley on 12/12/2021.
//

import Foundation

class ReadingListViewItemCallbacks : ObservableObject {
    var onMoveToRead:(IBook) -> Void
    var onMoveToWishlist:(IBook) -> Void
    var onMoveUp:(IBook) -> Void
    var onMoveDown:(IBook) -> Void
    var onDelete:(IBook) -> Void
    
    init(onMoveToRead:@escaping (IBook) -> Void, onMoveToWishlist:@escaping (IBook) -> Void,
         onMoveUp:@escaping (IBook) -> Void, onMoveDown:@escaping (IBook) -> Void,
         onDelete:@escaping (IBook) -> Void) {
        self.onMoveToRead = onMoveToRead
        self.onMoveToWishlist = onMoveToWishlist
        self.onMoveUp = onMoveUp
        self.onMoveDown = onMoveDown
        self.onDelete = onDelete
    }
    
    init() {
        self.onMoveToRead = { _ in }
        self.onMoveToWishlist = { _ in }
        self.onMoveUp = { _ in}
        self.onMoveDown = { _ in }
        self.onDelete = { _ in }
    }
}
