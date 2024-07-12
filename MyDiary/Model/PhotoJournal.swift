//
//  PhotoJournal.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import Foundation
import UIKit
import SwiftData

@Model
class PhotoJournal: Journal, Hashable {
    @Attribute(.unique) var id: UUID
    var title: String
    var caption: String
    var type: JournalType
    var photoURL: URL
    
    init(title: String, caption: String, photoURL: URL) {
        self.id = UUID()
        self.title = title
        self.caption = caption
        self.type = .photo
        self.photoURL = photoURL
    }
    
    
    
    
}
