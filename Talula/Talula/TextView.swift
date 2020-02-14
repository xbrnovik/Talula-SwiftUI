//
//  TextView.swift
//  Talula
//
//  Created by Diana Brnovik on 14/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    var text: String
    var insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    func makeUIView(context: Context) -> UITextView {
        UITextView(frame: .zero)
    }

    func updateUIView(_ view: UITextView, context: Context) {
        view.text = text
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.sizeToFit()
        view.isEditable = false
        view.dataDetectorTypes = .link
        //view.textContainerInset = insets
        //view.textContainer.lineFragmentPadding = 0
        view.isScrollEnabled = false
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        //view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .vertical)
    }
}
