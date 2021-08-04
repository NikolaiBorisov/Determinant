//
//  CustomGameField.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 04.03.2021.
//

import UIKit
import SnapKit

final class GameFieldView: UIView, UITextFieldDelegate {
    
    var delegate: GameFieldDelegate?
    var startButton: UIButton?
    var messageLabel: UILabel?
    var playerLabel: UILabel?
    var resultsLabel: UILabel?
    var resultsButton: UIButton?
    
    lazy var tf1 = self.createTextField()
    lazy var tf2 = self.createTextField()
    lazy var tf3 = self.createTextField()
    lazy var tf4 = self.createTextField()
    lazy var tf5 = self.createTextField()
    lazy var tf6 = self.createTextField()
    lazy var tf7 = self.createTextField()
    lazy var tf8 = self.createTextField()
    lazy var tf9 = self.createTextField()
    
    var arrayOfTextFields: [UITextField] {
        return [tf1, tf2, tf3, tf4, tf5, tf6, tf7, tf8, tf9]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .black
        arrayOfTextFields.forEach { self.addSubview($0) }
        arrayOfTextFields.forEach { $0.addTarget(self, action: #selector(textFieldTapped(textField:)), for: .touchDown) }
        setupAddTargetIsNotEmptyTF()
        setupMainStackView()
        doNotShowTheKeyboard()
    }
    
    func clearFields() {
        arrayOfTextFields.forEach { $0.text = "" }
    }
    
    func hideTextFields() {
        arrayOfTextFields.forEach { $0.isHidden = true }
    }
    
    func showTextFields() {
        arrayOfTextFields.forEach { $0.isHidden = false }
    }
    
    private func doNotShowTheKeyboard() {
        arrayOfTextFields.forEach { $0.inputView = UIView() }
    }
    
    @objc private func textFieldTapped(textField: UITextField) {
        self.delegate?.textFieldTapped(sender: textField)
    }
    
    private func setupMainStackView() {
        
        let stackView1 = StackView()
        stackView1.spacing = 40.0
        [tf1, tf2, tf3]
            .forEach { stackView1.addArrangedSubview($0) }
        self.addSubview(stackView1)
        
        let stackView2 = StackView()
        stackView2.spacing = 40.0
        [tf4, tf5, tf6]
            .forEach { stackView2.addArrangedSubview($0) }
        self.addSubview(stackView2)
        
        let stackView3 = StackView()
        stackView3.spacing = 40.0
        [tf7, tf8, tf9]
            .forEach { stackView3.addArrangedSubview($0) }
        self.addSubview(stackView3)
        
        let mainStackView = UIStackView()
        
        mainStackView.axis = NSLayoutConstraint.Axis.vertical
        mainStackView.distribution = .fillEqually
        mainStackView.alignment = .center
        mainStackView.spacing = 10.0
        [
            stackView1,
            stackView2,
            stackView3
        ]
        .forEach { mainStackView.addArrangedSubview($0) }
        self.addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10.0)
            $0.trailing.equalToSuperview().offset(-10.0)
        }
        
    }
    
    private func setupAddTargetIsNotEmptyTF() {
        arrayOfTextFields.forEach { $0.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged) }
    }
    
    @objc private func textFieldIsNotEmpty() {
        arrayOfTextFields.forEach {
            if $0.text == nil || $0.text == "" {
                self.startButton?.isHidden = true
                self.messageLabel?.isHidden = true
                self.resultsButton?.isHidden = true
                return
            }
            computeTheDeterminant()
        }
    }
    
    func computeTheDeterminant() {
        guard
            let text1 = tf1.text, let number1 = Int(text1),
            let text2 = tf2.text, let number2 = Int(text2),
            let text3 = tf3.text, let number3 = Int(text3),
            let text4 = tf4.text, let number4 = Int(text4),
            let text5 = tf5.text, let number5 = Int(text5),
            let text6 = tf6.text, let number6 = Int(text6),
            let text7 = tf7.text, let number7 = Int(text7),
            let text8 = tf8.text, let number8 = Int(text8),
            let text9 = tf9.text, let number9 = Int(text9)
        else { return }
        
        let matrix = [
            [number1, number2, number3],
            [number4, number5, number6],
            [number7, number8, number9]
        ]
        
        if !matrix.isEmpty {
            let rightDiagonal =
                (matrix[0][0] * matrix[1][1] * matrix[2][2]) +
                (matrix[0][1] * matrix[1][2] * matrix[2][0]) +
                (matrix[0][2] * matrix[1][0] * matrix[2][1])
            let leftDiagonal =
                (matrix[0][2] * matrix[1][1] * matrix[2][0]) +
                (matrix[0][1] * matrix[1][0] * matrix[2][2]) +
                (matrix[0][0] * matrix[1][2] * matrix[2][1])
            let determinant = rightDiagonal - leftDiagonal
            
            if determinant > 0 {
                messageLabel?.text = NSLocalizedString("Determinant = \(determinant).\nPlayer(+) Won 🏆", comment: "Label")
            } else if determinant < 0 {
                messageLabel?.text = NSLocalizedString("Determinant = \(determinant).\nPlayer(-) Won 🏆", comment: "Label")
            } else {
                messageLabel?.text = NSLocalizedString("Determinant = \(determinant).\nDraw!🤝 ", comment: "Label")
            }
            startButton?.isHidden = false
            messageLabel?.isHidden = false
            resultsButton?.isHidden = false
            playerLabel?.isHidden = true
            
            func showResultsLabel() {
                resultsLabel?.text = "Main Diagonal(+):\n(\(matrix[0][0])*\(matrix[1][1])*\(matrix[2][2])) + (\(matrix[0][1])*\(matrix[1][2])*\(matrix[2][0])) + (\(matrix[0][2])*\(matrix[1][0])*\(matrix[2][1])) = \(rightDiagonal)\n\nSecondary Diagonal(-):\n(\(matrix[0][2])*\(matrix[1][1])*\(matrix[2][0])) + (\(matrix[0][1])*\(matrix[1][0])*\(matrix[2][2])) + (\(matrix[0][0])*\(matrix[1][2])*\(matrix[2][1])) = \(leftDiagonal)\n\nDetermimamt:\n\(rightDiagonal) - \(leftDiagonal) = \(determinant)"
            }
            showResultsLabel()
        }
    }
    
    private func createTextField() -> UITextField {
        let tf = DeterminantTextField()
        tf.delegate = self
        self.addSubview(tf)
        tf.snp.makeConstraints{ $0.height.width.equalTo(70.0) }
        
        return tf
    }
    
}
