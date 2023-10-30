//
//  Vegetable.swift
//  garden-green
//
//  Created by David Grammatico on 30/10/2023.
//

import SwiftData


@Model
class Vegetable {
    var name: String = ""
    
    @Relationship(deleteRule: .cascade) var notes: [Note]?
    
    
    init(name: String) {
        self.name = name
    }
}
