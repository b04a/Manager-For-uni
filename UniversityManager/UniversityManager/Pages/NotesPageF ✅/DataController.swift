//
//  DataController.swift
//  UniversityManager
//
//  Created by Danil Bochkarev on 28.10.2022.
//

import Foundation
import CoreData


class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "NotesModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error {
                print("Error load core data: \(error.localizedDescription)")
            }
        }
        
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!")
        } catch {
            print("Error, data not saved :(")
        }
    }
    
    
    func addNotes(title: String, opis: String, priority: String, context: NSManagedObjectContext) {
        let notes = Notes(context: context)
        notes.title = title
        notes.opis = opis
        notes.priority = priority
        notes.id = UUID()
        notes.date = Date()
        
        save(context: context)
    }
    
}
