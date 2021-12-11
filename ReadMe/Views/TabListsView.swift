//
//  TabListsView.swift
//  ReadMe
//
//  Created by David Warderley on 01/12/2021.
//

import SwiftUI

struct TabListsView: View {
    let bookOperations:IBookOperations
    
    var body: some View {
        TabView {
            WishlistView(bookOperations: bookOperations)
            ListView(books: bookOperations.fetchStageCollection(stage: Stage.Reading), menu: ListItemDummyRenderer(), contextMenu: ListItemDummyRenderer(), title: "Reading List", emptyListText: "You aren't currently reading any books")
            
            ListView(books: bookOperations.fetchStageCollection(stage: Stage.Read), menu: ListItemDummyRenderer(), contextMenu: ListItemDummyRenderer(), title: "Read",  emptyListText: "You haven't finished any books yet. Get to it!")
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct TabListsView_Previews: PreviewProvider {
    static var previews: some View {
        TabListsView(bookOperations: MockBookOperations(books: PreviewData().items))
    }
}
