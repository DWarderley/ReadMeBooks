//
//  SearchFieldObserver.swift
//  ReadMe
//
//  Created by David Warderley on 18/12/2021.
//

import Foundation
import Combine
import SwiftUI

class SearchFieldObserver : ObservableObject {
    @Published var searchText = ""
    @Published var toSearch = ""
    var onSearchUpdated:((String) -> Void)?
    
    private var subscriptions = Set<AnyCancellable>()
    
    init( ) {
        $searchText
           .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
           .removeDuplicates()
           .sink(receiveValue: { searchVal in
               self.toSearch = searchVal
           })
           .store(in: &subscriptions)
    }
}
