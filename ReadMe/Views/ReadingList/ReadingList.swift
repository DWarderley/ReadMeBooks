//
//  ReadingList.swift
//  ReadMe
//
//  Created by David Warderley on 12/12/2021.
//

import SwiftUI

struct ReadingList: View {
    let bookOperations:IBookOperations
    private var readingList:BookCollection
    
    init(bookOperations:IBookOperations) {
        self.bookOperations = bookOperations
        readingList = BookCollection()
        readingList = bookOperations.fetchStageCollection(stage: Stage.Reading)
     }
    
    var body: some View {
        ZStack {
            let callbacks = ReadingListViewItemCallbacks(
                onMoveToRead: { book in
                    bookOperations.moveToRead(book: book)
                },
                onMoveToWishlist: { book in
                    bookOperations.moveToWishlist(book: book)
                },
                onMoveUp: { book in
                    readingList.moveUp(book: book)
                },
                onMoveDown: { book in
                    readingList.moveDown(book: book)
                },
                onDelete: { book in
                    readingList.remove(book: book)
                    bookOperations.delete(book: book)
                })
            
            ListView(books: readingList, menu: ReadingListItemMenu(callbacks: callbacks, bookCollection: readingList), contextMenu: ReadingListItemContextMenu(callbacks: callbacks, bookCollection: readingList), title: "Reading List", emptyListText: "You aren't currently reading any books")
        }
    }
}

struct ReadingList_Previews: PreviewProvider {
    static var previews: some View {
        ReadingList(bookOperations: MockBookOperations(books: PreviewData().items))
    }
}
