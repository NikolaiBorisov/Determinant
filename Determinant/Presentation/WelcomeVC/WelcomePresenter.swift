//
//  WelcomeViewControllerPresenter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 02.05.2022.
//

import UIKit

final class WelcomePresenter {
    
    // MARK: - Properties
    
    weak var view: WelcomeScreenViewInput?
    
    // MARK: - Private Properties
    
    private let router: WelcomeRouterInput
    
    // MARK: - Initialization
    
    init(router: WelcomeRouterInput) {
        self.router = router
    }
}

// MARK: - WelcomeScreenViewOutput

extension WelcomePresenter: WelcomeScreenViewOutput {
    func onInstructionTapped() {
        router.routeToPageVC()
    }
    
    func onGameTapped() {
        router.routeToSignVC()
    }
}
