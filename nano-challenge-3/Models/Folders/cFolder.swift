import Foundation
import SwiftData

@Model final class Folder : Identifiable, Hashable {
    
    var name     : String
    @Relationship(deleteRule: .cascade) var contains : [Note]
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
    
    static func == ( lhs: Folder, rhs: Folder ) -> Bool {
        lhs.id == rhs.id
    }
    
}

// MARK: - Creation Chaining Methods
extension Folder {
    
    /// Returns the object whose this method is chained to, with its ``contains`` attribute filled with the supplied argument.
    func withContentOf ( _ n: [Note] ) -> Self {
        self.contains = n
        return self
    }
    
}
