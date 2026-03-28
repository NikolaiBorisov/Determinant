//
//  GameRouter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.05.2022.
//

import UIKit

protocol GameRouterInput {
    func routeBack()
}

final class GameRouter {
    
    // MARK: - Properties
    
    weak var view: UIViewController?
}

// MARK: - ChooseSignRouterInput

extension GameRouter: GameRouterInput {
    func routeBack() {
        view?.navigationController?.popViewController(animated: true)
    }
}
