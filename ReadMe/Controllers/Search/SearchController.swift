//
//  SearchController.swift
//  ReadMe
//
//  Created by David Warderley on 15/12/2021.
//

import Foundation

class SearchController : ISearchController {
    
    let bookOperations:IBookOperations
    
    init(bookOperations:IBookOperations) {
        self.bookOperations = bookOperations
    }
    
    func search(query:String, onComplete:@escaping ([IBook]) -> Void) {
        if(query.count == 0) {
            onComplete([])
        }
        
        let encodedQuery:String = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: "https://openlibrary.org/search.json?title=\(String(describing: encodedQuery))&limit=20") {
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else {
                    onComplete([])
                    return
                }
                self.parse(json: data, onComplete: { rawSearchableBooks in
                    let searchableBooks = self.filterOutTracked(books: rawSearchableBooks.map { SearchableBookWrapper(book: $0)})
                    onComplete(searchableBooks)
                }, onError: {
                    onComplete([])
                })
            }

            task.resume()
        }
    }
    
    func parse(json:Data, onComplete:@escaping ([SearchableBook]) -> Void, onError:@escaping () -> Void) {
        let decoder = JSONDecoder()
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let jsonBooksCollection = try decoder.decode(SearchableBookCollection.self, from: json)
                let books:[SearchableBook] = jsonBooksCollection.docs
                
                DispatchQueue.main.async {
                    onComplete(books)
                }
            }
            catch let jsonError as NSError {
                DispatchQueue.main.async {
                    print("error parsing json \(jsonError)")
                    onError()
                }
            }
        }
    }
    
    func filterOutTracked(books: [IBook]) -> [IBook] {
        books.filter { book in
            return (bookOperations.isTracked(isbn: book.isbn) == false)
        }
    }
}
