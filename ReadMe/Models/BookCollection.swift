//
//  BookCollection.swift
//  ReadMe
//
//  Created by David Warderley on 10/12/2021.
//

import Foundation

class BookCollection : ObservableObject {
    @Published var items:[IBook] = []
    
    init() {}
    
    init(items:[IBook]) {
        self.items = items
    }
    
    func add(book:IBook) {
        items.append(book)
    }
    
    func remove(book toRemove:IBook) {
        if let index = index(of: toRemove) {
            items.remove(at: index)
        }
    }
    
    func index(of book:IBook) -> Int? {
        return items.firstIndex(where: { $0 === book })
    }
    
    func count() -> Int {
        return items.count
    }
    
    func moveUp(book:IBook) {
        if let index = index(of: book) {
            items.remove(at: index)
            items.insert(book, at: index - 1)
        }
    }
    
    func moveDown(book:IBook) {
        if let index = index(of: book) {
            items.remove(at: index)
            items.insert(book, at: index + 1)
        }
    }
}
