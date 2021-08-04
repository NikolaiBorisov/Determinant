//
//  SignViewMaker.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 24.07.2021.
//

import UIKit

final class SignViewMaker {
  
  unowned var container: SignViewController
  
  init(container: SignViewController) {
    self.container = container
  }
  
  lazy var gameButton: UIButton = {
    let button = DeterminantButton(type: .game)
    button.backgroundColor = .systemIndigo
    button.setTitle(NSLocalizedString("Game", comment: "Button"), for: .normal)
    
    return button
  }()
  
  lazy var firstPlayerLabel: UILabel = {
    let label = DeterminantLabel(type: .firstPlayerLabel)
    label.setupLabel()
    label.text = NSLocalizedString("1st Player, choose the Sign\n👇🏻", comment: "Label")
    
    return label
  }()
  
  lazy var secondPlayerLabel: UILabel = {
    let label = DeterminantLabel(type: .secondPlayerLabel)
    label.setupLabel()
    label.text = NSLocalizedString("2nd Player, choose the Sign\n👇🏻", comment: "Label")
    
    return label
  }()
  
  lazy var player1ButtonPlus: UIButton = {
    let button = PlayerSignButton(type: .buttonPlus)
    
    return button
  }()
  
  lazy var player1ButtonMinus: UIButton = {
    let button = PlayerSignButton(type: .buttonMinus)
    
    return button
  }()
  
  lazy var player2ButtonPlus: UIButton = {
    let button = PlayerSignButton(type: .buttonPlus)
    
    return button
  }()
  
  lazy var player2ButtonMinus: UIButton = {
    let button = PlayerSignButton(type: .buttonMinus)
    
    return button
  }()
  
  lazy var player1ButtonStack: UIStackView = {
    let stackView = StackView()
    [
      player1ButtonPlus,
      player1ButtonMinus
    ]
    .forEach { stackView.addArrangedSubview($0) }
    
    return stackView
  }()
  
  lazy var player2ButtonStack: UIStackView = {
    let stackView = StackView()
    [
      player2ButtonPlus,
      player2ButtonMinus
    ]
    .forEach { stackView.addArrangedSubview($0) }
    
    return stackView
  }()
  
  func setupLayouts() {
    [
      firstPlayerLabel,
      player1ButtonStack,
      secondPlayerLabel,
      player2ButtonStack,
      gameButton
    ]
    .forEach { container.view.addSubview($0) }
    
    firstPlayerLabel.snp.makeConstraints {
      $0.top.equalTo(container.view.safeAreaLayoutGuide.snp.top).offset(50.0)
      $0.leading.equalToSuperview().offset(20.0)
      $0.trailing.equalToSuperview().offset(-20.0)
    }
    
    player1ButtonStack.snp.makeConstraints {
      $0.top.equalTo(firstPlayerLabel.snp.bottom).offset(5.0)
      $0.centerX.equalToSuperview()
      $0.width.equalTo(100.0)
      $0.height.equalTo(50.0)
    }
    
    secondPlayerLabel.snp.makeConstraints {
      $0.top.equalTo(player1ButtonStack.snp.bottom).offset(20.0)
      $0.leading.equalToSuperview().offset(20.0)
      $0.trailing.equalToSuperview().offset(-20.0)
    }
    
    player2ButtonStack.snp.makeConstraints {
      $0.top.equalTo(secondPlayerLabel.snp.bottom).offset(5.0)
      $0.centerX.equalToSuperview()
      $0.width.equalTo(100.0)
      $0.height.equalTo(50.0)
    }
    
    gameButton.snp.makeConstraints {
      $0.bottom.equalTo(container.view.safeAreaLayoutGuide.snp.bottom).offset(-10)
      $0.leading.equalToSuperview().offset(20.0)
      $0.trailing.equalToSuperview().offset(-20.0)
    }
    
  }
  
  
}
