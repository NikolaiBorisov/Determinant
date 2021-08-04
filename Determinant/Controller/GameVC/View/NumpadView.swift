//
//  NumpadView.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 07.03.2021.
//

import UIKit
import SnapKit

fileprivate enum ButtonTitle: String {
  case one = "1", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9"
}

final class NumpadView: UIView {
  
  var delegate: NumpadViewDelegate?
  
  private lazy var bt1 = self.createTheButton(withTitle: ButtonTitle.one.rawValue)
  private lazy var bt2 = self.createTheButton(withTitle: ButtonTitle.two.rawValue)
  private lazy var bt3 = self.createTheButton(withTitle: ButtonTitle.three.rawValue)
  private lazy var bt4 = self.createTheButton(withTitle: ButtonTitle.four.rawValue)
  private lazy var bt5 = self.createTheButton(withTitle: ButtonTitle.five.rawValue)
  private lazy var bt6 = self.createTheButton(withTitle: ButtonTitle.six.rawValue)
  private lazy var bt7 = self.createTheButton(withTitle: ButtonTitle.seven.rawValue)
  private lazy var bt8 = self.createTheButton(withTitle: ButtonTitle.eight.rawValue)
  private lazy var bt9 = self.createTheButton(withTitle: ButtonTitle.nine.rawValue)
  
  private var arrayOfButtons: [UIButton] {
    return [bt1, bt2, bt3, bt4, bt5, bt6, bt7, bt8, bt9]
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupNumpadView()
  }
  
  func showTheButtons() {
    arrayOfButtons.forEach {$0.isHidden = false }
  }
  
  func setupNumpadView() {
    backgroundColor = .black
    addButtonsIntoTheStackView()
  }
  
  private func createTheButton(withTitle: String) -> UIButton {
    let button = DeterminantButton(type: .numberpadButton)
    button.backgroundColor = .systemIndigo
    button.setTitle(withTitle, for: .normal)
    button.addTarget(self, action: #selector(sendTheData), for: .touchUpInside)
    self.addSubview(button)
    return button
  }
  
  @objc func sendTheData(sender: UIButton!) {
    delegate?.onButtonPressed(from: sender)
    sender.isHidden = true
  }
  
  private func addButtonsIntoTheStackView() {
    let buttonStackView1 = StackView()
    arrayOfButtons.forEach {buttonStackView1.addArrangedSubview($0)}
    self.addSubview(buttonStackView1)
    
    buttonStackView1.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(10.0)
      $0.trailing.equalToSuperview().offset(-10.0)
    }
    
  }
  
}
