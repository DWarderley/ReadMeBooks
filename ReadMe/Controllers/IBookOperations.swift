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
    func moveToReading(book:IBook)
    func moveToRead(book:IBook)
}
