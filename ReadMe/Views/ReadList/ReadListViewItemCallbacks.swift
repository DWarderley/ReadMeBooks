//
//  ReadListViewItemCallbacks.swift
//  ReadMe
//
//  Created by David Warderley on 12/12/2021.
//

import Foundation

class ReadListViewItemCallbacks : ObservableObject {
    var onMoveToWishlist:(IBook) -> Void
    var onMoveToReading:(IBook) -> Void
    var onMoveUp:(IBook) -> Void
    var onMoveDown:(IBook) -> Void
    var onDelete:(IBook) -> Void
    
    init(onMoveToWishlist:@escaping (IBook) -> Void, onMoveToReading:@escaping (IBook) -> Void,
         onMoveUp:@escaping (IBook) -> Void, onMoveDown:@escaping (IBook) -> Void,
         onDelete:@escaping (IBook) -> Void) {
        self.onMoveToWishlist = onMoveToWishlist
        self.onMoveToReading = onMoveToReading
        self.onMoveUp = onMoveUp
        self.onMoveDown = onMoveDown
        self.onDelete = onDelete
    }
    
    init() {
        self.onMoveToWishlist = { _ in }
        self.onMoveToReading = { _ in }
        self.onMoveUp = { _ in}
        self.onMoveDown = { _ in }
        self.onDelete = { _ in }
    }
}
