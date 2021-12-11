//
//  PersistentBook.swift
//  ReadMe
//
//  Created by David Warderley on 04/12/2021.
//

import Foundation

enum Stage: Int16, Codable, CaseIterable {
    case None
    case Wishlist
    case Reading
    case Read
}
