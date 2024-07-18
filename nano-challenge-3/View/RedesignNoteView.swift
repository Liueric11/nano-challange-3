//
//  RedesignNoteView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 17/07/24.
//

import SwiftUI

extension UserDefaults {
    var streakCount: Int {
        get {
            return integer(forKey: "streakCount")
        }
        set {
            set(newValue, forKey: "streakCount")
        }
    }
    
    func incrementStreak() {
        let today = Calendar.current.startOfDay(for: Date())
        let lastDate = Calendar.current.startOfDay(for: Date(timeIntervalSinceReferenceDate: TimeInterval(integer(forKey: "lastSavedDate"))))
        
        if today > lastDate {
            streakCount += 1
            set(today.timeIntervalSinceReferenceDate, forKey: "lastSavedDate")
        }
    }
}

struct RedesignNoteView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var timer: Timer?
    @State private var secondsElapsed: Int = 0
    @State private var isTimerRunning: Bool = false
    @State private var title: String = ""
    @State private var text: String = ""
    @State private var selectedOption: FileType? = nil
    @State private var navigateToShareView = false
    private var fileModel: FileModel?
    
    init(title: String = "", text: String = "", selectedOption: FileType? = nil, fileModel: FileModel? = nil) {
        _title = State(initialValue: title)
        _text = State(initialValue: text)
        _selectedOption = State(initialValue: selectedOption)
        self.fileModel = fileModel
    }
    
    func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
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
        VStack {
            HStack {
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
                .background(Color(UIColor.secondarySystemGroupedBackground))
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
            ToolbarItem(placement: .topBarTrailing) {
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
                destination: ShareView(secondsElapsed: secondsElapsed, title: title, text: text),
                isActive: $navigateToShareView,
                label: {
                    EmptyView()
                })
        )
        .toolbarTitleDisplayMode(.inline)
    }
    
    func submit() {
        if let fileModel = fileModel {
            fileModel.content = text
            fileModel.title = title
            fileModel.type = selectedOption ?? FileType.book
        } else {
            let newFile = FileModel(title: title, type: selectedOption ?? FileType.book, content: text)
            modelContext.insert(newFile)
        }
        let newRecord = RecordModel(seconds: secondsElapsed, date: Date())
        modelContext.insert(newRecord)
    
        do {
            try modelContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
        
        UserDefaults.standard.incrementStreak()
        
        stopTimer()
        
        navigateToShareView = true
    }
}

#Preview {
    NavigationStack{
        RedesignNoteView()
    }
}
