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
    
    func getIsbn() -> String {
        return book.isbn
    }
    
    func getAuthor() -> String {
        return book.author
    }
    
    func getTitle() -> String {
        return book.title
    }
    
    func getImageURL() -> String {
        return book.imageURL
    }
    
    var isbn: String { get { return book.isbn }}
}
