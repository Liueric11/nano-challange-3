import SwiftUI

extension NoteBlockStyle {
    var color  : BackgroundForegroundColorSet {
        preset.colorStyle
    }
    var text   : Font {
        preset.textStyle
    }
}

struct NoteBlockStyle : Codable {
    var preset : NoteBlockPreset

    init ( _ nbp: NoteBlockPreset ) {
        preset = nbp
    }
}
