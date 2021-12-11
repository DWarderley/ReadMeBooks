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
        print("HELLEO")
        let collection = BookCollection(items: books)
        print("coll \(collection)")
        return collection
    }
    
    func createBook(book:IBook) {}
    
    func moveToReading(book: IBook) {}
    
    func moveToRead(book: IBook) {}
    
}
