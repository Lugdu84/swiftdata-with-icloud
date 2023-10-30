//
//  Note.swift
//  garden-green
//
//  Created by David Grammatico on 30/10/2023.
//

import SwiftData

@Model
class Note {
    var text: String = ""
    var vegetable: Vegetable?
    
    init(text: String) {
        self.text = text
    }
}
