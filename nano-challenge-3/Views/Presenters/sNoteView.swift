import SwiftUI

struct NoteView: View {
    @Bindable    var displays     : Note
    @State       var accessRecord : NoteAccessRecord?
    @State       var clock        = Clock()
    @FocusState  var focus        : Bool
    @State       var managedReviewButtonLogic : () -> Void = {}
    @State       var readingTypePool  : [String] = ["Book", "Article", "Journal", "News", "Others"]
    @State       var readingType  : String = "Book"
    
    var body: some View {
        List {
            HStack {
                VStack ( alignment: .leading ) {
                    Text("ls.list-content.reading-duration")
                        .font(.callout)
                        .italic()
                    Text(String(clock.elapsedSeconds))
                        .font(.headline)
                        .bold()
                        .foregroundStyle(.indigo)
                }
                Spacer()
                Picker("", selection: $readingType) {
                    Label(readingTypePool[0], systemImage: "book").tag(readingTypePool[0])
                    Label(readingTypePool[1], systemImage: "chart.bar.doc.horizontal").tag(readingTypePool[1])
                    Label(readingTypePool[2], systemImage: "book.pages").tag(readingTypePool[2])
                    Label(readingTypePool[3], systemImage: "newspaper").tag(readingTypePool[3])
                    Label(readingTypePool[4], systemImage: "note.text").tag(readingTypePool[4])
                }
            }
                .padding()
                .background(Color("CardBackground"))
                .clipShape(RoundedRectangle(cornerRadius: UIConfig.CornerRadiuses.normal))
                .listRowSeparator(.hidden)
            CollectionOfNoteBlocks(from: displays)
                .focused($focus)
            NewParagraphButton()
                .listRowSeparator(.hidden)
        }
            .padding(.top, UIConfig.Paddings.huge)
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.accessRecord = NoteAccessRecord()
                self.clock.begin()
            }
            .onDisappear {
                self.clock.stop()
                self.accessRecord?.closedAt = .now
                displays.attempts.append(accessRecord ?? NoteAccessRecord(openedAt: .now.advanced(by: -TimeInterval(clock.elapsedSeconds)), closedAt: .now))
                self.accessRecord = nil
                self.clock = Clock()
            }
            .toolbar {
                ToolbarItemGroup (placement: .topBarTrailing) {
                    if ( focus == true ) {
                        Button {
                            focus = false
                        } label: {
                            Text("ls.cta.done")
                        }
                    } else {
                        EditButton()
                    }
                }
            }
    }
    
    func NewParagraphButton () -> some View {
        Button {
            displays.paragraphs.append (
                .init("...", styled: .init(.body))
            )
        } label: {
            Label("ls.button.add-note-paragraph", systemImage: "plus")
        }
    }
    
}
