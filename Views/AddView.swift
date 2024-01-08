//
//  AddView.swift
//  TodoList
//
//  Created by Fatih Eren Ozcelik on 5.01.2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type your to-do here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape((RoundedRectangle(cornerRadius: 10)))
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape((RoundedRectangle(cornerRadius: 10)))
                })
            }
            .padding(14)
        }
        .navigationTitle("Add a new to-do 🖊️")
        .alert(alertTitle, isPresented: $showAlert) {
        } message: {
            Text(alertMessage)
        }
        
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Warning"
            alertMessage = "New to-do must contain at least 3 characters 😨"
            showAlert.toggle()
            return false
        }
        return true
    }
    
//    func getAlert() -> Alert {
//        return Alert(title: Text(alertTitle))
//    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
