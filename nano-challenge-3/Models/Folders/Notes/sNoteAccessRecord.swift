import Foundation

struct NoteAccessRecord : Codable, Hashable {
    
    var openedAt : Date = .now
    var closedAt : Date? = nil
    
    var duration : TimeInterval {
        closedAt!.timeIntervalSince1970.rounded(.down) - openedAt.timeIntervalSince1970.rounded(.down)
    }
    
}
