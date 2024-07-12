//
//  JournalProtocol.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import Foundation
import SwiftData

protocol Journal: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID { get }
    var title: String { get }
    var caption: String { get }
    var type: JournalType { get }
}
