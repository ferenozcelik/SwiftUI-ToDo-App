//
//  ListRowView.swift
//  TodoList
//
//  Created by Fatih Eren Ozcelik on 5.01.2024.
//

import SwiftUI


struct ListRowView: View {
    
    let item: Item
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
                .strikethrough(item.isCompleted, color: .green)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = Item(title: "Item 1", isCompleted: false)
    static var item2 = Item(title: "Item 2", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
