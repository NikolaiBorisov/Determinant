//
//  UIViewController+Ext.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

extension UIViewController {
  
  func hideKeyboard() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    self.view.addGestureRecognizer(tapGesture)
  }
  
  @objc func handleTap() {
    self.view.endEditing(true)
  }
  
}
