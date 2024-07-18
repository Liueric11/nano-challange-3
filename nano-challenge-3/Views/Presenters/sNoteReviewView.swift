import SwiftUI

struct NoteReviewView : View {
    @Binding var note     : Note
    @Binding var returnTo : Bool
    @Binding var visible  : Bool
    var elapsedReadingSeconds : Duration
    
    var body: some View {
        List {
            Section {
                VStack ( alignment: .leading ) {
                    Text("ls.list-content.reading-duration")
                        .padding(.bottom, UIConfig.Spacings.normal)
                    Text (
                        elapsedReadingSeconds.formatted(.time(pattern: .hourMinuteSecond))
                    )
                        .font(.title)
                        .italic()
                        .bold()
                        .foregroundStyle(.indigo)
                }
            }
            Section ("ls.list-header.note-content-for-review") {
                VStack ( alignment: .leading ) {
                    ForEach ( 0..<min(note.paragraphs.count, 3) ) { index in
                        HStack {
                            Text(note.paragraphs[index].content + "\n")
                            Spacer()
                        }
                    }
                }
            }
        }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        visible = false
                        returnTo = false
                    } label: {
                        Text("ls.cta.done")
                    }
                }
            }
            .navigationTitle("ls.navigation-title.note-review")
    }
}
