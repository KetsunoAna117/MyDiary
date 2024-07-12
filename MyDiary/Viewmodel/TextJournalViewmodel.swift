//
//  TextJournalViewmodel.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import Foundation
import SwiftData

class TextJournalViewmodel: ObservableObject {
    var modelContext: ModelContext?
    
    func saveJournal(title: String, content: String){
        let textJournal = TextJournal(title: title, caption: content)
        if let modelContext = modelContext {
            modelContext.insert(textJournal)
            try? modelContext.save()
        }
    }
}
