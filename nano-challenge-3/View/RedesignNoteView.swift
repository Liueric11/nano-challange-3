//
//  RedesignNoteView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 17/07/24.
//

import SwiftUI

struct RedesignNoteView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var timer: Timer?
    @State private var secondsElapsed: Int = 0
    @State private var isTimerRunning: Bool = false
    @State private var title: String = ""
    @State private var text: String = ""
    @State private var selectedOption: FileType? = nil
    @State private var navigateToAnotherPage = false
    
    func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            secondsElapsed += 1
        }
    }

    func stopTimer() {
        isTimerRunning = false
        timer?.invalidate()
        timer = nil
    }

    func timeString(_ seconds: Int) -> String {
        let minutes = (seconds / 60) % 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading) {
                    Text("Reading Time")
                        .font(.callout)
                        .fontWeight(.regular)
                        .foregroundColor(.secondary)
                    
                    Text("\(timeString(secondsElapsed))")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.indigo)
                }
                .padding(0)
                Spacer()
                
                Picker("Reading Type", selection: $selectedOption) {
                    Text("Type of reading").tag(FileType?.none)
                    ForEach(FileType.allCases) { option in
                        Text(option.rawValue)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.indigo)
                            .tag(Optional(option))
                    }
                }
                .pickerStyle(.menu)
                .padding(0)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 16)
            
            UITextViewRepresentable(title: $title, text: $text)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, 16)
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
        .background(Color(.systemGroupedBackground))
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button(action: {
                    submit()
                }) {
                    Text("Save")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.indigo)
                }
            }
        }
        .background(
            NavigationLink(
                destination: ReadingGoalView(),
                isActive: $navigateToAnotherPage,
                label: {
                    EmptyView()
                })
        )
        .toolbarTitleDisplayMode(.inline)
    }
    
    func submit() {
        let newFile = FileModel(title: title, type: selectedOption ?? FileType.book, content: text)
        let newRecord = RecordModel(minutes: secondsElapsed)
        modelContext.insert(newFile)
        modelContext.insert(newRecord)
        navigateToAnotherPage = true
    }
}

#Preview {
    NavigationStack{
        RedesignNoteView()
    }
}
