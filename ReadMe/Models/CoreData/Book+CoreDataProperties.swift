//
//  Book+CoreDataProperties.swift
//  ReadMe
//
//  Created by David Warderley on 04/12/2021.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var isbn: String
    @NSManaged public var author: String
    @NSManaged public var title: String
    @NSManaged public var imageURL: String
    @NSManaged public var stage: Int16

}

extension Book : Identifiable {

}
