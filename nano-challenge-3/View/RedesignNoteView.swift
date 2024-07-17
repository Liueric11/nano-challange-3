//
//  RedesignNoteView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 17/07/24.
//

import SwiftUI

struct RedesignNoteView: View {
    @State private var selectedOption = ""
    let options = ["Book", "Article", "Journal", "News", "Others"]
    @State private var text: String = ""
    
    @State var clock = Clock()
    
    var body: some View {
        VStack {
            HStack (spacing: 100){
                VStack(alignment: .leading) {
                    Text("Reading Time")
                        .font(.system(size: 16))
                    Text(String(clock.elapsedSeconds))
                        .tint(.indigo)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    
                } .frame(width: 130)
                
                VStack {
                    Picker("", selection: $selectedOption) {
                        ForEach(options, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    .frame(width: 200)
                }
            }
            .padding(.leading, 50)
            
            VStack {
                TextEditor(text: $text)
                    .frame(width: 350)
            }
        }
        .background(Color(.systemGroupedBackground))
    }
}

//struct TimerView: View {
//    @State var isTimerRunning = false
//    @State private var startTime =  Date()
//    @State private var timerString = "0.00"
//    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    var body: some View {
//
//        Text(self.timerString)
//            .font(Font.system(.largeTitle, design: .monospaced))
//            .onReceive(timer) { _ in
//                if self.isTimerRunning {
//                    timerString = String(format: "%.f", (Date().timeIntervalSince( self.startTime)))
//                }
//            }
//            .onTapGesture {
//                if isTimerRunning {
//                    self.stopTimer()
//                } else {
//                    timerString = "0.00"
//                    startTime = Date()
//                    self.startTimer()
//                }
//                isTimerRunning.toggle()
//            }
//            .onAppear() {
//                self.stopTimer()
//            }
//    }
//    
//    func stopTimer() {
//        self.timer.upstream.connect().cancel()
//    }
//    
//    func startTimer() {
//        self.timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
//    }
//}

#Preview {
    RedesignNoteView()
}
