//
//  ListItemView.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import SwiftUI

struct ListItemView<MenuRenderer: View, ContextMenuRenderer: View>: View {
    var item:BookSummary
    let menu:MenuRenderer
    let contextMenu:ContextMenuRenderer
    
    var body: some View {
        HStack
        {
            item.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45)
                .frame(height: 45)
            VStack(alignment: .leading)
            {
                Text(item.title)
                    .font(.title)
                    .lineLimit(1)
                Text(item.author)
                    .font(.caption)
                    .lineLimit(1)
            }
            Spacer()
            menu
        }
        .contextMenu {
            contextMenu
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(item: PreviewData().bookSummary,
            menu: WishlistItemMenu(), contextMenu: WishlistItemContextMenu())
    }
}
