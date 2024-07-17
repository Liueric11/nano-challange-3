//
//  UITextViewRepresentable.swift
//  nano-challenge-3
//
//  Created by Eric Fernando on 18/07/24.
//

import SwiftUI

struct UITextViewRepresentable: UIViewRepresentable {
    @Binding var title: String
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isEditable = true
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.backgroundColor = .clear
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = title + (text.isEmpty ? "" : "\n") + text
        applyStyles(to: uiView)
    }

    func applyStyles(to textView: UITextView) {
        let combinedText = textView.text ?? ""
        let attributedText = NSMutableAttributedString(string: combinedText)
        
        // Apply title style to the first line
        if let firstLineRange = combinedText.range(of: "^[^\n]*", options: .regularExpression) {
            let nsRange = NSRange(firstLineRange, in: combinedText)
            let titleFont = UIFont.preferredFont(forTextStyle: .title1)
            if let titleDescriptor = titleFont.fontDescriptor.withSymbolicTraits(.traitBold) {
                let titleFontWithTrait = UIFont(descriptor: titleDescriptor, size: 0)
                attributedText.addAttribute(.font, value: titleFontWithTrait, range: nsRange)
            } else {
                attributedText.addAttribute(.font, value: titleFont, range: nsRange)
            }
        }
        
        // Apply subheadline style to the rest of the text
        if let remainingTextRange = combinedText.range(of: "(?<=\n).*", options: .regularExpression) {
            let nsRange = NSRange(remainingTextRange, in: combinedText)
            let subheadlineFont = UIFont.preferredFont(forTextStyle: .subheadline)
            if let subheadlineDescriptor = subheadlineFont.fontDescriptor.withSymbolicTraits([]) {
                let subheadlineFontWithTrait = UIFont(descriptor: subheadlineDescriptor, size: 0)
                attributedText.addAttribute(.font, value: subheadlineFontWithTrait, range: nsRange)
            } else {
                attributedText.addAttribute(.font, value: subheadlineFont, range: nsRange)
            }
        }

        textView.attributedText = attributedText
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: UITextViewRepresentable

        init(_ parent: UITextViewRepresentable) {
            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {
            let combinedText = textView.text ?? ""
            let components = combinedText.split(separator: "\n", omittingEmptySubsequences: false)
            if let firstComponent = components.first {
                parent.title = String(firstComponent)
            }
            if components.count > 1 {
                parent.text = components.dropFirst().joined(separator: "\n")
            } else {
                parent.text = ""
            }
            parent.applyStyles(to: textView)
        }
    }
}
