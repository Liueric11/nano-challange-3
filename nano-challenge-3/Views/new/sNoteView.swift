import SwiftUI

struct NoteView: View {
    @Bindable var displays  : Note
    @State var accessRecord : NoteAccessRecord? = NoteAccessRecord()
    @State var clock        = Clock()
    
    var body: some View {
        List {
            VStack ( alignment: .leading ) {
                Text("Reading time")
                    .font(.caption)
                Text(String(clock.elapsedSeconds))
                    .font(.headline)
                    .tint(.indigo)
            }
            CollectionOfNoteBlocks(from: displays)
            Button {
                displays.paragraphs.append (
                    .init("...", styled: .init(.body))
                )
                displays.attempts.forEach { at in
                    print(at.duration)
                }
            } label: {
                Label("ls.button.add-note-paragraph", systemImage: "plus")
            }
        }
            .padding(.top, UIConfig.Paddings.huge)
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.clock.begin()
            }
            .onDisappear() {
                self.clock.stop()
                self.accessRecord?.closedAt = .now
                displays.attempts.append(accessRecord ?? NoteAccessRecord())
                self.clock = Clock()
            }
            .toolbar {
                ToolbarItemGroup (placement: .topBarTrailing) {
                    EditButton()
                }
            }
    }
    
}
