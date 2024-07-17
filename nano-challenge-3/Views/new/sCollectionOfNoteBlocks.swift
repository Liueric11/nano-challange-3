import SwiftUI

struct CollectionOfNoteBlocks : View {
    @Bindable var from : Note
    
    var body: some View {
        ForEach ( $from.paragraphs ) { par in
            NoteBlock (
                paragraph: par
            )
                .listRowSeparator(.hidden)
        }
            .onDelete(perform: { indexSet in
                from.paragraphs.remove(atOffsets: indexSet)
            })
            .onMove { ( originIndex, destinationIndex ) in
                self.from.paragraphs.move(fromOffsets: originIndex, toOffset: destinationIndex)
            }
    }
}
