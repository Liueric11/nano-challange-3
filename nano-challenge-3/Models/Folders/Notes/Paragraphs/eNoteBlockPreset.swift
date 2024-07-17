import SwiftUI

enum NoteBlockPreset : String, Codable, CaseIterable {
    var colorStyle : BackgroundForegroundColorSet {
        let c = UIConfig.Colors.NoteBlockStyles.self
        
        switch ( self ) {
            case .title:
                return .init(background: .clear, foreground: c.primary)
            case .subtitle:
                return .init(background: .clear, foreground: c.secondary)
            case .card:
                return .init(background: c.bgCard, foreground: c.primary)
            case .quote:
                return .init(background: .clear, foreground: c.secondary)
            case .body:
                return .init(background: .clear, foreground: c.primary)
            case .footnote:
                return .init(background: .clear, foreground: c.secondary)
            case .caption:
                return .init(background: .clear, foreground: c.secondary)
        }
    }
    var textStyle  : Font {
        switch ( self ) {
            case .title:
                return .title3.bold()
            case .subtitle:
                return .subheadline
            case .card:
                return .body
            case .quote:
                return .callout.italic()
            case .body:
                return .body
            case .footnote:
                return .footnote
            case .caption:
                return .caption
        }
    }
    
    case body     = "Body",
         caption  = "Caption",
         card     = "Card",
         footnote = "Footnote",
         quote    = "Quote",
         subtitle = "Subtitle",
         title    = "Title"
}
