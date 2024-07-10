//
//  ContentView.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var sharedJournalData = SharedJournalData()
    @State private var isCreateJournalButtonPressed: Bool = false
    @State private var isCreateDiaryPresented: Bool = false
    @State private var selectedDiaryType: JournalType = .photo
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, content: {
                if let journalList = sharedJournalData.journalList {
                    if journalList.isEmpty == false {
                        List(journalList, id: \.id) { journal in
                            DiaryCard(diary: journal)
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
        }
    }
}

#Preview {
    ContentView()
}
