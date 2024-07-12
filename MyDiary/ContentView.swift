//
//  ContentView.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @StateObject private var sharedJournalData = SharedJournalData()
    @State private var isCreateJournalButtonPressed: Bool = false
    @State private var isCreateDiaryPresented: Bool = false
    @State private var selectedDiaryType: JournalType = .photo
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, content: {
                let journalList = sharedJournalData.journalList
                if journalList.isEmpty == false {
                    List(journalList, id: \.id) { journal in
                        DiaryCard(diary: journal)
                            .swipeActions(){
                                Button("Delete") {
                                    sharedJournalData.deleteJournal(id: journal.id, type: journal.type)
                                }
                                .tint(Color.red)
                            }
                    }

                } else {
                    Text("There's no diary. Create one first!")
                }
            })
            .navigationTitle("My Diary")
            .toolbar(content: {
                Button(action: {
                    isCreateJournalButtonPressed = true
                }, label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                })
            })
            .confirmationDialog("Choose what to add", isPresented: $isCreateJournalButtonPressed) {
                Button("Text") {
                    self.selectedDiaryType = .text
                    self.isCreateDiaryPresented = true
                }
                Button("Photo") {
                    self.selectedDiaryType = .photo
                    self.isCreateDiaryPresented = true
                }
                Button("Video") {
                    self.selectedDiaryType = .video
                    self.isCreateDiaryPresented = true
                }
            }
            .navigationDestination(isPresented: $isCreateDiaryPresented) {
                switch selectedDiaryType {
                case .text:
                    CreateTextJournalView()
                case .photo:
                    EmptyView()
                case .video:
                    EmptyView()
                }
            }
            .onAppear(){
                sharedJournalData.modelContext = modelContext
                sharedJournalData.fetchJournalList()
            }
        }
    }
}

#Preview {
    ContentView()
}
