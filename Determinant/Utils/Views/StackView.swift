//
//  CircleStackView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

class StackView: UIStackView {
  
  init() {
    super.init(frame: .zero)
    self.configureSelf()
  }
  
  required init(coder: NSCoder) {
    fatalError(Constants.NSCoder.fatalError)
  }
  
  private func configureSelf() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.axis = .horizontal
    self.distribution = .fillEqually
    self.spacing = 5
  }
  
}
