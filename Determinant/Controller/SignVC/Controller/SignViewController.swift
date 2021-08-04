//
//  ChooseSignViewController.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 21.03.2021.
//

import UIKit
import SnapKit

final class SignViewController: UIViewController {
  
  private var activeTextField: UITextField?
  private lazy var viewMaker = SignViewMaker(container: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavBar()
    setupButtonAction()
    viewMaker.setupLayouts()
  }
  
  private func setupButtonAction() {
    viewMaker.gameButton.addTarget(self, action: #selector(onGameButtonPressed(_:)), for: .touchUpInside)
    viewMaker.player1ButtonPlus.addTarget(self, action: #selector(player1ButtonPlusTapped(_:)), for: .touchUpInside)
    viewMaker.player1ButtonMinus.addTarget(self, action: #selector(player1ButtonMinusTapped(_:)), for: .touchUpInside)
    viewMaker.player2ButtonPlus.addTarget(self, action: #selector(player2ButtonPlusTapped(_:)), for: .touchUpInside)
    viewMaker.player2ButtonMinus.addTarget(self, action: #selector(player2ButtonMinusTapped(_:)), for: .touchUpInside)
  }
  
  @objc private func onBackButtonTapped() {
    dismiss(animated: true)
  }
  
  @objc private func onGameButtonPressed(_ sender: UIButton) {
    let vc = GameViewController()
    navigationController?.pushViewController(vc, animated: false)
  }
  
  private func setupNavBar() {
    title = NSLocalizedString(Constants.VCTitle.signVCTitle, comment: "Label")
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: Constants.Image.backButtonImage),
      style: .done,
      target: self,
      action: #selector(onBackButtonTapped)
    )
    navigationController?.tabBarItem.title? = Constants.TabBarItem.item0Title
  }
  
  @objc private func player1ButtonPlusTapped(_ sender: UIButton) {
    viewMaker.player1ButtonPlus.setTitleColor(.systemBlue, for: .normal)
    viewMaker.player1ButtonMinus.isHidden = true
    if viewMaker.player1ButtonPlus.currentTitle == Constants.ButtonTitle.plusButtonTitle {
      viewMaker.player2ButtonPlus.isHidden = true
    }
  }
  
  @objc private func player1ButtonMinusTapped(_ sender: UIButton) {
    viewMaker.player1ButtonMinus.setTitleColor(.systemRed, for: .normal)
    viewMaker.player1ButtonPlus.isHidden = true
    if viewMaker.player1ButtonMinus.currentTitle == Constants.ButtonTitle.minusButtonTitle {
      viewMaker.player2ButtonMinus.isHidden = true
    }
  }
  
  @objc private func player2ButtonPlusTapped(_ sender: UIButton) {
    viewMaker.player2ButtonPlus.setTitleColor(.systemBlue, for: .normal)
    viewMaker.player2ButtonMinus.isHidden = true
    if viewMaker.player2ButtonPlus.currentTitle == Constants.ButtonTitle.plusButtonTitle {
      viewMaker.player1ButtonPlus.isHidden = true
    }
  }
  
  @objc private func player2ButtonMinusTapped(_ sender: UIButton) {
    viewMaker.player2ButtonMinus.setTitleColor(.systemRed, for: .normal)
    viewMaker.player2ButtonPlus.isHidden = true
    if viewMaker.player2ButtonMinus.currentTitle == Constants.ButtonTitle.minusButtonTitle {
      viewMaker.player1ButtonMinus.isHidden = true
    }
  }
  
}
