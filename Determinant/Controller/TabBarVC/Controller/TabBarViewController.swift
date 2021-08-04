//
//  TabBarViewController.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.06.2021.
//

import UIKit

final class TabBarViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
    setupVCs()
  }
  
  private func setupTabBar() {
    UITabBar.appearance().barTintColor = .black
    tabBar.tintColor = .white
  }
  
  private func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
    let navController = UINavigationController(rootViewController: rootViewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = image
    rootViewController.navigationItem.title = title
    return navController
  }
  
  private func setupVCs() {
    guard let image1 = UIImage(systemName: Constants.Image.gameVCIcon),
          let image2 = UIImage(systemName: Constants.Image.infoVCIcon)
    else { return }
    viewControllers = [
      createNavController(
        for: SignViewController(),
        title: NSLocalizedString(Constants.TabBarItem.item0Title, comment: ""),
        image: image1),
      createNavController(
        for: InfoViewController(),
        title: NSLocalizedString(Constants.TabBarItem.item1Title, comment: ""),
        image: image2),
    ]
  }
  
}
