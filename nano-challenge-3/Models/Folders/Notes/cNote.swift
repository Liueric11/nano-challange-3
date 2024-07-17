import Foundation
import SwiftData

@Model final class Note : Identifiable, Hashable {
    
    @Relationship(deleteRule: .cascade) var paragraphs: [NoteParagraph]
    var filename  : String {
        get {
            paragraphs.first?.content ?? AppConfig.defaultFilename
        }
    }
    var createdAt : Date
    var isPinned  : Bool
    var attempts  : [NoteAccessRecord]
    
    init ( content: [NoteParagraph], createdAt: Date, isPinned: Bool, attempts: [NoteAccessRecord] ) {
        self.paragraphs = content
        self.createdAt = createdAt
        self.isPinned  = isPinned
        self.attempts  = attempts
    }
    
    convenience init ( ) {
        self.init (
            content: [
                NoteParagraph (
                    "My note", 
                    styled: NoteBlockStyle (
                        NoteBlockPreset.title
                    )
                ),
                NoteParagraph (
                    """
                    This note is very empty!
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    """, 
                    styled: NoteBlockStyle (
                        NoteBlockPreset.body
                    )
                )
            ], 
            createdAt: .now, 
            isPinned: false, 
            attempts: []
            
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
