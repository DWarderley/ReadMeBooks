//
//  MockSearchController.swift
//  ReadMe
//
//  Created by David Warderley on 15/12/2021.
//

import Foundation

class MockSearchController : ISearchController {
    var items:[IBook]
    
    init() {
        items = PreviewData().items
    }
    
    func search(query: String, onComplete: @escaping ([IBook]) -> Void) {
        onComplete(items.filter {
            $0.title.lowercased().contains(query.lowercased()) ||
            $0.author.lowercased().contains(query.lowercased())
        })
    }
}
