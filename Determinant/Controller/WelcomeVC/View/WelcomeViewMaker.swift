//
//  WelcomeViewMaker.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 24.07.2021.
//

import UIKit

final class WelcomeViewMaker {
  
  unowned var container: WelcomeViewController
  
  init(container: WelcomeViewController) {
    self.container = container
  }
  
  lazy var welcomeLabel: UILabel = {
    let label = DeterminantLabel(type: .welcomeVCLabel)
    label.text = NSLocalizedString("Welcome to the Game\n«Determinant»", comment: "Label")
    
    return label
  }()
  
  lazy var instructionButton: UIButton = {
    let button = DeterminantButton(type: .instruction)
    button.setTitle(NSLocalizedString("Read the Instruction", comment: "Button"), for: .normal) 
    
    return button
  }()
  
  lazy var gameButton: UIButton = {
    let button = DeterminantButton(type: .game)
    button.backgroundColor = .systemIndigo
    button.setTitle(NSLocalizedString("Game", comment: "Button"), for: .normal)
    
    return button
  }()
  
  lazy var gifImageViewContainer: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.loadGif(name: Constants.Gif.name)
    
    return imageView
  }()
  
  func setupLayouts() {
    [
      welcomeLabel,
      instructionButton,
      gifImageViewContainer,
      gameButton
    ]
    .forEach { container.view.addSubview($0) }
    
    welcomeLabel.snp.makeConstraints {
      $0.top.equalTo(container.view.safeAreaLayoutGuide.snp.top).offset(10.0)
      $0.centerX.equalToSuperview()
    }
    
    instructionButton.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(20.0)
    }
    
    gameButton.snp.makeConstraints {
      $0.bottom.equalTo(container.view.safeAreaLayoutGuide.snp.bottom).offset(-10.0)
      $0.leading.equalToSuperview().offset(20.0)
      $0.trailing.equalToSuperview().offset(-20.0)
    }
    
    gifImageViewContainer.snp.makeConstraints {
      $0.bottom.equalTo(gameButton.snp.top).offset(-10.0)
      $0.centerX.equalToSuperview()
    }
    
  }
  
}
