//
//  SharedJournalData.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import Foundation

class SharedJournalData: ObservableObject {
    @Published var journalList: [any Journal]?
    
}
