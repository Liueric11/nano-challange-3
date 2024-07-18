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
                    NavigationLink(destination: RedesignNoteView(title: file.title, text: file.content, selectedOption: file.type, fileModel: file)) {
                        HStack {
                            Image(systemName: "book")
                                .foregroundColor(.indigo)
                            
                            Text(file.title)
                                .font(.body)
                                .fontWeight(.regular)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                        .swipeActions {
                            Button("Delete", systemImage: "trash", role: .destructive) {
                                modelContext.delete(file)
                            }
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
                                .foregroundColor(.indigo)
                        }
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NavigationLink(destination: ChartView()) {
                        Image(systemName: "chart.bar")
                            .foregroundColor(.indigo)
                    }
                    
                    Button {
                        submit()
                    } label: {
                        Text("test")
                    }
                }
            }
            .searchable(text: .constant(""))
    }
    
    func submit() {
        let newFile1 = FileModel(
            title: "Atomic Habit",
            type: FileType.book,
            content: "Jika diumpamakan sekeping koin tidak bisa menjadikan kaya, suatu perubahan positif seperti meditasi selama satu menit. When you fall in love with the process rather than the product, you don’t have to wait to give yourself permission to be happy. You can be satisfied anytime your system is running. And a system can be successful in many different forms, not just the one you first envision. (James Clear) Pada umumnya, perubahan-perubahan kecil seringkali terkesan tak bermakna karena tidak langsung membawa perubahan nyata pada hidup suatu manusia.")
        modelContext.insert(newFile1)
        
        let newFile2 = FileModel(
            title: "Chicken Soup for the Soul",
            type: FileType.book,
            content: "Chapter 1 : Love: The One Creative Force This story highlights the significance of loving your family, children, spouse, and neighbors. Always ensure that anyone who enters your life leaves feeling better and happier. Love is a potent force in the world, and we should endeavor to embrace and share it. Spread love wherever you go, but first in your own home.” (Mother Teresa) There was a college professor who taught Sociology to boys from 200 different settlements. At the beginning, he asked each student about their future prospects, and most felt they had limited opportunities. However, 25 years later, another Sociology professor conducted research on these students. Out of the 180 remaining students (20 had either passed away or left), an impressive 176 had found success in fields such as medicine, engineering, and law. This remarkable outcome intrigued other professors, who wanted to understand the secret behind it. When they asked the professor who had taught these students, her response was simple: “I loved those boys.” This story demonstrates the power of love. Approaching your work and interactions with love can lead to great success.")
        modelContext.insert(newFile2)
        
        let newFile3 = FileModel(
            title: "Orang Pemarah Lebih Cepat Meninggal, Mitos atau Fakta?",
            type: FileType.article,
            content: "Menjaga pikiran agar tetap tenang ketika emosi memuncak tidaklah mudah. Namun, penelitian yang diungkap oleh Dailymail menunjukkan bahwa kemarahan terkait dengan usia yang lebih pendek. Hal ini mungkin bisa membantu untuk lebih fokus untuk menahan diri agar tidak marah. Penelitian dari Iowa State University menemukan bahwa pria yang sering marah antara usia 20 hingga 40 tahun memiliki risiko lebih tinggi meninggal pada usia 35 tahun. Amarah juga dapat menyebabkan kurang tidur, sakit kepala, kerusakan sistem pernapasan, dan depresi. Amarah meningkatkan respons di amigdala, yang memicu kecemasan dan mengurangi relaksasi. Pelepasan hormon stres selama marah juga dapat merusak DNA dan neuron di otak, mengurangi fungsi sistem pernapasan, dan menurunkan kadar serotonin.")
        modelContext.insert(newFile3)
        
        // Example current date
        let currentDate = Date()
        
        let newRecord1 = RecordModel(seconds: 1000, date: Date())
        modelContext.insert(newRecord1)
        let newRecord2 = RecordModel(seconds: 2000, date: Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? currentDate)
        modelContext.insert(newRecord2)
        let newRecord3 = RecordModel(seconds: 3500, date: Calendar.current.date(byAdding: .day, value: -2, to: currentDate) ?? currentDate)
        modelContext.insert(newRecord3)
        let newRecord4 = RecordModel(seconds: 1500, date: Calendar.current.date(byAdding: .day, value: -3, to: currentDate) ?? currentDate)
        modelContext.insert(newRecord4)
        let newRecord5 = RecordModel(seconds: 2000, date: Calendar.current.date(byAdding: .day, value: -4, to: currentDate) ?? currentDate)
        modelContext.insert(newRecord5)
        let newRecord6 = RecordModel(seconds: 1800, date: Calendar.current.date(byAdding: .day, value: -5, to: currentDate) ?? currentDate)
        modelContext.insert(newRecord6)
        let newRecord7 = RecordModel(seconds: 2300, date: Calendar.current.date(byAdding: .day, value: -6, to: currentDate) ?? currentDate)
        modelContext.insert(newRecord7)
        let newRecord8 = RecordModel(seconds: 1400, date: Calendar.current.date(byAdding: .day, value: -7, to: currentDate) ?? currentDate)
        modelContext.insert(newRecord8)
        let newRecord9 = RecordModel(seconds: 1000, date: Calendar.current.date(byAdding: .day, value: -8, to: currentDate) ?? currentDate)
        modelContext.insert(newRecord9)
    }
}

#Preview {
    NavigationStack {
        FilesView()
    }
}
