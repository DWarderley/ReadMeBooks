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
            ReadingList(bookOperations: bookOperations)
            ReadList(bookOperations: bookOperations)
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
