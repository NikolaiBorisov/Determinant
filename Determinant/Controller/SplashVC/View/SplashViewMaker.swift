//
//  SplashViewMaker.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 24.07.2021.
//

import UIKit
import SnapKit

final class SplashViewMaker {
  
  unowned var container: SplashViewController
  
  init(container: SplashViewController) {
    self.container = container
  }
  
  lazy var logoImageView: UIImageView = {
    let logo = LogoImageView()
    
    return logo
  }()
  
  func createCircleView() -> UIView {
    let view = CircleView()
    
    return view
  }
  
  lazy var stackView: UIStackView = {
    let stackView = StackView()
    for index in 0..<3 {
      stackView.addArrangedSubview(createCircleView())
    }
    
    return stackView
  }()
  
  func setupLayouts() {
    [
      logoImageView,
      stackView
    ]
    .forEach { container.view.addSubview($0) }
    
    logoImageView.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.height.equalTo(70.0)
      $0.width.equalTo(70.0)
    }
    
    stackView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(logoImageView.snp.bottom).offset(10.0)
      $0.height.equalTo(30.0)
      $0.width.equalTo(100.0)
    }
    
  }
  
}
