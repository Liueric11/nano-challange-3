//
//  OverviewChartView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI
import Charts

//TODO: change to swift data

struct ReadingData: Identifiable {
    let id = UUID()
    let day: Date
    let minute: Int
}


func generateDummySalesData() -> [ReadingData] {
    var dummyData = [ReadingData]()
    let calendar = Calendar.current
    let startDate = calendar.date(byAdding: .day, value: -7, to: Date())!

    for i in 0..<7 {
        let date = calendar.date(byAdding: .day, value: i, to: startDate)!
        let minute = Int.random(in: 50...200)
        dummyData.append(ReadingData(day: date, minute: minute))
    }

    return dummyData
}



struct OverviewChartView: View {
    let data = generateDummySalesData()
    var body: some View {
        Chart(data, id: \.day) {
            BarMark(
                x: .value("Date", $0.day),
                y: .value("Minute", $0.minute),
                width: 12
            )
            .accessibilityLabel($0.day.formatted(date: .complete, time: .omitted))
            .accessibilityValue("\($0.minute) sold")
            .accessibilityHidden(true)
            .foregroundStyle($0.id == data.last?.id ? Color.indigo : Color.gray)
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .frame(width: 96, height: 40)
    }
}

#Preview {
    OverviewChartView()
}
