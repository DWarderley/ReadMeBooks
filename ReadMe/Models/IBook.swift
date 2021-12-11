//
//  IBook.swift
//  ReadMe
//
//  Created by David Warderley on 08/12/2021.
//

import Foundation

protocol IBook : AnyObject {
    var isbn:String { get }
    var author:String { get }
    var title:String { get }
    var imageURL:String { get }
}
