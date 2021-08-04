//
//  CustomGameField.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 04.03.2021.
//

import UIKit
import SnapKit

final class GameViewController: UIViewController {
  
  private var activeTextField: UITextField?
  private var isActivePlayer = false
  private var isResultsHidden = true
  private lazy var viewMaker = GameViewMaker(container: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewMaker.setupLayouts()
    setupButtonAction()
    setupUI()
    viewMaker.gameFieldViewContainer.startButton = viewMaker.startButton
    viewMaker.gameFieldViewContainer.messageLabel = viewMaker.winnerLabel
    viewMaker.gameFieldViewContainer.playerLabel = viewMaker.playerLabel
    viewMaker.gameFieldViewContainer.resultsLabel = viewMaker.resultsLabel
    viewMaker.gameFieldViewContainer.resultsButton = viewMaker.showResultMatrix
  }
  
  private func setupUI() {
    viewMaker.numpadViewContainer.isUserInteractionEnabled = false
    viewMaker.startButton.isHidden = true
    viewMaker.winnerLabel.isHidden = true
    viewMaker.resultsLabel.isHidden = true
    viewMaker.showResultMatrix.isHidden = true
    viewMaker.playerLabel.text = NSLocalizedString("Player (+)", comment: "Label")
    viewMaker.playerLabel.textColor = .systemBlue
    viewMaker.numpadViewContainer.delegate = self
    viewMaker.gameFieldViewContainer.delegate = self
  }
  
  private func setupButtonAction() {
    viewMaker.showResultMatrix.addTarget(self, action: #selector(onShowResultMatrixPressed(_:)), for: .touchUpInside)
    viewMaker.startButton.addTarget(self, action: #selector(onStartButtonPressed(_:)), for: .touchUpInside)
  }
  
  @objc private func onShowResultMatrixPressed(_ sender: UIButton!) {
    if isResultsHidden {
      viewMaker.gameFieldViewContainer.hideTextFields()
      viewMaker.resultsLabel.isHidden = false
      viewMaker.gameFieldViewContainer.computeTheDeterminant()
    } else {
      viewMaker.gameFieldViewContainer.showTextFields()
      viewMaker.resultsLabel.isHidden = true
      viewMaker.gameFieldViewContainer.computeTheDeterminant()
    }
    isResultsHidden = !isResultsHidden
  }
  
  @objc private func onStartButtonPressed(_ sender: UIButton) {
    viewMaker.gameFieldViewContainer.clearFields()
    viewMaker.winnerLabel.isHidden = true
    viewMaker.startButton.isHidden = true
    viewMaker.resultsLabel.isHidden = true
    viewMaker.showResultMatrix.isHidden = true
    viewMaker.playerLabel.isHidden = false
    viewMaker.gameFieldViewContainer.showTextFields()
    isResultsHidden = true
    viewMaker.numpadViewContainer.showTheButtons()
  }
  
}

extension GameViewController: GameFieldDelegate {
  
  func textFieldTapped(sender: UITextField) {
    activeTextField = sender
    viewMaker.numpadViewContainer.isUserInteractionEnabled = true
  }
  
}

extension GameViewController: NumpadViewDelegate {
  
  func onButtonPressed(from: UIButton) {
    activeTextField?.insertText(from.currentTitle ?? "")
    viewMaker.numpadViewContainer.isUserInteractionEnabled = false
    viewMaker.gameFieldViewContainer.isUserInteractionEnabled = true
    if isActivePlayer {
      activeTextField?.textColor = .systemRed
      viewMaker.playerLabel.text = NSLocalizedString("Player (+)", comment: "Label")
      viewMaker.playerLabel.textColor = .systemBlue
      isActivePlayer = false
    } else  {
      activeTextField?.textColor = .systemBlue
      viewMaker.playerLabel.text = NSLocalizedString("Player (-)", comment: "Label")
      viewMaker.playerLabel.textColor = .systemRed
      isActivePlayer = true
    }
  }
  
}
