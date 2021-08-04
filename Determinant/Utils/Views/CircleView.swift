//
//  CircleView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

class CircleView: UIImageView {
  
  init() {
    super.init(frame: .zero)
    self.configureSelf()
  }
  
  required init?(coder: NSCoder) {
    fatalError(Constants.NSCoder.fatalError)
  }
  
  private func configureSelf() {
    self.backgroundColor = .white
    self.layer.cornerRadius = 15
    self.alpha = 0
  }
  
}
