//
//  PlayerSignButton.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.06.2021.
//

import UIKit

class PlayerSignButton: UIButton {
  
  enum PlayerSignButtonType: String {
    case buttonPlus = "+"
    case buttonMinus = "-"
  }
  
  init(type: PlayerSignButtonType) {
    super.init(frame: .zero)
    self.setTitleColor(.white, for: .normal)
    self.titleLabel?.font = UIFont.signButtonFont
    self.layer.cornerRadius = 10
    self.layer.borderWidth = 2
    self.layer.borderColor = UIColor.white.cgColor
    self.backgroundColor = .darkGray
    self.setTitle(type.rawValue, for: .normal)
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    fatalError(Constants.NSCoder.fatalError)
  }
  
}
