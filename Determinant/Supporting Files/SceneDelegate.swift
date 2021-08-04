//
//  SceneDelegate.swift
//  Mathematical Determinant App
//
//  Created by NIKOLAI BORISOV on 01.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    self.window = UIWindow(windowScene: windowScene)
    self.window?.rootViewController = self.createMainViewController()
    self.window?.makeKeyAndVisible()
}

  private func createMainViewController() -> UIViewController {
    let splashScreen = SplashViewController()
    return splashScreen
  }
  
}
