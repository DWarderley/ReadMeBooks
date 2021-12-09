//
//  PersistenceController.swift
//  ReadMe
//
//  Created by David Warderley on 04/12/2021.
//

import Foundation
import CoreData

class PersistenceController {
    var container: NSPersistentContainer!
    
    init() {
        container = NSPersistentContainer(name: "BookCoreData")

        container.loadPersistentStores { storeDescription, error in
            self.container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            if let error = error {
                print("Error loading data: \(error)")
            }
        }
    }
}
