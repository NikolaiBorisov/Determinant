//
//  DeterminantTextField.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.06.2021.
//

import UIKit

class DeterminantTextField: UITextField {
  
  init() {
    super.init(frame: .zero)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.layer.cornerRadius = 10
    self.font = UIFont.tfFont
    self.textAlignment = .center
    self.backgroundColor = .white
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    fatalError(Constants.NSCoder.fatalError)
  }
  
}
