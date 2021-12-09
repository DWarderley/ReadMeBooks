//
//  DetailView.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import SwiftUI

struct DetailView: View {
    var item:IBook
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10){
                AsyncImage(url: URL(string:item.getImageURL())) { image in
                    image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
                } placeholder: {
                    frame(width: 100, height: 200)
                }
                Text(item.getTitle())
                    .font(.largeTitle)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                Text(item.getAuthor())
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
