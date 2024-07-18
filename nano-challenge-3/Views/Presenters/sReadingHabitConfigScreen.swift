import SwiftUI

struct ReadingHabitConfigScreen : View {
    @Binding var readingHabitConfig : ReadingHabit
    
    var body : some View {
        List {
            DatePicker(selection: $readingHabitConfig.date, displayedComponents: [.hourAndMinute]) {
                Label("ls.settings.reading-duration", systemImage: "stopwatch")
                    .pickerStyle(.wheel)
            }
            Toggle(isOn: $readingHabitConfig.alarmIsArmed) {
                Label("ls.settings.reminder", systemImage: "bell")
            }
        }
    }
}
