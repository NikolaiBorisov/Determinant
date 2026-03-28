//
//  SplashPresenter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 26.04.2022.
//

import Foundation

final class SplashPresenter {
    
    // MARK: - Properties
    
    weak var view: SplashScreenViewInput?
    
    // MARK: - Private Properties
    
    private let router: SplashRouterInput
    
    // MARK: - Initialization
    
    init(router: SplashRouterInput) {
        self.router = router
    }
}

// MARK: - SplashScreenViewOutput

extension SplashPresenter: SplashScreenViewOutput {
    func viewDidLoad() {
        router.routeToWelcomeScreen()
    }
}
