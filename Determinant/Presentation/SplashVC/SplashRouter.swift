//
//  SplashRouter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 26.04.2022.
//

import Foundation
import UIKit

protocol SplashRouterInput {
    func routeToWelcomeScreen()
}

final class SplashRouter {
    
    // MARK: - Properties
    
    weak var view: UIViewController?
}

// MARK: - SplashRouterInput

extension SplashRouter: SplashRouterInput {
    func routeToWelcomeScreen() {
        let vc = WelcomeAssembly.assemble()
        view?.present(vc, animated: true)
    }
}
