//
//  RecordModel.swift
//  nano-challenge-3
//
//  Created by Eric Fernando on 17/07/24.
//

import Foundation
import SwiftData

@Model
final class RecordModel: Identifiable {
    var id: UUID
    var fieldId: UUID
    var openedAt: Date
    var closedAt: Date? = nil
    
    var duration: TimeInterval {
        guard let closedAt = closedAt else { return 0 }
        return closedAt.timeIntervalSince1970.rounded(.down) - openedAt.timeIntervalSince1970.rounded(.down)
    }
    
    init(fieldId: UUID) {
        self.id = UUID()
        self.fieldId = fieldId
        self.openedAt = Date()
    }
}
