import SwiftUI
import Observation

extension NoteBlockStyle {
    var color : BackgroundForegroundColorSet {
        preset.colorStyle
    }
    var text  : Font {
        preset.textStyle
    }
}

@Observable class NoteBlockStyle : Codable {
    var preset : NoteBlockPreset

    init ( _ nbp: NoteBlockPreset ) {
        preset = nbp
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._preset = try container.decode(NoteBlockPreset.self, forKey: .preset)
    }
    
    enum CodingKeys: CodingKey {
        case preset
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self._preset, forKey: .preset)
    }
}
