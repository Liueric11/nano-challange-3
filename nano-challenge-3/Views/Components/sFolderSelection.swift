//import SwiftUI
//import SwiftData
//
//struct FolderSelection : View {
//    @State var exp : Bool = true
//    @State var bin : Set<UUID> = []
//    
//    @Binding var folders : [Folder]
//    
//    var body: some View {
//        List {
//            Section ( isExpanded: $exp ) {
//                ForEach ( folders, id: \.self ) { folder in
//                    @Bindable var folder = folder
//                    
//                    NavigationLink { 
//                        NoteSelection(associatedFolder: folder)
//                            .navigationTitle(folder.name)
//                    } label: { 
//                        Text(folder.name)
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
//    }
//    @Environment(\.modelContext) private var modelContext
//}
