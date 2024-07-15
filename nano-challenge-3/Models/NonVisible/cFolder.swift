import Foundation
import SwiftData

@Model final class Folders : Identifiable, Hashable {
    
    var name     : String
    var contains : [Note]
    var count    : Int {
        contains.count
    }
    
    init ( _ name: String, contains: [Note] ) {
        self.name     = name
        self.contains = []
    }
    
    convenience init ( ) {
        self.init (
            AppConfig.defaultFoldername,
            contains: []
        )
    }
    
    static func == ( lhs: Folders, rhs: Folders ) -> Bool {
        lhs.id == rhs.id
    }
    
}

// MARK: - Creation Chaining Methods
extension Folders {
    
    /// Returns the object whose this method is chained to, with its ``contains`` attribute filled with the supplied argument.
    func withContentOf ( _ n: [Note] ) -> Self {
        self.contains = n
        return self
    }
    
}
