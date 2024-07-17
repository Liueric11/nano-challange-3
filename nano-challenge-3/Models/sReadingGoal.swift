import Foundation

@Observable class ReadingHabit : Codable {
    var minuteDuration : Int
    var timeAlarm      : DateComponents
    var alarmIsArmed   : Bool
    var date           : Date {
        get {
            Calendar.current.date(from: timeAlarm) ?? .now
        }
        set {
            let components = Calendar.current.dateComponents([.hour, .minute], from: newValue)
            self.timeAlarm = components
        }
    }
    
    init ( minuteDuration: Int, timeAlarm: DateComponents, alarmIsArmed: Bool ) {
        self.minuteDuration = minuteDuration
        self.timeAlarm      = timeAlarm
        self.alarmIsArmed   = alarmIsArmed
    }
    
    convenience init () {
        self.init (
            minuteDuration : 30, 
            timeAlarm      : .init(hour: 0, minute: 0),
            alarmIsArmed   : false
        )
    }
}
