//
//  PageViewMaker.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 24.07.2021.
//

import UIKit

final class PageViewMaker {
  
  unowned var container: PageViewController
  
  init(container: PageViewController) {
    self.container = container
  }
  
  let pageTextView: UITextView = {
    let textView = PageTextView()
    
    return textView
  }()
  
  lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(systemName: Constants.Image.backButtonImage), for: .normal)
    button.tintColor = .white
    
    return button
  }()
  
  func setupLayouts() {
    [
      pageTextView,
      dismissButton
    ]
    .forEach { container.view.addSubview($0) }
    
    dismissButton.snp.makeConstraints {
      $0.top.equalTo(container.view.safeAreaLayoutGuide.snp.top).offset(5.0)
      $0.height.width.equalTo(40.0)
      $0.leading.equalToSuperview().offset(5.0)
    }
    
  }
  
}
