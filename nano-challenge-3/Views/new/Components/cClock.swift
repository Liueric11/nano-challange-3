import SwiftUI

@Observable class Clock {
    
    public  var elapsedSeconds : Int
    private var timer          : Timer?
    
    init () {
        self.elapsedSeconds = 0
    }
    
    func begin () {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            
            elapsedSeconds += 1
        }
    }
    
    func stop () {
        self.timer?.invalidate()
        self.timer = nil
    }
}
