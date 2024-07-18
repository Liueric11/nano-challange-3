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
    var date: Date
    var seconds: Int
    
    init(seconds: Int, date: Date) {
        self.id = UUID()
        self.date = date
        self.seconds = seconds
    }
}
