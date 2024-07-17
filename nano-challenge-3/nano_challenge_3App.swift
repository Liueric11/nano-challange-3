//
//  nano_challenge_3App.swift
//  nano-challenge-3
//
//  Created by Eric Fernando on 11/07/24.
//

import SwiftUI
import SwiftData

@main
struct nano_challenge_3App: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Note.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(sharedModelContainer)
    }
}

