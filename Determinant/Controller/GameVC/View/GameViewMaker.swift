//
//  GameViewMaker.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 24.07.2021.
//

import UIKit
import SnapKit

final class GameViewMaker {
  
  unowned var container: GameViewController
  
  init(container: GameViewController) {
    self.container = container
  }
  
  lazy var gameFieldViewContainer: GameFieldView = {
    let container = GameFieldView()
    container.translatesAutoresizingMaskIntoConstraints = false
    container.setupView()
    
    return container
  }()
  
  lazy var numpadViewContainer: NumpadView = {
    let container = NumpadView()
    container.translatesAutoresizingMaskIntoConstraints = false
    container.setupNumpadView()
    
    return container
  }()
  
  lazy var winnerLabel: UILabel = {
    let label = DeterminantLabel(type: .winnerInfoLabel)
    label.setupLabel()
    
    return label
  }()
  
  lazy var playerLabel: UILabel = {
    let label = DeterminantLabel(type: .winnerInfoLabel)
    label.setupLabel()
    
    return label
  }()
  
  lazy var resultsLabel: UILabel = {
    let label = DeterminantLabel(type: .winnerInfoLabel)
    label.setupLabel()
    
    return label
  }()
  
  lazy var showResultMatrix: UIButton = {
    let button = DeterminantButton(type: .seeMatrix)
    button.backgroundColor = .systemIndigo
    
    return button
  }()
  
  lazy var startButton: UIButton = {
    let button = DeterminantButton(type: .startOverButton)
    button.backgroundColor = .systemIndigo
    
    return button
  }()
  
  func setupLayouts() {
    [
      gameFieldViewContainer,
      numpadViewContainer,
      playerLabel,
      winnerLabel,
      resultsLabel,
      showResultMatrix,
      startButton
    ]
    .forEach { container.view.addSubview($0) }
    
    playerLabel.snp.makeConstraints {
      $0.top.equalTo(container.view.safeAreaLayoutGuide.snp.top).offset(10.0)
      $0.leading.equalToSuperview().offset(20.0)
      $0.trailing.equalToSuperview().offset(-20.0)
    }
    
    winnerLabel.snp.makeConstraints {
      $0.top.equalTo(container.view.safeAreaLayoutGuide.snp.top).offset(10.0)
      $0.leading.equalToSuperview().offset(20.0)
      $0.trailing.equalToSuperview().offset(-20.0)
    }
    
    resultsLabel.snp.makeConstraints {
      $0.top.equalTo(winnerLabel.snp.bottom).offset(5.0)
      $0.leading.equalToSuperview().offset(20.0)
      $0.trailing.equalToSuperview().offset(-20.0)
    }
    
    showResultMatrix.snp.makeConstraints {
      $0.top.equalTo(resultsLabel.snp.bottom).offset(5.0)
      $0.leading.equalToSuperview().offset(20.0)
      $0.trailing.equalToSuperview().offset(-20.0)
    }
    
    startButton.snp.makeConstraints {
      $0.top.equalTo(showResultMatrix.snp.bottom).offset(5.0)
      $0.leading.equalToSuperview().offset(20.0)
      $0.trailing.equalToSuperview().offset(-20.0)
    }
    
    numpadViewContainer.snp.makeConstraints {
      $0.bottom.equalTo(container.view.safeAreaLayoutGuide.snp.bottom).offset(-20.0)
      $0.centerX.equalToSuperview()
      $0.leading.equalToSuperview().offset(20.0)
      $0.height.equalTo(100)
    }
    
    gameFieldViewContainer.snp.makeConstraints {
      $0.top.equalTo(container.view.safeAreaLayoutGuide.snp.top).offset(80.0)
      $0.leading.equalToSuperview().offset(20.0)
      $0.trailing.equalToSuperview().offset(-20.0)
      $0.height.equalTo(300)
    }
    
  }
  
}
