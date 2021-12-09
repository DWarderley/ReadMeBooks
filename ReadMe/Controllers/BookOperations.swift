//
//  BookOperations.swift
//  ReadMe
//
//  Created by David Warderley on 07/12/2021.
//

import Foundation
import CoreData

class BookOperations: IBookOperations {
    let viewContext:NSManagedObjectContext
    var books:[Book]?
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        self.books = load()
    }
    
    private func load() -> [Book] {
        var books:[Book] = []
        
        let request = Book.fetchRequest()
        do {
            books = try viewContext.fetch(request)
            print("Got \(books.count) commits")
        } catch {
            print("Fetch failed")
        }
        
        return books
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Error saving data: \(error)")
            }
        }
    }
    
    func createBook(isbn:String) {
        let book = Book(context: viewContext)
        book.isbn = isbn
        book.stage = Stage.Wishlist.rawValue
    }
    
    func filterBy(stage: Stage) -> [IBook] {
        return []
    }
}
