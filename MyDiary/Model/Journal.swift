//
//  JournalProtocol.swift
//  MyDiary
//
//  Created by Hans Arthur Cupiterson on 10/07/24.
//

import Foundation
import SwiftData

protocol Journal: Identifiable, Hashable {
    var id: UUID { get }
    var title: String { get set }
    var caption: String { get set }
    var type: JournalType { get }
}
