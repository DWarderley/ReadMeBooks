//
//  ListView.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import SwiftUI

struct ListView: View {
    @State var selectedEntry: BookSummary? = nil
    
    var items:[BookSummary]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListItemView(item: item)
                    .environmentObject(ListViewItemCallbacks(
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
                    }))
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(items: PreviewData().items)
    }
}
