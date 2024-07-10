//
//  PhotoJournal.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import Foundation
import UIKit

struct PhotoJournal: Journal, Hashable {
    var id: UUID
    var title: String
    var caption: String
    var type: JournalType
    var photoURL: URL
    var photoIMG: UIImage?
    
    init(title: String, caption: String, photoURL: URL, photoIMG: UIImage? = nil) {
        self.id = UUID()
        self.title = title
        self.caption = caption
        self.type = .photo
        self.photoURL = photoURL
        self.photoIMG = photoIMG
    }
    
    
    
    
}
