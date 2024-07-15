import SwiftData
import SwiftUI

extension BackgroundForegroundColorSet {
    var background : Color {
        encasedBackground.value
    }
    
    var foreground : Color {
        encasedForeground.value
    }
}

class BackgroundForegroundColorSet : Codable {
    private var encasedBackground : EncasedColor
    private var encasedForeground : EncasedColor
    
    init ( background: Color, foreground: Color ) {
        self.encasedBackground = .init(from: background)
        self.encasedForeground = .init(from: foreground)
    }
    
    enum CodingKeys: CodingKey {
        case background,
             foreground
    }
    
    required init ( from decoder: Decoder ) throws {
        let container     = try decoder.container(keyedBy: CodingKeys.self)
        
        encasedBackground = try container.decode(EncasedColor.self, forKey: .background)
        encasedForeground = try container.decode(EncasedColor.self, forKey: .foreground)
    }
    
    func encode ( to encoder: Encoder ) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(encasedBackground, forKey: .background)
        try container.encode(encasedForeground, forKey: .foreground)
    }
}

struct EncasedColor : Codable {
    var r: Double
    var g: Double
    var b: Double
    var a: Double
    
    var value : Color {
        Color(red: r, green: g, blue: b, opacity: a)
    }
    
    init ( from: Color ) {
        let rgba = from.rawComponent()
        r = rgba.red
        g = rgba.green
        b = rgba.blue
        a = rgba.alpha
    }
}
