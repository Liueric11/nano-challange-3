import SwiftUI

/// Act as an intermediary view to be presented, when the ordered Note object hasn't yet been registered within the DataStore.
struct NoteCreationView: View {
    @State    var note          : Note
    @Bindable var folderReferer : Folder
    
    init ( referer: Bindable<Folder> ) {
        let note = Note()
        self.editView = NoteView(displays: note)
        self.note = note
        self._folderReferer = referer
    }
    
    var body : some View {
        editView
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        modelContext.insert(note)
                        folderReferer.contains.append(note)
                    } label: {
                        Text("ls.cta.done")
                    }
                }
            }
    }
    
    private var editView : NoteView
    
    @Environment(\.modelContext) private var modelContext
}
