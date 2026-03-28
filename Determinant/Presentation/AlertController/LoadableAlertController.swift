//
//  LoadableAlertController.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 11.05.2022.
//

import UIKit

protocol LoadableAlertController {
    func showAlert(
        title: String,
        delegate: UIViewController,
        isTextFieldActive: Bool,
        completion: @escaping (String, String) -> Void?
    )
}

// MARK: - Present LoadableErrorAlertController

extension LoadableAlertController where Self: UIViewController {
    
    // MARK: - Methods
    
    func showAlert(
        title: String,
        delegate: UIViewController = UIViewController(),
        isTextFieldActive: Bool = false,
        completion: @escaping (String, String) -> Void?
    ) {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: title,
                message: "",
                preferredStyle: .alert
            )
            let applyButton = UIAlertAction(
                title: isTextFieldActive ? "Apply" : "Ok",
                style: .destructive,
                handler: { _ in
                    if isTextFieldActive {
                        guard let player1Name = alert.textFields?[0].text, !player1Name.isEmpty,
                              let player2Name = alert.textFields?[1].text, !player2Name.isEmpty else { return }
                        completion(player1Name, player2Name)
                    } else {
                        completion("", "")
                    }
                }
            )
            applyButton.isEnabled = isTextFieldActive ? false : true
            applyButton.setValue(UIColor.white, forKey: "titleTextColor")
            alert.addAction(applyButton)
            self.prepare(alert: alert, withTitle: title)
            
            if isTextFieldActive {
                alert.addTextField { textField in
                    self.addObserver(for: textField)
                    self.prepareTextField(textField: textField, delegate: delegate, placeholder: "1st Player, Enter Your Name")
                }
                alert.addTextField { textField in
                    self.addObserver(for: textField, applyButton: applyButton)
                    self.prepareTextField(textField: textField, delegate: delegate, placeholder: "2nd Player, Enter Your Name")
                }
            }
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Private Methods
    
    private func prepare(alert: UIAlertController, withTitle title: String) {
        // Cursor color
        alert.view.tintColor = .black
        // BGColor
        alert.view.subviews.first?.subviews.first?.subviews.first?
            .backgroundColor = UIColor.systemIndigo
        // SetAlertTitle
        alert.setValue(NSAttributedString(
            string: title,
            attributes: [
                NSAttributedString.Key.font: UIFont.getAvenirNext(ofSize: 20, weight: .bold),
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]), forKey: "attributedTitle")
    }
    
    private func addObserver(for textField: UITextField, applyButton: UIAlertAction = UIAlertAction()) {
        NotificationCenter.default.addObserver(
            forName: UITextField.textDidChangeNotification,
            object: textField,
            queue: OperationQueue.main, using: { _ in
                let textCount = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
                let textIsNotEmpty = textCount > 0
                applyButton.isEnabled = textIsNotEmpty
            })
    }
    
    private func prepareTextField(
        textField: UITextField,
        delegate: UIViewController,
        placeholder: String
    ) {
        textField.placeholder = placeholder
        textField.autocapitalizationType = .sentences
        textField.keyboardType = .alphabet
        textField.clearButtonMode = .whileEditing
        textField.delegate = delegate as? UITextFieldDelegate
    }
}
