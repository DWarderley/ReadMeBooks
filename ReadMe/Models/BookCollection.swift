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
}
