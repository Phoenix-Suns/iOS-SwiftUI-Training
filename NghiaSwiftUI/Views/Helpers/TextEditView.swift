//  File name   : TextEditView.swift
//
//  Author      : Nghia Tran
//  Created date: 2/22/24
//  Version     : 1.00
//  --------------------------------------------------------------
//  Copyright © 2024 Fiision Studio. All rights reserved.
//  --------------------------------------------------------------

import Foundation
import SwiftUI

struct TextEditView: UIViewRepresentable {

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical) // wrap height
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)    // wrap width
        textField.font = self.font
        textField.textColor = UIColor(self.textColor)
        textField.tintColor = UIColor(self.tintColor)
        textField.backgroundColor = UIColor(self.background)
        textField.textAlignment = self.textAlignment
        textField.placeholder = self.placeHolder
        textField.keyboardType = self.keyboardType

        textField.resignFirstResponder() // dismiss keyboard
        //textField.becomeFirstResponder() // focus keyboard
        
        if let placeHolder = placeHolder {
            textField.attributedPlaceholder = NSAttributedString(
                string: placeHolder,
                attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor( self.placeHolderColor)
                ]
            )
        }
        
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text, onEditing: self.onEditing)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        var onEditing: ((Bool) -> Void)?
        
        init(text: Binding<String>, onEditing: ((Bool) -> Void)?) {
            _text = text
            self.onEditing = onEditing
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            onEditing?(false) // Notify that editing ended
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            onEditing?(true)
        }
    }

    /// Struct's constructors.
    init(text: Binding<String>, font: UIFont = .systemFont(ofSize: 16, weight: .bold), textColor: Color = .black, tintColor: Color = .gray, background: Color = .clear, textAlignment: NSTextAlignment = .left, placeHolder: String? = nil, placeHolderColor: Color = Color.gray.opacity(0.5), keyboardType: UIKeyboardType = .default, onEditing: ((Bool) -> Void)? = nil) {
        
        self._text = text
        self.font = font
        self.textColor = textColor
        self.tintColor = tintColor
        self.background = background
        self.textAlignment = textAlignment
        self.placeHolder = placeHolder
        self.placeHolderColor = placeHolderColor
        self.keyboardType = keyboardType
        self.onEditing = onEditing
    }
    
    /// Struct's private properties.
    @Binding private var text: String
    private var font: UIFont
    private var textColor: Color
    private var tintColor: Color
    private var background: Color
    private var textAlignment: NSTextAlignment
    private var placeHolder: String?
    private var placeHolderColor: Color
    private var keyboardType: UIKeyboardType
    private var onEditing: ((Bool) -> Void)?
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TestTextEditView: View {
    @State private var text: String = "1234567890 1234567890 1234567890 1234567890 "
    @State private var editing: Bool = false
    
    var body: some View {
        VStack {
            TextEditView(text: $text)
            TextEditView(text: $text)
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.yellow)
                )
            TextEditView(text: $text)
                .padding(20)
                .background(
                    Capsule()
                        .foregroundColor(Color.yellow)
                )
            TextEditView(text: $text, font: .systemFont(ofSize: 24, weight: .bold), textColor: .blue, tintColor: .red, textAlignment: .center, placeHolder: "Enter text", placeHolderColor: .green, keyboardType: .numberPad,
                         onEditing: { isEditing in
                             editing = isEditing
                         })
                .frame(width: 200)
                .background(Color.gray)
            Text("You entered: \(text)")
            Text("Edditing: \(String(editing))")
        }.onTapGesture {
            hideKeyboard()
        }
    }
}

// MARK: - TextEditView's preview
#if DEBUG
    struct TextEditView_Previews: PreviewProvider {
        static var previews: some View {
            TestTextEditView()
        }
    }
#endif
