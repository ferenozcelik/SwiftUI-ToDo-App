//
//  TodoListApp.swift
//  TodoList
//
//  Created by Fatih Eren Ozcelik on 5.01.2024.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {            
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
