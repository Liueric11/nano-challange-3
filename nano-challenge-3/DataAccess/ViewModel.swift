import SwiftData
import SwiftUI

protocol ViewModel {
    var modelContext : ModelContext { get set }
}

class RNViewModel : ViewModel {
    var modelContext: ModelContext
    
    init ( _ context : ModelContext ) {
        self.modelContext = context
    }
    
    @Query var folders : [Folder]
    
    func getAllNotes ( ) -> [Note] {
        var noteWithin : [Note] = []
        self.folders.forEach { folder in
            noteWithin.append(contentsOf: folder.contains)
        }
        return noteWithin
    }
    
    func getNotes ( from: Folder ) -> [Note] {
        var noteWithin : [Note] = []
        from.contains.forEach { note in
            noteWithin.append(note)
        }
        return noteWithin
    }
    
    func getParagraphs ( from: Note ) -> [NoteParagraph] {
        let paragraphs = from.paragraphs
        return paragraphs
    }
}
