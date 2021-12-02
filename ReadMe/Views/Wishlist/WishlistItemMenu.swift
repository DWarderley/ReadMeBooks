//
//  WishlistItemMenu.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI

struct WishlistItemMenu: View {
    @EnvironmentObject var callbacks:WishlistListViewItemCallbacks
    
    var body: some View {
        Menu {
            ListItemContextMenu().environmentObject(callbacks)
        } label: {
            Image(systemName: "ellipsis")
        }
    }
}
