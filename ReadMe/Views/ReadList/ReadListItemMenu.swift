//
//  ReadListItemMenu.swift
//  ReadMe
//
//  Created by David Warderley on 12/12/2021.
//

import SwiftUI

struct ReadListItemMenu: ListItemMenu {
    let callbacks:ReadListViewItemCallbacks
    let bookCollection:BookCollection
    
    public func render(book:IBook) -> some View {
        Menu {
            let menu = ReadListItemContextMenu(callbacks: callbacks, bookCollection: bookCollection)
            menu.render(book: book)
        } label: {
            Image(systemName: "ellipsis")
        }
    }
}
