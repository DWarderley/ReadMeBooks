//
//  IBookOperations.swift
//  ReadMe
//
//  Created by David Warderley on 07/12/2021.
//

import Foundation

protocol IBookOperations {
    func createBook(isbn:String)
    func filterBy(stage:Stage) -> [IBook]
}
