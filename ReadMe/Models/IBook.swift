//
//  IBook.swift
//  ReadMe
//
//  Created by David Warderley on 08/12/2021.
//

import Foundation

protocol IBook {
    var isbn:String { get }
    func getAuthor() -> String
    func getTitle() -> String
    func getImageURL() -> String
}
