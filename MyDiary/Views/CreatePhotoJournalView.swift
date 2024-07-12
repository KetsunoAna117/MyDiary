//
//  CreatePhotoJournalView.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 11/07/24.
//

import SwiftUI

struct CreatePhotoJournalView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @StateObject private var photoJournalViewmodel = PhotoJournalViewmodel()
    
    @State private var textTitle: String = "Title"
    @State private var textContent: String = "Content"
    
    @FocusState private var isTextTitleFocused: Bool
    @FocusState private var isTextContentFocused: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CreatePhotoJournalView()
}
