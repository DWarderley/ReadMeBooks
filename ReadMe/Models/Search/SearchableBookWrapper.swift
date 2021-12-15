//
//  SearchableBookWrapper.swift
//  ReadMe
//
//  Created by David Warderley on 15/12/2021.
//

import Foundation

class SearchableBookWrapper : IBook {
    
    let book:SearchableBook
    
    init(book: SearchableBook) {
        self.book = book
    }
    
    var isbn: String {
        get {
            if let isbnOptions = book.isbn {
                if(isbnOptions.count > 0) {
                    return isbnOptions[0]
                }
                else {
                    return book.key
                }
            }
            
            return book.key
        }
    }
    
    var author: String {
        get {
            if let authors = book.author_name {
                if(authors.count > 0) {
                    return authors[0]
                }
                else {
                    return ""
                }
            }
            
            return ""
        }
    }
    
    var title: String { get { return book.title } }
    
    var imageURL: String { get {
        if let cover_i = book.cover_i {
            return "https://covers.openlibrary.org/b/id/\(cover_i).jpg"
        }
        
        return "https://openlibrary.org/images/icons/avatar_book-sm.png"
    }}
}
