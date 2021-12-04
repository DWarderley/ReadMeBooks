//
//  SearchBarView.swift
//  ReadMe
//
//  Created by David Warderley on 04/12/2021.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var toSearch:String;
    @State var searchInProgress = false
    var onCloseRequest: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading) {
             ZStack {
                 Rectangle()
                     .foregroundColor(Color(UIColor.systemGray5))
                 HStack {
                     if(searchInProgress == false) {
                         Image(systemName: "magnifyingglass")
                     }
                     else {
                         Button {
                             toSearch = ""
                              withAnimation {
                                  searchInProgress = false
                                  UIApplication.shared.dismissKeyboard()
                                  onCloseRequest()
                              }
                         } label: {
                             Image(systemName: "chevron.left")
                         }
                     }
                     TextField("Search ..", text: $toSearch) { startedEditing in
                          if startedEditing {
                              withAnimation {
                                  searchInProgress = true
                              }
                          }
                      } onCommit: {
                          withAnimation {
                              searchInProgress = false
                          }
                      }
                 }
                 .foregroundColor(.gray)
                 .padding(.leading, 10)

             }
             .frame(height: 40)
             .cornerRadius(10)
             .padding()
         }
    }
}

extension UIApplication {
  func dismissKeyboard() {
      sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(toSearch: .constant(""),
          onCloseRequest:{})
    }
}
