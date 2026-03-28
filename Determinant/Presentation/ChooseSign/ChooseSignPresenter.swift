//
//  ChooseSignScreenPresenter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 10.05.2022.
//

import Foundation

final class ChooseSignPresenter {
    
    // MARK: - Properties
    
    weak var view: ChooseSignScreenViewInput?
    
    // MARK: - Private Properties
    
    private let router: ChooseSignRouterInput
    
    // MARK: - Initialization
    
    init(router: ChooseSignRouterInput) {
        self.router = router
    }
}

// MARK: - ChooseSignScreenViewOutput

extension ChooseSignPresenter: ChooseSignScreenViewOutput {
    func gameTapped(playerName: (String, String), playerSign: (String, String)) {
        router.routeToGameVC(playerName: playerName, playerSign: playerSign)
    }
}
