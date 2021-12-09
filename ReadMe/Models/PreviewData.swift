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
    var bookSummary = BookSummary(isbn: "0", title: "Book Title That is too long to fit", author: "Author", imageURL: "https://cdn.pixabay.com/photo/2019/08/02/14/41/fantasy-4379818_1280.jpg")
    var items:[BookSummary]
    
    init()
    {
        items = [bookSummary, BookSummary(isbn: "1", title: "Book Title 2", author: "Author 2", imageURL: "https://cdn.pixabay.com/photo/2020/03/15/13/49/temple-4933682_1280.jpg"),
                 BookSummary(isbn: "2", title: "Book Title 3", author: "Author 3", imageURL: "https://cdn.pixabay.com/photo/2018/01/21/20/29/fantasy-3097474_1280.jpg")]
    }
}
