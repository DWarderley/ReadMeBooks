//
//  TabListsView.swift
//  ReadMe
//
//  Created by David Warderley on 01/12/2021.
//

import SwiftUI

struct TabListsView: View {
    var body: some View {
        TabView {
            ListView(items: PreviewData().items, title: "Wishlist")
            ListView(items: PreviewData().items, title: "Reading List")
            ListView(items: PreviewData().items, title: "Read")
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct TabListsView_Previews: PreviewProvider {
    static var previews: some View {
        TabListsView()
    }
}
