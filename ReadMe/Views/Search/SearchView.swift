//
//  SearchView.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI

struct SearchView: View {
    @State private var toSearch = ""
    @Binding var isVisible: Bool
    var items:[BookSummary]
    
    var body: some View {
        VStack{
            HStack {
                SearchBarView(toSearch: $toSearch, onCloseRequest: {
                    isVisible = false
                })
                Button("Cancel") {
                    isVisible = false
                }
                .padding(.trailing, 10)
                .padding(.leading, -10)
            }
            List {
                ForEach(search) { item in
                    ListItemView(item: item,
                         menu: ListItemDummyRenderer(),
                         contextMenu: ListItemDummyRenderer())
                }
            }
            .listStyle(PlainListStyle())
            .gesture(DragGesture()
                 .onChanged({ _ in
                     UIApplication.shared.dismissKeyboard()
                 })
             )
        }
    }
    
    var search: [BookSummary] {
        if toSearch.isEmpty {
            return items
        } else {
            return items.filter {
                $0.title.lowercased().contains(toSearch.lowercased()) ||
                $0.author.lowercased().contains(toSearch.lowercased())
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isVisible: .constant(true), items:PreviewData().items)
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
