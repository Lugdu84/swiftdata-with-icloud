//
//  ContentView.swift
//  garden-green
//
//  Created by David Grammatico on 30/10/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var vegetables: [Vegetable]
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        let newGarden = Vegetable(name: name)
                        context.insert(newGarden)
                        name = ""
                    }
                Spacer()
                List {
                    ForEach(vegetables) { vegetable in
                        NavigationLink {
                            NoteListScreen(vegetable: vegetable)
                        } label: {
                            Text(vegetable.name)
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let vegetable = vegetables[index]
                            context.delete(vegetable)
                        }
                    }
                }
            }
            .padding()
        .navigationTitle("Garden Greens")
        }
    }
}

#Preview { @MainActor in
    NavigationStack {
        ContentView()
            .modelContainer(previewContainer)
    }
}
