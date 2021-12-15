//
//  SearchController.swift
//  ReadMe
//
//  Created by David Warderley on 15/12/2021.
//

import Foundation

class SearchController : ISearchController {
    func search(query:String, onComplete:@escaping ([IBook]) -> Void) {
        if let url = URL(string: "https://openlibrary.org/search.json?title=clean%20code") {
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else {
                    onComplete([])
                    return
                }
                self.parse(json: data, onComplete: { searchableBooks in
                    onComplete(searchableBooks.map { SearchableBookWrapper(book: $0)})
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
}
