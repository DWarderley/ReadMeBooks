//
//  MockBookOperations.swift
//  ReadMe
//
//  Created by David Warderley on 07/12/2021.
//

import Foundation

class MockBookOperations: IBookOperations {
    
    private var books:[BookSummary] = []
    
    init(){}
    
    init(books:[BookSummary]) {
        self.books = books;
    }
    
    func fetchStageCollection(stage: Stage) -> BookCollection {
        let collection = BookCollection(items: books)
        return collection
    }
    
    func createBook(book:IBook) {}
    
    func moveToWishlist(book: IBook) {}
    
    func moveToReading(book: IBook) {}
    
    func moveToRead(book: IBook) {}
    
    func delete(book: IBook) {}
    
    func isTracked(isbn: String) -> Bool {
        return false
    }
}
