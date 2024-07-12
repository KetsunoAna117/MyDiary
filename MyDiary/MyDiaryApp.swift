//
//  MyDiaryApp.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import SwiftUI
import SwiftData

@main
struct MyDiaryApp: App {
    var sharedModelContainer: ModelContainer = {
        do {
            let schema = Schema([
                TextJournal.self,
                PhotoJournal.self,
                VideoJournal.self
            ])
            
            let config = ModelConfiguration(
                schema: schema,
                isStoredInMemoryOnly: false
            )
            
            return try ModelContainer(
                for: schema,
                configurations: config
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
