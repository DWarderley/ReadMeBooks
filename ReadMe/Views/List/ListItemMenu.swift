//
//  ListMenu.swift
//  ReadMe
//
//  Created by David Warderley on 08/12/2021.
//

import Foundation
import SwiftUI

protocol ListItemMenu {
    associatedtype T:View
    func render(book:IBook) -> Self.T
}
