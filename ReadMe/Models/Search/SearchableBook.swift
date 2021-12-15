//
//  OpenLibraryBook.swift
//  ReadMe
//
//  Created by David Warderley on 15/12/2021.
//

import Foundation

struct SearchableBook : Codable {
    let key:String
    let title:String
    let isbn:[String]?
    let author_name:[String]?
    let cover_i:Int?
}
