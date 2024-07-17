//
//  QuoteView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 17/07/24.
//

//import SwiftUI
//
//struct QuoteView: View {
//    @State private var text: String = "Some normal text\nThis text will be quoted\nMore normal text"
//    @State private var selectedRange: NSRange?
//
//    var body: some View {
//        VStack {
//            TextEditorWithQuoteButton(text: $text, selectedRange: $selectedRange)
//                .frame(height: 200)
//                .border(Color.gray, width: 1)
//                .padding()
//            
//            Button(action: formatAsQuote) {
//                Text("Quote Selected Text")
//            }
//            .padding()
//        }
//    }
//    
//    private func formatAsQuote() {
//        guard let selectedRange = selectedRange, selectedRange.length > 0 else {
//            return
//        }
//        
//        let nsText = NSString(string: text)
//        let selectedText = nsText.substring(with: selectedRange)
//        
//        let quotedText = selectedText.split(separator: "\n").map { "│ \($0)" }.joined(separator: "\n")
//        let newText = nsText.replacingCharacters(in: selectedRange, with: quotedText)
//        
//        text = newText
//    }
//}
//
//struct TextEditorWithQuoteButton: UIViewRepresentable {
//    @Binding var text: String
//    @Binding var selectedRange: NSRange?
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    func makeUIView(context: Context) -> UITextView {
//        let textView = UITextView()
//        textView.delegate = context.coordinator
//        textView.isSelectable = true
//        textView.isEditable = true
//        textView.font = UIFont.preferredFont(forTextStyle: .body)
//        textView.backgroundColor = UIColor.clear
//        textView.text = text
//        return textView
//    }
//    
//    func updateUIView(_ uiView: UITextView, context: Context) {
//        if uiView.text != text {
//            uiView.text = text
//        }
//    }
//    
//    class Coordinator: NSObject, UITextViewDelegate {
//        var parent: TextEditorWithQuoteButton
//        
//        init(_ parent: TextEditorWithQuoteButton) {
//            self.parent = parent
//        }
//        
//        func textViewDidChange(_ textView: UITextView) {
//            self.parent.text = textView.text
//        }
//        
//        func textViewDidChangeSelection(_ textView: UITextView) {
//            if let selectedRange = textView.selectedTextRange {
//                let location = textView.offset(from: textView.beginningOfDocument, to: selectedRange.start)
//                let length = textView.offset(from: selectedRange.start, to: selectedRange.end)
//                self.parent.selectedRange = NSRange(location: location, length: length)
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuoteView()
//    }
//}
