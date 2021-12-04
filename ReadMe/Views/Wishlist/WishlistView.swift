//
//  WishlistView.swift
//  ReadMe
//
//  Created by David Warderley on 01/12/2021.
//

import SwiftUI

struct WishlistView: View {
    @State private var showSearch: Bool = false
    
    var body: some View {
        ZStack {
            ListView(items: PreviewData().items, title: "Wishlist")
            ZStack(alignment: .bottomTrailing) {
                Color.clear
                Button {
                    showSearch = true
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
            }
            .padding(.bottom, 20)
            .padding(.trailing, 20)
        }
        .sheet(isPresented: $showSearch) {
            SearchView(isVisible: $showSearch, items:PreviewData().items)
        }
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
