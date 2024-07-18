import SwiftUI

struct FolderView : View {
    @Bindable var target : Folder

    init ( displays target: Bindable<Folder> ) {
        self._target      = target
    }
    
    var body : some View {
        List {
            ForEach ( target.contains ) { note in
                NavigationLink {
                    NoteView (
                        displays: note
                    )
                } label: {
                    Text(note.filename)
                }
            }
                .onDelete(perform: { indexSet in
                    target.contains.remove(atOffsets: indexSet)
                })
        }
            .navigationTitle(target.name)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        // TODO: - Go to statistics view
                    } label: {
                        Image(systemName: "chart.bar.xaxis")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        NewNoteButton
                    }
                }
            }
    }
    
    @Environment(\.modelContext) private var modelContext
    @State var readyToMoveAfterNoteCreation : Bool = false
}

extension FolderView {
    var NewNoteButton : some View {
        return Button {
            readyToMoveAfterNoteCreation.toggle()
        } label: {
            Image(systemName: "square.and.pencil")
                .navigationDestination ( isPresented: $readyToMoveAfterNoteCreation ) {
                    NoteCreationView(referer: $target, returnTo: $readyToMoveAfterNoteCreation)
                }
        }
    }
    
    func noteCreationLogic () -> Note {
        let cn = Note()
        modelContext.insert(
            cn
        )
        target.contains.append(cn)
        return cn
    }
    
}
