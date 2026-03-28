//
//  ResultsRouter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.05.2022.
//

import UIKit

protocol ResultsScreenRouterInput {
    func routeBack()
}

final class ResultsRouter {
    
    // MARK: - Properties
    
    weak var view: UIViewController?
}

// MARK: - ResultsScreenRouterInput

extension ResultsRouter: ResultsScreenRouterInput {
    func routeBack() {
        view?.dismiss(animated: true)
    }
}
