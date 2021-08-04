//
//  WelcomeViewController.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 14.03.2021.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
  
  private let viewModel: WelcomeViewModel = WelcomeViewModel()
  private lazy var viewMaker = WelcomeViewMaker(container: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewMaker.setupLayouts()
    setupButtonAction()
    viewModel.appendPageVC()
  }
  
  private func setupButtonAction() {
    viewMaker.instructionButton.addTarget(self, action: #selector(onRulesButtonPressed(_:)), for: .touchUpInside)
    viewMaker.gameButton.addTarget(self, action: #selector(onGameButtonPressed(_:)), for: .touchUpInside)
  }
  
  @objc private func onRulesButtonPressed(_ sender: UIButton) {
    presentPageVC()
  }
  
  @objc private func onGameButtonPressed(_ sender: UIButton) {
    let vc = TabBarViewController()
    vc.modalPresentationStyle = .fullScreen
    vc.modalTransitionStyle = .flipHorizontal
    self.present(vc, animated: true)
  }
  
  // нужно ли перенести в модель?
  func presentPageVC() {
    
    guard let first = viewModel.myControllers.first else { return }
    let vc = UIPageViewController(
      transitionStyle: .pageCurl,
      navigationOrientation: .horizontal,
      options: nil
    )
    vc.delegate = self
    vc.dataSource = self
    vc.setViewControllers(
      [first],
      direction: .forward,
      animated: true,
      completion: nil
    )
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true)
  }
  
}

extension WelcomeViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let index = viewModel.myControllers.firstIndex(of: viewController),
          index > 0
    else { return nil }
    let before = index - 1
    return viewModel.myControllers[before]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let index = viewModel.myControllers.firstIndex(of: viewController),
          index < (viewModel.myControllers.count - 1)
    else { return nil }
    let after = index + 1
    return viewModel.myControllers[after]
  }
  
}
