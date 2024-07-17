//
//  FolderList.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI

struct FolderList: View {
    @ObservedObject var viewModel = HabitViewModel()
    
    var body: some View {
        List {
            Section(header:
                        Text("iCloud")
                .padding(.leading, -16)
            ) {
                HStack {
                    Image(systemName: "folder")
                        .foregroundColor(.indigo)
                    Text("All iCloud")
                        .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                        .font(.system(size: 17))
                    Text("26")
                        .frame(width: 45, height: 16, alignment: .trailing)
                        .font(.system(size: 17))
                        .foregroundColor(.secondary)
                    Image(systemName: "chevron.right")
                        .font(
                            Font.custom("SF Pro", size: 17)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color(UIColor.tertiaryLabel))
                }
                
                HStack {
                    Image(systemName: "note.text")
                        .foregroundColor(.indigo)
                    Text("Notes")
                        .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                        .font(.system(size: 17))
                    Text("22")
                        .frame(width: 45, height: 16, alignment: .trailing)
                        .font(.system(size: 17))
                        .foregroundColor(.secondary)
                    Image(systemName: "chevron.right")
                        .font(
                            Font.custom("SF Pro", size: 17)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color(UIColor.tertiaryLabel))
                    
                }
                
                HStack {
                    Image(systemName: "trash")
                        .foregroundColor(.indigo)
                    Text("Recently Deleted")
                        .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                        .font(.system(size: 17))
                    Text("9")
                        .frame(width: 45, height: 16, alignment: .trailing)
                        .font(.system(size: 17))
                        .foregroundColor(.secondary)
                    Image(systemName: "chevron.right")
                        .font(
                            Font.custom("SF Pro", size: 17)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color(UIColor.tertiaryLabel))
                }
            }
            .headerProminence(.increased)
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    FolderList()
}
