import SwiftUI

struct NoteBlock: View {
    @Environment(\.editMode) var mode
    @Binding var paragraph: NoteParagraph
    
    var body: some View {
        HStack {
            if ( paragraph.style.preset == .card ) {
                TextField("", text: $paragraph.content, axis: .vertical)
                    .font(paragraph.style.text)
                    .padding()
            } else {
                TextField("", text: $paragraph.content, axis: .vertical)
                    .font(paragraph.style.text)
            }
            Spacer()
            if ( mode?.wrappedValue == .active ) {
                Menu {
                    ChangeStyleMenu(paragraph: $paragraph)
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .frame (
                            width : 50,
                            height: 50
                        )
                }
            }
        }
            .background(paragraph.style.color.background)
            .foregroundStyle(paragraph.style.color.foreground)
    }
}

struct ChangeStyleMenu : View {
    @Binding var paragraph : NoteParagraph
    
    var body : some View {
        Menu {
            ForEach ( NoteBlockPreset.allCases, id: \.self ) { preset in
                Button {
                    let a = paragraph
                    a.style = .init(preset)
                    paragraph = a
                } label: {
                    Text(preset.rawValue)
                }
            }
        } label: {
            Text("Change block style")
        }
    }
}
