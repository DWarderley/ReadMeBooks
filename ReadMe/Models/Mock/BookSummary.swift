//
//  BookSummary.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import Foundation
import SwiftUI

class BookSummary: IBook {
    var isbn: String
    let title:String
    let author:String
    let imageURL:String
    
    init(isbn:String, title:String,
         author:String, imageURL:String)
    {
        self.isbn = isbn;
        self.title = title;
        self.author = author;
        self.imageURL = imageURL;
    }
    
    init() {
        self.isbn = ""
        self.title = ""
        self.author = ""
        self.imageURL = ""
    }
}
