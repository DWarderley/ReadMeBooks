//
//  SearchView.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI

struct SearchView: View {
    @State private var toSearch = ""
    var items:[BookSummary]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    ListItemView(item: item,
                         menu: ListItemDummyRenderer(),
                         contextMenu: ListItemDummyRenderer())
                }
            }
            .listStyle(PlainListStyle())
        }
        .searchable(text: $toSearch)
        .navigationTitle("Searchable Example")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(items:PreviewData().items)
    }
}
