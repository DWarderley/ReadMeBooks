//
//  DetailView.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import SwiftUI

struct DetailView: View {
    var item:BookSummary
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10){
                item.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
                Text(item.title)
                    .font(.largeTitle)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                Text(item.author)
                Divider()
                Spacer()
            }
            .padding(.top)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: PreviewData().bookSummary)
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
