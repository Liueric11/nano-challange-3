import Foundation

class ReadingHabitConfigViewModel {
    
   var readingHabitConfigurations : ReadingHabit {
        get {
            var existingObject : ReadingHabit? = try? JSONDecoder().decode(
                ReadingHabit.self, 
                from: userDefaults.data(forKey: UserDefaultsNaming.readingHabitObject) ?? Data()
            ) as ReadingHabit
            if ( existingObject == nil ) {
                existingObject = ReadingHabit()
                userDefaults.set(try? JSONEncoder().encode(existingObject), forKey: UserDefaultsNaming.readingHabitObject)
                userDefaults.synchronize()
            }
            return existingObject!
        }
       set {
           print("new config was set: \(newValue)")
           userDefaults.set(try? JSONEncoder().encode(newValue), forKey: UserDefaultsNaming.readingHabitObject)
           userDefaults.synchronize()
       }
    }
    let userDefaults = UserDefaults.standard
        
}
