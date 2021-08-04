//
//  UIImageView+Animation.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 14.03.2021.
//

import UIKit

extension UIImageView {
  
  func fadeTransition() {
    self.alpha = 0.0
    UIImageView.animate(
      withDuration: 3.0,
      delay: 0.25,
      options: .curveEaseInOut,
      animations: {
        self.alpha = 1
      })
  }
  
}
