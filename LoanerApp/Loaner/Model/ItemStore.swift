//
//  ItemStore.swift
//  loaner
//
//  Created by Mark Kim on 9/14/20.
//  Copyright © 2020 LinnierGames. All rights reserved.
//

import UIKit
import CoreData

class ItemStore: NSObject {
    
    let persistentContainer: NSPersistentContainer = {
        // Creates the NSPersistentContainer object
        // Must be given the name of the Core Data model file "LoanedItems"
        let container = NSPersistentContainer(name: "LoanedItems")
        
        // Load the saved database if it exists, creates if it does not, and reeturns an error if fail
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error setting up Core Data (\(error))")
            }
        }
        return container
    }()
    
    func saveContext() {
        let viewContext = persistentContainer.viewContext
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
