import Foundation
import SwiftData

@Model final class Note : Identifiable, Hashable {
    
    var paragraphs: [NoteParagraph]
    var filename  : String
    var createdAt : Date
    var isPinned  : Bool
    var attempts  : [NoteAccessRecord]
    
    init ( content: [NoteParagraph], filename: String, createdAt: Date, isPinned: Bool, attempts: [NoteAccessRecord] ) {
        self.paragraphs = content
        self.filename  = filename
        self.createdAt = createdAt
        self.isPinned  = isPinned
        self.attempts  = attempts
    }
    
    convenience init ( ) {
        self.init (
            content   : [],
            filename  : AppConfig.defaultFilename,
            createdAt : .now,
            isPinned  : false,
            attempts  : []
        )
    }
    
}

// MARK: - Creation Chaining Methods
extension Note {
    
    /// Returns the object whose this method is chained to, with its ``content`` attribute filled with the supplied argument.
    func withContentOf ( _ p: [NoteParagraph] ) -> Self {
        self.paragraphs = p
        return self
    }
    
    /// Returns the object whose this method is chained to, with its ``filename`` attribute filled with the supplied argument.
    func withFilenameOf ( _ fn: String ) -> Self {
        self.filename = fn
        return self
    }
    
    /// Returns the object whose this method is chained to, with its ``isPinned`` attribute set to true.
    func withBeingPinned () -> Self {
        self.isPinned = true
        return self
    }
    
    /// Returns the object whose this method is chained to, with its ``attempts`` attribute filled with the supplied argument.
    func withAttemptsOf ( _ a: [NoteAccessRecord] ) -> Self {
        self.attempts = a
        return self
    }
    
}
