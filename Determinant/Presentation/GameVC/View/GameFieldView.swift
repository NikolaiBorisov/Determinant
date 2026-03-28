//
//  CustomGameField.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 04.03.2021.
//

import UIKit
import SnapKit

protocol GameFieldDelegate: AnyObject {
    func textFieldTapped(sender: UITextField)
}

final class GameFieldView: UIView, UITextFieldDelegate {
    
    // MARK: - Properties
    
    weak var delegate: GameFieldDelegate?
    
    var startButton: UIButton?
    var messageLabel: UILabel?
    var playerLabel: UILabel?
    var resultsLabel: UILabel?
    var resultsButton: UIButton?
    
    // MARK: - Private Properties
    
    private lazy var textFields: [UITextField] = {
        (1...9).map { _ in createTextField() }
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Actions
    
//    @objc 
//    private func textFieldTapped(textField: UITextField) {
//        delegate?.textFieldTapped(sender: textField)
//    }
    
    @objc 
    private func textFieldIsNotEmpty() {
        textFields.forEach {
            if $0.text == nil || $0.text == "" {
                self.startButton?.isHidden = true
                self.messageLabel?.isHidden = true
                self.resultsButton?.isHidden = true
                return
            }
            computeTheDeterminant()
        }
    }
    
    // MARK: - Methods
    
    func setupLayout(onView view: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        textFields.forEach {
            $0.delegate = self
            $0.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
            addSubview($0)
        }
        setupAddTargetIsNotEmptyTF()
        setupMainStackView()
        doNotShowTheKeyboard()
        textFields.forEach { textField in
                  textField.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
              }

    }
    
    func clearFields() {
        textFields.forEach { $0.text = "" }
    }
    
    func hideTextFields() {
        textFields.forEach { $0.isHidden = true }
    }
    
    func showTextFields() {
        textFields.forEach { $0.isHidden = false }
    }
    
    func computeTheDeterminant() {
            guard let numbers = textFields.compactMap({ Int($0.text ?? "") }) as? [Int], numbers.count == 9 else { return }
        
        let matrix = [
                  [numbers[0], numbers[1], numbers[2]],
                  [numbers[3], numbers[4], numbers[5]],
                  [numbers[6], numbers[7], numbers[8]]
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
                messageLabel?.text = "Determinant = \(determinant)" + "GameVC.Player(+)Winner.Text".localized
            } else if determinant < 0 {
                messageLabel?.text = "Determinant = \(determinant)" + "GameVC.Player(-)Winner.Text".localized
            } else {
                messageLabel?.text = "Determinant = \(determinant)" + "GameVC.Draw.Text".localized
            }
            startButton?.isHidden = false
            messageLabel?.isHidden = false
            resultsButton?.isHidden = false
            playerLabel?.isHidden = true
            
            showResultsLabel(matrix: matrix, rightDiagonal: rightDiagonal, leftDiagonal: leftDiagonal, determinant: determinant)
        }
    }
    
    // MARK: - Private Methods
    
    private func showResultsLabel(matrix: [[Int]], rightDiagonal: Int, leftDiagonal: Int, determinant: Int) {
        let mainDiagonal = """
        Main Diagonal(+):\n(\(matrix[0][0])*\(matrix[1][1])*\(matrix[2][2])) +
        (\(matrix[0][1])*\(matrix[1][2])*\(matrix[2][0])) +
        (\(matrix[0][2])*\(matrix[1][0])*\(matrix[2][1])) = \(rightDiagonal)
        """
        
        let secondaryDiagonal = """
        \n\nSecondary Diagonal(-):\n(\(matrix[0][2])*\(matrix[1][1])*\(matrix[2][0])) +
        (\(matrix[0][1])*\(matrix[1][0])*\(matrix[2][2])) +
        (\(matrix[0][0])*\(matrix[1][2])*\(matrix[2][1])) = \(leftDiagonal)
        """
        
        let determinant = "\n\nDeterminant:\n\(rightDiagonal) - \(leftDiagonal) = \(determinant)"
        resultsLabel?.text = mainDiagonal + secondaryDiagonal + determinant
    }
    
    private func doNotShowTheKeyboard() {
        textFields.forEach { $0.inputView = UIView() }
    }
    
    private func setupMainStackView() {
        let stackView1 = StackView()
        stackView1.spacing = 40.0
        [textFields[0], textFields[1], textFields[2]].forEach { stackView1.addArrangedSubview($0) }
        addSubview(stackView1)
        
        let stackView2 = StackView()
        stackView2.spacing = 40.0
        [textFields[3], textFields[4], textFields[5]].forEach { stackView2.addArrangedSubview($0) }
        addSubview(stackView2)
        
        let stackView3 = StackView()
        stackView3.spacing = 40.0
        [textFields[6], textFields[7], textFields[8]].forEach { stackView3.addArrangedSubview($0) }
        addSubview(stackView3)
        
        let mainStackView = UIStackView()
        
        mainStackView.axis = NSLayoutConstraint.Axis.vertical
        mainStackView.distribution = .fillEqually
        mainStackView.alignment = .center
        mainStackView.spacing = 10.0
        [stackView1, stackView2, stackView3].forEach { mainStackView.addArrangedSubview($0) }
        addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10.0)
            $0.trailing.equalToSuperview().offset(-10.0)
        }
    }
    
    private func setupAddTargetIsNotEmptyTF() {
        textFields.forEach { $0.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged) }
    }
    
    private func createTextField() -> UITextField {
        let tf = DeterminantTextField()
        tf.delegate = self
        self.addSubview(tf)
        tf.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        tf.snp.makeConstraints{ $0.height.width.equalTo(70.0) }
        return tf
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        // Notify the delegate when the text field begins editing
        delegate?.textFieldTapped(sender: textField)
    }
}
