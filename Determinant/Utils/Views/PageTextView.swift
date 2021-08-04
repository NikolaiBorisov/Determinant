//
//  PageTextView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

class PageTextView: UITextView {
  
  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    self.configureSelf()
  }
  required init?(coder: NSCoder) {
    fatalError(Constants.NSCoder.fatalError)
  }
  
  private func configureSelf() {
    self.isEditable = false
    self.font = UIFont.pageVCFont
    self.textColor = .white
    self.textAlignment = .center
    self.backgroundColor = .systemIndigo
  }
  
}
