//
//  ListItemDummyRenderer.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI

struct ListItemDummyRenderer: ListMenu {
    var book: IBook?
    
    init() {
        book = BookSummary()
    }
    
    var body: some View {
        EmptyView()
    }
}
