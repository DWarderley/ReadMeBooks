//
//  WishlistItemContextMenu.swift
//  ReadMe
//
//  Created by David Warderley on 02/12/2021.
//

import SwiftUI

struct WishlistItemContextMenu: View {
    @EnvironmentObject var callbacks:WishlistListViewItemCallbacks
    
    var body: some View {
        ListItemContextMenu().environmentObject(callbacks)
    }
}

