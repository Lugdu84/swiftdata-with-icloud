//
//  NoteListScreen.swift
//  garden-green
//
//  Created by David Grammatico on 30/10/2023.
//

import SwiftUI
import SwiftData

struct NoteListScreen: View {
    @Environment(\.modelContext) private var context
    @Query private var notes: [Note]
    @Bindable var vegetable: Vegetable
    
    // Pour permettre la syncro en temps réel des notes
    private var notesByVegetable: [Note] {
        
        notes.filter { $0.vegetable?.id == vegetable.id }
    }
    
    @State private var text: String = ""
    var body: some View {
        VStack(content: {
            TextField("Note", text: $text)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    let note = Note(text: text)
                    note.vegetable = vegetable
                    text = ""
                }
            List {
                ForEach(notesByVegetable) { note in
                    Text(note.text)
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        context.delete(notesByVegetable[index])
                    }
                })
            }
            Spacer()
        })
        .padding()
        .navigationTitle(vegetable.name)
    }
}

struct NoteListContainerScreen: View {
    @Query private var vegetables: [Vegetable]
    var body: some View {
        NoteListScreen(vegetable: vegetables[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        NoteListContainerScreen()
            .modelContainer(previewContainer)
    }
}
