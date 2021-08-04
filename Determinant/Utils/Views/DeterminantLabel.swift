//
//  DeterminantLabel.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

class DeterminantLabel: UILabel {
  
  enum DeterminantLabelType: String {
    case welcomeVCLabel = "Welcome to the Game\n«Determinant»"
    case firstPlayerLabel = "1st Player, choose the Sign\n👇🏻"
    case secondPlayerLabel = "2nd Player, choose the Sign\n👇🏻"
    case aboutMatrixLabel = ""
    case winnerInfoLabel = " "
  }
  
  init(type: DeterminantLabelType) {
    super.init(frame: .zero)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.textAlignment = .center
    self.numberOfLines = 0
    self.font = UIFont.labelFont
    self.textColor = .white
    self.text = type.rawValue
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    fatalError(Constants.NSCoder.fatalError)
  }
  
}
