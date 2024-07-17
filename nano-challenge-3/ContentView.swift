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
                                Button("Delete", systemImage: "trash", role: .destructive) {
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
            .tint(.orange)
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

struct ReadingHabitConfigScreen : View {
    @Binding var readingHabitConfig : ReadingHabit
    
    var body : some View {
        List {
            DatePicker(selection: $readingHabitConfig.date, displayedComponents: [.hourAndMinute]) {
                Label("Duration", systemImage: "stopwatch")
                    .pickerStyle(.wheel)
            }
            Toggle(isOn: $readingHabitConfig.alarmIsArmed) {
                Label("Reminder", systemImage: "bell")
            }
        }
    }
}

class ReadingHabitConfigViewModel {
    
   var readingHabitConfigurations : ReadingHabit {
        get {
            var existingObject : ReadingHabit? = try? JSONDecoder().decode(
                ReadingHabit.self, 
                from: userDefaults.data(forKey: UserDefaultsNaming.readingHabitObject) ?? Data()
            ) as ReadingHabit
            if ( existingObject == nil ) {
                existingObject = ReadingHabit()
                userDefaults.set(try? JSONEncoder().encode(existingObject), forKey: UserDefaultsNaming.readingHabitObject)
                userDefaults.synchronize()
            }
            return existingObject!
        }
       set {
           print("new config was set: \(newValue)")
           userDefaults.set(try? JSONEncoder().encode(newValue), forKey: UserDefaultsNaming.readingHabitObject)
           userDefaults.synchronize()
       }
    }
    let userDefaults = UserDefaults.standard
        
}
