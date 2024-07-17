//
//  FilesView.swift
//  nano-challenge-3
//
//  Created by Eric Fernando on 17/07/24.
//

import SwiftUI
import SwiftData

struct FilesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var files: [FileModel]
    
    var body: some View {
            List {
                ForEach(files) { file in
                    NavigationLink(destination: ReadingGoalView(isGoalModalPresented: .constant(false))) {
                        HStack {
                            Image(systemName: "book")
                                .foregroundColor(.indigo)
                            
                            Text(file.title)
                                .font(.body)
                                .fontWeight(.regular)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Reading Habit")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        NavigationLink(destination: RedesignNoteView()) {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundColor(.indigo)
                        }
                    }
                }
            }
            .searchable(text: .constant(""))
    }
}

#Preview {
    NavigationStack {
        FilesView()
    }
}
