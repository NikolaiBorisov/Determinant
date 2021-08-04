//
//  DeterminantButton.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit
import SnapKit

class DeterminantButton: UIButton {
  
  enum DeterminantButtonType: String {
    case instruction = "Read the Instruction"
    case game = "Game"
    case matrixInfo = "More about Matrix 3x3"
    case numberpadButton = ""
    case seeMatrix = "See the Matrix"
    case startOverButton = "Start Over"
  }
  
  init(type: DeterminantButtonType) {
    super.init(frame: .zero)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.setTitleColor(.white, for: .normal)
    self.titleLabel?.font = UIFont.buttonFont
    self.layer.cornerRadius = 10
    self.layer.borderWidth = 2
    self.layer.borderColor = UIColor.white.cgColor
    self.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
    self.setTitle(type.rawValue, for: .normal)
    self.snp.makeConstraints { $0.height.equalTo(50.0) }
  }
  
  @objc private func onButtonTapped() {
    pulsate()
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    fatalError(Constants.NSCoder.fatalError)
  }
  
}
