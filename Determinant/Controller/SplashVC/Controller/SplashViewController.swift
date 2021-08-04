//
//  SplashViewController.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.04.2021.
//

import UIKit

final class SplashViewController: UIViewController {
  
  private lazy var viewMaker = SplashViewMaker(container: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    viewMaker.setupLayouts()
    startAnimating()
    setupEndOfAnimation()
  }
  
  private func startAnimating() {
    for (index, view) in viewMaker.stackView.subviews.reversed().enumerated() {
      UIView.animate(
        withDuration: 0.6,
        delay: TimeInterval(0.5 / Double(index + 1)),
        options: [.repeat, .autoreverse],
        animations: {
          view.alpha = 1
        })
    }
  }
  
  private func setupEndOfAnimation() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) { [weak self] in
      self?.view.subviews.forEach {
        $0.removeFromSuperview()
      }
      let vc = WelcomeViewController()
      vc.modalPresentationStyle = .fullScreen
      vc.modalTransitionStyle = .flipHorizontal
      self?.present(vc, animated: true)
    }
  }
  
}
