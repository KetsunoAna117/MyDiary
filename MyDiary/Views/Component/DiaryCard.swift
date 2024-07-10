//
//  DiaryCard.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import SwiftUI

struct DiaryCard: View {
    let diary: any Journal
    
    var body: some View {
        VStack {
            switch diary.type {
            case .text:
                VStack(alignment: .leading) {
                    if let textJournal = diary as? TextJournal {
                        Text(textJournal.title)
                            .fontWeight(.bold)
                        Text(textJournal.caption)
                            .lineLimit(3)
                            .truncationMode(.tail)
                    }
                }
            case .photo:
                VStack(alignment: .leading) {
                    if let textJournal = diary as? PhotoJournal {
                        Text(textJournal.title)
                            .fontWeight(.bold)
                        Text(textJournal.caption)
                            .lineLimit(3)
                            .truncationMode(.tail)
                    }
                }
            case .video:
                VStack(alignment: .leading) {
                    if let textJournal = diary as? VideoJournal {
                        Text(textJournal.title)
                            .fontWeight(.bold)
                        Text(textJournal.caption)
                            .lineLimit(3)
                            .truncationMode(.tail)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    DiaryCard(diary: TextJournal(title: "Deez Nuts", caption: "The caption of deez nuts"))
}
