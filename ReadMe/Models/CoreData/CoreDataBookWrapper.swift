//
//  CoreDataBookWrapper.swift
//  ReadMe
//
//  Created by David Warderley on 08/12/2021.
//

import Foundation

class CoreDataBookWrapper :  IBook {
    
    let book:Book
    
    init (book: Book) {
        self.book = book
    }
    
    var isbn: String { get { return book.isbn }}
    var author: String { get { return book.author }}
    var title: String { get { return book.title }}
    var imageURL: String { get { return book.imageURL }}
}
