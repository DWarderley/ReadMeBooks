//
//  ListItemView.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import SwiftUI

struct ListItemView<MenuRenderer:ListItemMenu, ContextMenuRenderer:ListItemMenu> : View {
    var book:IBook
    var menu:MenuRenderer
    var contextMenu:ContextMenuRenderer
    var onTapped:() -> Void
    
    var body: some View {
        HStack {
            HStack {
                AsyncImage(url: URL(string:book.imageURL)) { image in
                        image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45)
                        .frame(height: 45)
                } placeholder: {
                    Image(systemName: "circle.dotted")
                        .frame(width: 45, height: 45)
                }
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.title)
                        .lineLimit(1)
                    Text(book.author)
                        .font(.caption)
                        .lineLimit(1)
                }
                
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                onTapped()
            }
               
            menu.render(book: book)
        }
         
        .contextMenu {
            contextMenu.render(book: book)
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let callbacks = WishlistListViewItemCallbacks()

        ListItemView(book: PreviewData().bookSummary, menu: WishlistItemMenu(callbacks: callbacks, bookCollection: BookCollection()), contextMenu: WishlistItemContextMenu(callbacks: callbacks, bookCollection: BookCollection()), onTapped: {})
    }
}
