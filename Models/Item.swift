//
//  Item.swift
//  TodoList
//
//  Created by Fatih Eren Ozcelik on 5.01.2024.
//

import Foundation

struct Item: Identifiable, Codable {
    var id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> Item {
        return Item(id: id, title: title, isCompleted: !isCompleted)
    }
}

struct Category: Identifiable, Codable {
    var id: String
    let title: String
    let items: [Item]
    
}
