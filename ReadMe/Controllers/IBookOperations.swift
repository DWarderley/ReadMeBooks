//
//  IBookOperations.swift
//  ReadMe
//
//  Created by David Warderley on 07/12/2021.
//

import Foundation

protocol IBookOperations {
    func createBook(book:IBook)
    func fetchStageCollection(stage:Stage) -> BookCollection
    func moveToWishlist(book:IBook)
    func moveToReading(book:IBook)
    func moveToRead(book:IBook)
    func delete(book: IBook)
    func isTracked(isbn:String) -> Bool
}
