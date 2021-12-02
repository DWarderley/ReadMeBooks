//
//  ListViewItemCallbacks.swift
//  ReadMe
//
//  Created by David Warderley on 30/11/2021.
//

import Foundation

class WishlistListViewItemCallbacks : ObservableObject {
    var onMoveToRead:() -> Void
    var onMoveToStarted:() -> Void
    var onMoveUp:() -> Void
    var onMoveDown:() -> Void
    var onDelete:() -> Void
    
    init(onMoveToRead:@escaping () -> Void, onMoveToStarted:@escaping () -> Void,
         onMoveUp:@escaping () -> Void, onMoveDown:@escaping () -> Void, onDelete:@escaping () -> Void) {
        self.onMoveToRead = onMoveToRead
        self.onMoveToStarted = onMoveToStarted
        self.onMoveUp = onMoveUp
        self.onMoveDown = onMoveDown
        self.onDelete = onDelete
    }
    
    init() {
        self.onMoveToRead = {}
        self.onMoveToStarted = {}
        self.onMoveUp = {}
        self.onMoveDown = {}
        self.onDelete = {}
    }
}
