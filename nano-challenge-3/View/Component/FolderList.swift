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
                ForEach(viewModel.folders, id: \.name) { folder in
                    HStack {
                        Image(systemName: folder.icon)
                            .foregroundColor(.indigo)
                        Text(folder.name)
                            .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                            .font(.system(size: 17))
                        Text("\(folder.count)")
                            .frame(width: 45, height: 16, alignment: .trailing)
                            .font(.system(size: 17))
                            .foregroundColor(.secondary)

                        Button(action: {

                        }) {
                            Image(systemName: "chevron.right")
                                .font(
                                    Font.custom("SF Pro", size: 17)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Color(UIColor.tertiaryLabel))
                        }
                    }
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
