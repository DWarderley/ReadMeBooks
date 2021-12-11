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
    var bookStages:Dictionary<Stage, BookCollection> = [:]
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        let books:[Book] = load()
        
        for stage in Stage.allCases {
            bookStages[stage] = BookCollection()
        }
        
        for book in books {
            let stage:Stage = Stage(rawValue: book.stage)!
            bookStages[stage]?.items.append(CoreDataBookWrapper(book: book))
        }
    }
    
    private func load() -> [Book] {
        var books:[Book] = []
        let request = Book.fetchRequest()
        do {
            books = try viewContext.fetch(request)
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
    
    func createBook(book toCopy:IBook) {
        let book = Book(context: viewContext)
        book.isbn = toCopy.isbn
        book.author = toCopy.author
        book.title = toCopy.title
        book.imageURL = toCopy.imageURL
        book.stage = Stage.Wishlist.rawValue
        bookStages[Stage.Wishlist]!.add(book: CoreDataBookWrapper(book: book))
        save()
    }
    
    func fetchStageCollection(stage: Stage) ->BookCollection {
        return bookStages[stage]!;
    }
    
    func moveToReading(book: IBook) {
        if let wrapper = book as? CoreDataBookWrapper {
            bookStages[Stage(rawValue: wrapper.book.stage)!]?.remove(book: book)
            wrapper.book.stage = Stage.Reading.rawValue
            bookStages[Stage.Reading]?.add(book: book)
            save()
        }
    }
    
    func moveToRead(book: IBook) {
        if let wrapper = book as? CoreDataBookWrapper {
            bookStages[Stage(rawValue: wrapper.book.stage)!]?.remove(book: book)
            wrapper.book.stage = Stage.Read.rawValue
            bookStages[Stage.Read]?.add(book: book)
            save()
        }
    }
    
    func delete(book: IBook) {
        if let wrapper = book as? CoreDataBookWrapper {
            viewContext.delete(wrapper.book)
            save()
        }
    }
    
    func isTracked(isbn: String) -> Bool {
        for collection in bookStages.values {
            for book in collection.items {
                if book.isbn == isbn {
                    return true
                }
            }
        }
        
        return false
    }
}
