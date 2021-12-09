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
    
    func filterBy(stage: Stage) -> [IBook] {
        return books
    }
    
    func createBook(isbn:String) {}
}
