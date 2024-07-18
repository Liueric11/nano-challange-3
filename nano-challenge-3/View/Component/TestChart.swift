//
//  TestChart.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 16/07/24.
//

import SwiftUI
import Charts
import SwiftData

struct AggregatedRecord: Identifiable {
    var id = UUID()
    var day: Date
    var seconds: Int
}

extension Array where Element == RecordModel {
    var aggregatedData: [AggregatedRecord] {
        var dailyRecords: [Date: Int] = [:]
        
        let calendar = Calendar.current
        
        for record in self {
            let day = calendar.startOfDay(for: record.date)
            dailyRecords[day, default: 0] += record.seconds
        }
        
        return dailyRecords.sorted { $0.key < $1.key }.map { (day, seconds) in
            AggregatedRecord(day: day, seconds: seconds)
        }
    }
}

struct TestChart: View {
    @State private var timeRange: TimeRange = .last7Days
    @Environment(\.modelContext) private var modelContext
    @Query private var recordModel: [RecordModel]
    
    @State private var scrollPosition: Date = Date()
    
    func secondsInPeriod(in range: ClosedRange<Date>) -> Int {
        recordModel.aggregatedData.filter { range.contains($0.day) }.reduce(0) { $0 + $1.seconds }
    }
    
    var visibleRange: ClosedRange<Date> {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: scrollPosition)
        let endDate = calendar.date(byAdding: .day, value: 7, to: startDate)!
        return startDate...endDate
    }
    
    var visibleRangeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return "\(formatter.string(from: visibleRange.lowerBound)) – \(formatter.string(from: visibleRange.upperBound))"
    }
    
    var visibleRangeMonth: ClosedRange<Date> {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: scrollPosition)
        let endDate = calendar.date(byAdding: .day, value: 30, to: startDate)!
        return startDate...endDate
    }
    
    var visibleRangeStringMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return "\(formatter.string(from: visibleRangeMonth.lowerBound)) – \(formatter.string(from: visibleRangeMonth.upperBound))"
    }
    
    static let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           formatter.timeStyle = .none
           return formatter
    }()

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                TimeRangePicker(value: $timeRange)
                    .padding(.bottom)
                
                switch timeRange {
                case .last7Days:
                    Text("Average")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    
                    Text("\(secondsInPeriod(in: visibleRange) / 60 / 7) minutes")
                        .font(.title2.bold())
                        .foregroundColor(.primary)

                    Text(visibleRangeString)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    
                    Chart {
                        ForEach(recordModel.aggregatedData) { record in
                            BarMark(
                                x: .value("Day", record.day, unit: .day),
                                y: .value("Seconds", record.seconds / 60 / 7)
                            )
                        }
                        .foregroundStyle(.blue)
                    }
                    .chartScrollableAxes(.horizontal)
                    .chartScrollTargetBehavior(
                        .valueAligned(
                            matching: .init(hour: 0),
                            majorAlignment: .matching(.init(day: 1))))
                    .chartScrollPosition(x: $scrollPosition)
                    .chartXVisibleDomain(length: 3600 * 24 * 7)
                    .chartXAxis {
                        AxisMarks(values: .stride(by: .day, count: 1)) {
                            AxisTick()
                            AxisGridLine()
                            AxisValueLabel(format: .dateTime.month().day())
                        }
                    }
                    .frame(height: 240)
                    .padding()
                    
                case .last1Month:
                    Text("Average")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    
                    Text("\(secondsInPeriod(in: visibleRangeMonth) / 60 / 30) minutes")
                        .font(.title2.bold())
                        .foregroundColor(.primary)

                    Text(visibleRangeStringMonth)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    
                    Chart {
                        ForEach(recordModel.aggregatedData) { record in
                            BarMark(
                                x: .value("Day", record.day, unit: .day),
                                y: .value("Minutes", record.seconds / 60 / 30)
                            )
                        }
                        .foregroundStyle(.blue)
                    }
                    .chartScrollableAxes(.horizontal)
                    .chartScrollTargetBehavior(
                        .valueAligned(
                            matching: .init(hour: 0),
                            majorAlignment: .matching(.init(day: 1))))
                    .chartScrollPosition(x: $scrollPosition)
                    .chartXVisibleDomain(length: 3600 * 24 * 30)
                    .chartXAxis {
                        AxisMarks(values: .stride(by: .day, count: 7)) {
                            AxisTick()
                            AxisGridLine()
                            AxisValueLabel(format: .dateTime.month().day())
                        }
                    }
                    .frame(height: 240)
                    .padding()
                    
                case .last1Day:
                    Text("Total")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    
                    Text("\(secondsInPeriod(in: visibleRange) / 60) minutes")
                        .font(.title2.bold())
                        .foregroundColor(.primary)

                    Text(Self.dateFormatter.string(from: Date()))
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    
                    Chart {
                        ForEach(recordModel.aggregatedData) { record in
                            BarMark(
                                x: .value("Day", record.day, unit: .day),
                                y: .value("Seconds", record.seconds / 60)
                            )
                        }
                        .foregroundStyle(.blue)
                    }
                    .chartScrollableAxes(.horizontal)
                    .chartScrollTargetBehavior(
                        .valueAligned(
                            matching: .init(hour: 0),
                            majorAlignment: .matching(.init(day: 1))))
                    .chartScrollPosition(x: $scrollPosition)
                    .chartXVisibleDomain(length: 3600 * 24)
                    .chartXAxis {
                        AxisMarks(values: .stride(by: .day, count: 1)) {
                            AxisTick()
                            AxisGridLine()
                            AxisValueLabel(format: .dateTime.month().day())
                        }
                    }
                    .frame(height: 240)
                    .padding()
                }
            }
            .listRowSeparator(.hidden)
            .transaction {
                $0.animation = nil
            }
        }
    }
}

#Preview {
    TestChart()
}
