//
//  BookSummary.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import Foundation
import SwiftUI

struct BookSummary: Identifiable
{
    let id: String
    let title:String
    let author:String
    let image:Image
    
    init(isbn:String, title:String,
         author:String, image:Image)
    {
        self.id = isbn;
        self.title = title;
        self.author = author;
        self.image = image;
    }
}
