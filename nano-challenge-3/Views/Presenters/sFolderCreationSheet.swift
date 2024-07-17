import SwiftUI

struct FolderCreationSheet : View {
    @Binding var isShown     : Bool
    @State var newFolderName : String = ""
    @State var folderCollectionReference : [Folder]
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("ls.list-header.title.new-folder") {
                    TextField(text: $newFolderName) {
                        Text("ls.list-header.title.new-folder")
                    }
                }
            }
                .navigationTitle("ls.navigation-title.sheet.new-folder")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("ls.cta.cancel") {
                            self.isShown = false
                        }
                    }                    
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("ls.cta.done") {
                            addItem()
                            self.isShown = false
                        }
                    }
                }
        }
    }
    
    private func addItem () {
        withAnimation {
            let newFolder = Folder(newFolderName, contains: [])
            modelContext.insert(newFolder)
            folderCollectionReference.append(newFolder)
        }
    }
    
    @Environment(\.modelContext) private var modelContext
}
