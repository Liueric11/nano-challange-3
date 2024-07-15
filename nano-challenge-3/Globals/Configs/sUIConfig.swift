import SwiftUI

struct UIConfig {
    
    struct Colors {
        struct NoteBlockStyles {
            static let accent    : Color = Color.init("Accent")
            static let bgCard    : Color = Color.init("CardBackground")
            static let primary   : Color = Color.init("Primary")
            static let secondary : Color = Color.init("Secondary")
        }
    }
    
    struct Paddings : FiveLevelDivision {
        static var nano   : Double  = 2
        static var small  : Double  = 4
        static var normal : Double  = 8
        static var large  : Double  = 16
        static var huge   : Double  = 32
    }
    
    struct Spacings : FiveLevelDivision {
        static var nano   : Double  = 4
        static var small  : Double  = 8
        static var normal : Double  = 16
        static var large  : Double  = 32
        static var huge   : Double  = 64
    }
    
    struct CornerRadiuses : FiveLevelDivision {
        static var nano   : Double  = 2
        static var small  : Double  = 4
        static var normal : Double  = 8
        static var large  : Double  = 16
        static var huge   : Double  = 32
    }
    
}

protocol FiveLevelDivision {
    static var nano   : Double { get }
    static var small  : Double { get }
    static var normal : Double { get }
    static var large  : Double { get }
    static var huge   : Double { get }
}
