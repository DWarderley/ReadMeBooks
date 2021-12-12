//
//  ReadList.swift
//  ReadMe
//
//  Created by David Warderley on 12/12/2021.
//

import SwiftUI

struct ReadList: View {
    let bookOperations:IBookOperations
    private var readList:BookCollection
    
    init(bookOperations:IBookOperations) {
        self.bookOperations = bookOperations
        readList = BookCollection()
        readList = bookOperations.fetchStageCollection(stage: Stage.Read)
     }
    
    var body: some View {
        ZStack {
            let callbacks = ReadListViewItemCallbacks(
                onMoveToWishlist: { book in
                    bookOperations.moveToWishlist(book: book)
                },
                onMoveToReading: { book in
                    bookOperations.moveToReading(book: book)
                },
                onMoveUp: { book in
                    readList.moveUp(book: book)
                },
                onMoveDown: { book in
                    readList.moveDown(book: book)
                },
                onDelete: { book in
                    readList.remove(book: book)
                    bookOperations.delete(book: book)
                })
            
            ListView(books: readList, menu: ReadListItemMenu(callbacks: callbacks, bookCollection: readList), contextMenu: ReadListItemContextMenu(callbacks: callbacks, bookCollection: readList), title: "Read", emptyListText:  "You haven't finished any books yet. Get to it!")
        }
    }
}

struct ReadList_Previews: PreviewProvider {
    static var previews: some View {
        ReadList(bookOperations: MockBookOperations(books: PreviewData().items))
    }
}
