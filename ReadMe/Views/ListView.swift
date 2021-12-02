//
//  ListView.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import SwiftUI

struct ListView: View {
    @State private var selectedEntry: BookSummary? = nil
    
    var items:[BookSummary]
    let title:String
    
    var body: some View {
        VStack {
            Text(title)
            List {
                ForEach(items) { item in
                    let calbacks = WishlistListViewItemCallbacks(
                        onMoveToRead: {
                            print("On move to read")
                        },
                        onMoveToStarted: {
                            print("On move started")
                        },
                        onMoveUp: {
                            print("On move up")
                        }, onMoveDown: {
                            print("On move down")
                        }, onDelete: {
                            print("On delete")
                        })
                    
                    ListItemView(item: item,
                         menu: WishlistItemMenu()
                            .environmentObject(calbacks),
                         contextMenu: WishlistItemContextMenu()
                            .environmentObject(calbacks))
                        .onTapGesture {
                            self.selectedEntry = item
                        }
                    
                }
            }
            .listStyle(PlainListStyle())
            .sheet(item: $selectedEntry) { entry in
                DetailView(item: entry)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(items: PreviewData().items,
                 title:"Wishlist")
    }
}
