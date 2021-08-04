//
//  InfoViewController.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 14.03.2021.
//

import UIKit

final class InfoViewController: UIViewController {
  
  private lazy var viewMaker = InfoViewMaker(container: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavBar()
    setupButtonAction()
    viewMaker.setupLayouts()
  }
  
  private func setupButtonAction() {
    viewMaker.gameButton.addTarget(self, action: #selector(onGameButtonPressed(_:)), for: .touchUpInside)
    viewMaker.matrixInfoButton.addTarget(self, action: #selector(onMatrixInfoButtonPressed(_:)), for: .touchUpInside)
  }
  
  @objc private func onMatrixInfoButtonPressed(_ sender: UIButton) {
    guard let url = URL(string: Constants.URL.matrixURL),
          UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }
  
  @objc private func onGameButtonPressed(_ sender: UIButton) {
    let vc = GameViewController()
    navigationController?.pushViewController(vc, animated: false)
  }
  
  private func setupNavBar() {
    title = NSLocalizedString(Constants.VCTitle.infoVCTitle, comment: "Label")
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: Constants.Image.backButtonImage),
      style: .done,
      target: self,
      action: #selector(onBackButtonTapped)
    )
    navigationController?.tabBarItem.title? = Constants.TabBarItem.item1Title
  }
  
  @objc private func onBackButtonTapped() {
    dismiss(animated: true)
  }
  
}
