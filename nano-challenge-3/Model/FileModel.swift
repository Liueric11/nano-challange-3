//
//  FileModel.swift
//  nano-challenge-3
//
//  Created by Eric Fernando on 17/07/24.
//

import Foundation
import SwiftData

enum FileType: String, CaseIterable, Identifiable {
    case book = "Book"
    case article = "Article"
    case journal = "Journal"
    case news = "News"
    case others = "Others"

    var id: String { rawValue }
}

@Model 
final class FileModel: Identifiable {
    var id: UUID
    var title: String
    private var typeRawValue: String
    let content: String
    
    // Computed property to convert stored string to enum
    var type: FileType {
        get {
            FileType(rawValue: typeRawValue) ?? .others
        }
        set {
            typeRawValue = newValue.rawValue
        }
    }
    
    // Designated initializer
    init(title: String, type: FileType, content: String) {
        self.id = UUID()
        self.title = title
        self.typeRawValue = type.rawValue
        self.content = content
    }
}
