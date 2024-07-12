//
//  SharedJournalData.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import Foundation
import SwiftData

class SharedJournalData: ObservableObject {
    var modelContext: ModelContext?
    @Published var journalList: [any Journal] = []
    
    func fetchJournalList(){
        if let modelContext = modelContext {
            journalList.removeAll()
            fetchTextJournal(modelContext: modelContext)
            fetchPhotoJournal(modelContext: modelContext)
            fetchVideoJournal(modelContext: modelContext)
            print("Journal Fetched")
        } else {
            print("Model context is not defined at SharedJournalData")
        }
    }
    
    private func fetchTextJournal(modelContext: ModelContext){
        let fetchDescriptor = FetchDescriptor<TextJournal>()

        if let fetchedTextJournal = (try? modelContext.fetch(fetchDescriptor)) {
            self.journalList.append(contentsOf: fetchedTextJournal)
        }
    }
    
    private func fetchPhotoJournal(modelContext: ModelContext) {
        let fetchDescriptor = FetchDescriptor<PhotoJournal>()

        if let fetchedPhotoJournal = (try? modelContext.fetch(fetchDescriptor)) {
            self.journalList.append(contentsOf: fetchedPhotoJournal)
        }
    }
    
    private func fetchVideoJournal(modelContext: ModelContext){
        let fetchDescriptor = FetchDescriptor<VideoJournal>()

        if let fetchedVideoJournal = (try? modelContext.fetch(fetchDescriptor)) {
            self.journalList.append(contentsOf: fetchedVideoJournal)
        }
    }
    
    func deleteJournal(id: UUID, type: JournalType){
        if let modelContext = modelContext {
            print("Delete journal function called")
            switch type {
            case .text:
                let predicate = #Predicate<TextJournal> { journal in
                    journal.id == id
                }
                try? modelContext.delete(model: TextJournal.self, where: predicate)
                
            case .photo:
                let predicate = #Predicate<PhotoJournal> { journal in
                    journal.id == id
                }
                try? modelContext.delete(model: PhotoJournal.self, where: predicate)
            case .video:
                let predicate = #Predicate<VideoJournal> { journal in
                    journal.id == id
                }
                try? modelContext.delete(model: VideoJournal.self, where: predicate)
            }
            fetchJournalList()
        }
    }
    
}
