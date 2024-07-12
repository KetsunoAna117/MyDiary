//
//  CreateTextJournalView.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import SwiftUI
import SwiftData

struct CreateTextJournalView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @StateObject private var textJournalViewModel = TextJournalViewmodel()
    
    @State private var textTitle: String = "Title"
    @State private var textContent: String = "Content"
    
    @FocusState private var isTextTitleFocused: Bool
    @FocusState private var isTextContentFocused: Bool
    
    var body: some View {
        VStack {
            TextEditor(text: $textTitle)
                .fontWeight(.bold)
                .font(.title)
                .frame(maxHeight: 70)
                .focused($isTextTitleFocused)
                .onTapGesture {
                    if textTitle == "Title" {
                        textTitle = ""
                    }
                }
                .onChange(of: isTextTitleFocused) { oldValue, newValue in
                    if !newValue && textTitle.isEmpty {
                        textTitle = "Title"
                    }
                }
            
            TextEditor(text: $textContent)
                .frame(minHeight: 200)
                .focused($isTextContentFocused)
                .onTapGesture {
                    if textContent == "Content" {
                        textContent = ""
                    }
                }
                .onChange(of: isTextContentFocused) { oldValue, newValue in
                    if !newValue && textContent.isEmpty {
                        textContent = "Content"
                    }
                }
            Button(action: {
                textJournalViewModel.saveJournal(title: textTitle, content: textContent)
                dismiss()
                
            }, label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .fontWeight(.bold)
            })
            .buttonStyle(BorderedProminentButtonStyle())
        }
        .onAppear() {
            textJournalViewModel.modelContext = modelContext
        }
        .padding()
        .navigationTitle("Create text journal")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CreateTextJournalView()
    }
}
