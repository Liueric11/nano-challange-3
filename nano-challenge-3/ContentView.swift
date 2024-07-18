import SwiftUI
import SwiftData

struct ContentView: View {
    @State var newFolderCreationSheet : Bool = false
    @Query private var folders        : [Folder]
    
    var body : some View {
        NavigationStack {
            List {
                ForEach ( folders ) { folder in
                    @Bindable var folder = folder
                    NavigationLink {
                        FolderView (
                            displays: _folder
                        )
                    } label: {
                        Text(folder.name)
                            .swipeActions {
                                Button("ls.cta.delete", systemImage: "trash", role: .destructive) {
                                    modelContext.delete(folder)
                                }
                            }
                    }
                }
                
                NavigationLink {
                    ReadingHabitConfigScreen(readingHabitConfig: Binding(get: { 
                        rhcvm.readingHabitConfigurations
                    }, set: { newValue in
                        rhcvm.readingHabitConfigurations = newValue
                    }))
                } label: {
                    Label("ls.card-header.title.reading-habit", systemImage: "repeat")
                }
            }
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        HStack {
                            NewFolderButton
                            Spacer()
                        }
                    }
                }
                .navigationTitle("ls.navigation-title.folders")
        }
            .sheet( isPresented: $newFolderCreationSheet ) {
                FolderCreationSheet(isShown: $newFolderCreationSheet, folderCollectionReference: folders)
            }
            .tint(.indigo)
    }

    @State private var rhcvm : ReadingHabitConfigViewModel = ReadingHabitConfigViewModel()
    @Environment(\.modelContext) private var modelContext
}

extension ContentView {
    
    var NewFolderButton : some View {
        Button {
            self.newFolderCreationSheet = true
        } label: {
            Image(systemName: "folder.badge.plus")
        }
    }
    
}
