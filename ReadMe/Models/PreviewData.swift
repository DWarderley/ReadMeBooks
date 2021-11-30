//
//  PlaceholderData.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import Foundation
import SwiftUI

final class PreviewData
{
    var bookSummary = BookSummary(isbn: "0", title: "Book Title That is too long to fit", author: "Author", image: Image("SampleCover1"))
    var items:[BookSummary]
    
    init()
    {
        items = [bookSummary, BookSummary(isbn: "1", title: "Book Title 2", author: "Author 2", image: Image("SampleCover2")),
            BookSummary(isbn: "2", title: "Book Title 3", author: "Author 3", image: Image("SampleCover3"))]
    }
}
