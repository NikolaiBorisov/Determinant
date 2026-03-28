//
//  WelcomeRouter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 02.05.2022.
//

import UIKit

protocol WelcomeRouterInput {
    func routeToPageVC()
    func routeToSignVC()
}

final class WelcomeRouter {
    
    // MARK: - Properties
    
    weak var view: UIViewController?
}

// MARK: - WelcomeRouterInput

extension WelcomeRouter: WelcomeRouterInput {
    func routeToPageVC() {
        let vc = PageViewControllerAssembly.assemble()
        view?.present(vc, animated: true)
    }
    
    func routeToSignVC() {
        let tabBar = TabBarAssembler.assemble()
        view?.present(tabBar, animated: true)
    }
}
