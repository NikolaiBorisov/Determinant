//
//  LabelFactory.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.05.2022.
//

import UIKit

final class TextFieldFactory {
    static func generate(placeholder: String, delegate: UIViewController) -> UITextField {
        let textField = UITextField()
        textField.clearButtonMode = .whileEditing
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .done
        textField.placeholder = placeholder
        textField.keyboardType = .alphabet
        textField.delegate = delegate as? UITextFieldDelegate
        return textField
    }
}
