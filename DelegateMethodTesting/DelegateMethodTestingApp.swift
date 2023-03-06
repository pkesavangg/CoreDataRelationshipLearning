//
//  DelegateMethodTestingApp.swift
//  DelegateMethodTesting
//
//  Created by Kesavan Panchabakesan on 06/03/23.
//

import SwiftUI

@main
struct DelegateMethodTestingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
