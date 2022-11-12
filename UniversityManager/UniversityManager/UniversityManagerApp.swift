//
//  UniversityManagerApp.swift
//  UniversityManager
//
//  Created by Danil Bochkarev on 19.10.2022.
//

import SwiftUI
import CoreData

@main
struct UniversityManagerApp: App {
    
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            Launch_Screen()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
