//
//  PreviewContainer.swift
//  garden-green
//
//  Created by David Grammatico on 30/10/2023.
//

import SwiftData
import SwiftUI

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Vegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        SampleData.vegetables.forEach { vegetable in
            container.mainContext.insert(vegetable)
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

struct SampleData {
    static let vegetables: [Vegetable] = {
        return [Vegetable(name:"Tomato"), Vegetable(name:"Potato"), Vegetable(name:"Carrot")]
    }()
}
