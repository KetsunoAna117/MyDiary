//
//  VideoJournal.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import Foundation

struct VideoJournal: Journal, Hashable {
    var id: UUID
    var title: String
    var caption: String
    var type: JournalType
    var videoURL: URL
    
    init(title: String, caption: String, videoURL: URL) {
        self.id = UUID()
        self.title = title
        self.caption = caption
        self.type = .video
        self.videoURL = videoURL
    }
    
}
