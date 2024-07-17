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
    let id = UUID()
    var day: Date
    var minutes: TimeInterval
}

struct TestChart: View {
    @State private var timeRange: TimeRange = .last7Days
    @Environment(\.modelContext) private var modelContext
    @Query private var notes: [Note]
    
    private var aggregatedData: [AggregatedRecord] {
        var dailyRecords: [Date: TimeInterval] = [:]
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        for i in 0..<150 {
            let date = calendar.date(byAdding: .day, value: -i, to: today)!
            dailyRecords[date] = 0
        }
        
        for note in notes {
            for record in note.attempts {
                let day = calendar.startOfDay(for: record.closedAt!)
                let durationInMinutes = record.closedAt!.timeIntervalSince(record.openedAt) / 60
                dailyRecords[day, default: 0] += durationInMinutes
            }
        }
        
        return dailyRecords.sorted { $0.key < $1.key }.map { (day, minutes) in
            AggregatedRecord(day: day, minutes: minutes)
        }
    }
    
    @State private var scrollPosition: Date = Date()
    
    func minutesInPeriod(in range: ClosedRange<Date>) -> Int {
        aggregatedData.filter { range.contains($0.day) }.reduce(0) { $0 + Int($1.minutes) }
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
                        
                        Text("\(minutesInPeriod(in: visibleRange) / 7)")
                            .font(.title2.bold())
                            .foregroundColor(.primary)

                        Text(visibleRangeString)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Chart {
                            ForEach(aggregatedData) { record in
                                BarMark(
                                    x: .value("Day", record.day, unit: .day),
                                    y: .value("Minutes", record.minutes)
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
                        
                        Text("\(minutesInPeriod(in: visibleRangeMonth) / 30)")
                            .font(.title2.bold())
                            .foregroundColor(.primary)

                        Text(visibleRangeStringMonth)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Chart {
                            ForEach(aggregatedData) { record in
                                BarMark(
                                    x: .value("Day", record.day, unit: .day),
                                    y: .value("Minutes", record.minutes)
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
                        
                    case.last1Day:
                        Text("Total")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Text("\(minutesInPeriod(in: visibleRange) / 30)")
                            .font(.title2.bold())
                            .foregroundColor(.primary)

                        Text(visibleRangeString)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Chart {
                            ForEach(aggregatedData) { record in
                                BarMark(
                                    x: .value("Day", record.day, unit: .day),
                                    y: .value("Minutes", record.minutes)
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
