//
//  ReadingListItemMenu.swift
//  ReadMe
//
//  Created by David Warderley on 12/12/2021.
//

import SwiftUI

struct ReadingListItemMenu: ListItemMenu {
    let callbacks:ReadingListViewItemCallbacks
    let bookCollection:BookCollection
    
    public func render(book:IBook) -> some View {
        Menu {
            let menu = ReadingListItemContextMenu(callbacks: callbacks, bookCollection: bookCollection)
            menu.render(book: book)
        } label: {
            Image(systemName: "ellipsis")
        }
    }
}
