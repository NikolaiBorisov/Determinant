//
//  UIView+Ext.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 19.03.2021.
//

import UIKit

extension UIView {
  
  @IBInspectable var cornerRadius: CGFloat {
    get { return self.layer.cornerRadius }
    set { self.layer.cornerRadius = newValue }
  }
  
  @IBInspectable var borderWidth: CGFloat {
    get { return self.layer.borderWidth }
    set { self.layer.borderWidth = newValue }
  }
  
  @IBInspectable var borderColor: UIColor? {
    get { guard let color = self.layer.borderColor else { return nil }
      return UIColor(cgColor: color)
    }
    set { self.layer.borderColor = newValue?.cgColor }
  }
  
  func setupViewBorder() {
    self.layer.cornerRadius = 10
    self.layer.borderWidth = 2
    self.layer.borderColor = UIColor.white.cgColor
  }
  
}
