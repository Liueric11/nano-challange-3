import SwiftUI

/// Act as an intermediary view to be presented, when the ordered Note object hasn't yet been registered within the DataStore.
struct NoteCreationView: View {
    @State     var note           : Note
    @Bindable  var folderReferer  : Folder
    @State     var showReviewPage : Bool
    @Binding   var returnTo       : Bool
    
    init ( referer: Bindable<Folder>, returnTo: Binding<Bool> ) {
        let note = Note()
        self.note = note
        self._folderReferer = referer
        self._returnTo = returnTo
        self.showReviewPage = false
        self.editView = NoteView(displays: note)
    }
    
    var body : some View {
        editView
            .onAppear {
                editView.managedReviewButtonLogic = {  
                   modelContext.insert(note)
                   folderReferer.contains.append(note)
                   showReviewPage.toggle()
               }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        modelContext.insert(note)
                        folderReferer.contains.append(note)
                        showReviewPage.toggle()
                    } label: {
                        Text("ls.cta.review")
                            .navigationDestination(isPresented: $showReviewPage) {
                                NoteReviewView(note: $note, returnTo: $returnTo, visible: $showReviewPage, elapsedReadingSeconds: .seconds(editView.clock.elapsedSeconds))
                            }
                    }
                }
            }
    }
    
    @State private var editView : NoteView
    
    @Environment(\.modelContext) private var modelContext
}
