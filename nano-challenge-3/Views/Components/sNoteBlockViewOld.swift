//import SwiftUI
//
///// A composite SwiftUI view which displays both a paragraph's content, and its block-specific menu.
//struct NoteBlockView : View {
//    @Binding var associatedNote : Note
//    var paragraphUUID  : UUID
//    
////    @State var focusedParagraph : NoteParagraph
//    @Environment(\.modelContext) private var modelContext
//    
////    init ( associatedNote: Note, paragraphUUID: UUID ) {
////        self.associatedNote = associatedNote
////        self.paragraphUUID  = paragraphUUID
////        
//////        self.focusedParagraph = associatedNote.paragraphs.first { par in par.id == paragraphUUID }!
////    }
//    
//    var body: some View {
//        HStack {
//            NoteBlockContent( content: $associatedNote.paragraphs.first { par in par.id == paragraphUUID }! )
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//            Menu {
//                ChangeStyleMenu()
//            } label: {
//                Image(systemName: "ellipsis")
//                    .rotationEffect(.degrees(90))
//                    .padding()
//            }
//        }
//    }
//}
//
//extension NoteBlockView {
//    
//    func ChangeStyleMenu () -> some View {
//        Menu {
//            ForEach ( NoteBlockPreset.allCases, id: \.self ) { preset in
//                Button {
//                    print("attempting to change the paragraph's style to \(preset.rawValue)")
//                    associatedNote.paragraphs.first { par in par.id == paragraphUUID }!.style.preset = preset
//                    print("reading from updated preset: \(associatedNote.paragraphs.first { par in par.id == paragraphUUID }!.style.preset.rawValue)")
//                    associatedNote.paragraphs.first { np in
//                        np.id == associatedNote.paragraphs.first { par in par.id == paragraphUUID }!.id
//                    }!.style.preset = preset
//                    print(
//                    """
//                    reading from bound data: \(associatedNote.paragraphs.first { np in
//                        np.id == associatedNote.paragraphs.first { par in par.id == paragraphUUID }!.id
//                    }!.style.preset.rawValue)
//                    """)
//                    try? modelContext.save()
//                } label: {
//                    Text(preset.rawValue)
//                }
//            }
//        } label: {
//            Text("Change block style")
//        }
//    }
//    
//}
