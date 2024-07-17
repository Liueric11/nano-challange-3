//import SwiftData
//import SwiftUI
//
//struct NoteViewOld : View {
//    @Environment(\.modelContext) private var modelContext
////    @Binding var note : Note
//    var noteId : UUID
//    @Query(filter: #Predicate<Note> { note in
//        note.id == noteId
//    }) var note: Note
//    
//    var body: some View {
//        List {
//            ForEach (note.paragraphs, id: \.self) { n in
//                NoteBlockView(associatedNote: $note, paragraphUUID: n.id)
//            }
//                .onDelete(perform: { indexSet in
//                    note.paragraphs.remove(atOffsets: indexSet)
//                })
//                .onMove { ( originIndex, destinationIndex ) in
//                    self.note.paragraphs.move(fromOffsets: originIndex, toOffset: destinationIndex)
//                }
//            Button {
//                note.paragraphs.append (
//                    .init("Hello world!", styled: .init(.body))
//                )
//            } label: {
//                Text("Add paragraph")
//            }
//        }
//            .navigationTitle(note.filename)
//            .toolbar {
//                ToolbarItemGroup (placement: .topBarTrailing) {
//                    EditButton()
//                    Button {
//                        do {
//                            try modelContext.save()
//                            note.paragraphs.forEach { par in
//                                debug("\(par.content): \(par.style.preset.rawValue)" )
//                            }
//                        } catch {
//                            print(error)
//                        }
//                    } label: {
//                        Text("Save")
//                    }
//                }
//            }
////            .listStyle(.)
//    }
//}
