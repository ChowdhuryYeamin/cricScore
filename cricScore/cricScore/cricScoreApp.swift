//
//  cricScoreApp.swift
//  cricScore
//
//  Created by Yamin Ayon on 8/9/23.
//

import SwiftUI

@main
struct cricScoreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomePageViewWrapper()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
