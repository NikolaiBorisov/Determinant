//
//  LogoImageView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

class LogoImageView: UIImageView {
  
  init() {
    super.init(frame: .zero)
    self.configureSelf()
  }
  
  required init?(coder: NSCoder) {
    fatalError(Constants.NSCoder.fatalError)
  }
  
  private func configureSelf() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.tintColor = .white
    self.fadeTransition()
    self.image = UIImage(systemName: Constants.Image.logoImageName)
  }
}
