import SwiftData
import Foundation

@Observable class NoteParagraph : Identifiable, Codable, Hashable {
    var id      = UUID()
    var content : String
    var style   : NoteBlockStyle
    
    init ( _ c: String, styled: NoteBlockStyle ) {
        self.content = c
        self.style   = styled
    }
    
    func hash ( into hasher: inout Hasher ) {
        hasher.combine(id)
    }
    
    static func == ( lhs: NoteParagraph, rhs: NoteParagraph ) -> Bool {
        lhs.id == rhs.id
    }
    
    enum CodingKeys: CodingKey {
        case id,
             content,
             style
    }
    
    required init ( from decoder: Decoder ) throws {
        let container     = try decoder.container(keyedBy: CodingKeys.self)
        
        id      = try container.decode(UUID.self, forKey: .id)
        content = try container.decode(String.self, forKey: .content)
        style   = try container.decode(NoteBlockStyle.self, forKey: .style)
    }
    
    func encode ( to encoder: Encoder ) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(content, forKey: .content)
        try container.encode(style, forKey: .style)
    }
}
