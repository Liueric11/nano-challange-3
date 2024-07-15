import Foundation

struct NoteAccessRecord : Codable, Hashable {
    
    var openedAt : Date
    var closedAt : Date
    
    var duration : TimeInterval {
        openedAt.timeIntervalSince1970 - closedAt.timeIntervalSince1970
    }
    
}
