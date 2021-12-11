//
//  ListItemDummyRenderer.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI

struct ListItemDummyRenderer: ListItemMenu {
    
    var body: some View {
        EmptyView()
    }
    
    public func render(book:IBook) -> some View {
        EmptyView()
    }
}
