//
//  ReadMeApp.swift
//  ReadMe
//
//  Created by David Warderley on 29/11/2021.
//

import SwiftUI

@main
struct ReadMeApp: App {
    let persistence:PersistenceController = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            TabListsView(bookOperations: BookOperations(viewContext: persistence.container.viewContext))
        }
    }
}
