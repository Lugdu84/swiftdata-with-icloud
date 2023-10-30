//
//  garden_greenApp.swift
//  garden-green
//
//  Created by David Grammatico on 30/10/2023.
//

import SwiftUI
import SwiftData

@main
struct garden_greenApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Vegetable.self])
    }
}
