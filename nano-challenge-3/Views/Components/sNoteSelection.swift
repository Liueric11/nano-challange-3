//import SwiftData
//import SwiftUI
//
//struct NoteSelection: View {
//    @State var bin : Set<UUID> = []
//    
//    var body: some View {
//        List ( selection: $bin ) {
//            Section ( isExpanded: $exp ) {
//                ForEach ( associatedFolder.contains ) { note in
//                    NavigationLink { 
//                        if ( associatedFolder.contains.count >= 1 ) {
//                            NoteView (
//                                note: $associatedFolder.contains.first!
//                            )
//                        }
//                    } label: { 
//                        Text(note.filename)
//                    }
//
//                }
//            } header: {
//                HStack {
//                    VStack ( alignment: .leading ) {
//                        Text("ls.list-header.title.icloud")
//                            .font(.headline)
//                        Text("ls.list-header.body.icloud")
//                            .font(.caption)
//                    }
//                    Spacer()
//                    Button {
//                        exp.toggle()
//                    } label: {
//                        withAnimation {
//                            Image(systemName: "chevron.right.circle")
//                                .rotationEffect(exp == false ? .zero : .degrees(90))
//                        }
//                    }
//                }
//            }
//                .textCase(nil)
//        }
//        .toolbar {
//            ToolbarItemGroup(placement: .bottomBar) {
//                HStack {
//                    Spacer()
//                    NewNoteButton
//                }
//            }
//        }
//    }
//    
//    @Environment(\.modelContext) private var modelContext
//    @Binding var associatedFolder : Folder
////    var notes : [Note] {
////        associatedFolder.contains
////    }
//    @State var exp : Bool = true
//}
//
//extension NoteSelection {
//    var NewNoteButton : some View {
//        Button {
//            let cn = Note (
//                content: [
//                    NoteParagraph (
//                        "Hai", 
//                        styled: NoteBlockStyle (
//                            NoteBlockPreset.body
//                        )
//                    )
//                ], 
//                filename: "Hello world", 
//                createdAt: .now, 
//                isPinned: false, 
//                attempts: []
//            )
//            modelContext.insert(
//                cn
//            )
//            associatedFolder.contains.append(cn)
//            
//        } label: {
//            Image(systemName: "square.and.pencil")
//        }
//    }
//    
//}
//
//#Preview {
//    NoteSelection(associatedFolder: .init("Kodok", contains: []))
//}
