//
//  InterviewProjectVitorZittiApp.swift
//  InterviewProjectVitorZitti
//
//  Created by Vitor Zitti on 27/07/24.
//

import SwiftUI
import SwiftData

@main
struct InterviewProjectVitorZittiApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            if CommandLine.arguments.contains("-UITestForListView") {
                let testCatData = [CatData(catId: "listTest", tags: ["feline"])]
                CatListView(model: CatListViewModel(catsToShow: testCatData, catApiDelegate: nil))
            } else if CommandLine.arguments.contains("-UITestForDetailsView") {
                let testCatData = CatData(catId: "detailsTest", tags: ["catto"])
                CatDetailsView(model: CatDetailsViewModel(cat: testCatData))
            } else {
                
                CatListView(model: CatListViewModel())
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
