//
//  TextJournal.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import Foundation

struct TextJournal: Journal, Hashable {
    var id: UUID
    
    var title: String
    
    var caption: String
    
    var type: JournalType
    
    init(title: String, caption: String) {
        self.id = UUID()
        self.title = title
        self.caption = caption
        self.type = .text
    }
}
