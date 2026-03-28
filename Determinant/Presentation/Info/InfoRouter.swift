//
//  InfoScreenRouter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 06.05.2022.
//

import UIKit

protocol InfoRouterInput {
    func routeBack()
    func routeToMatrixInfo()
}

final class InfoRouter {
    
    // MARK: - Properties
    
    weak var view: UIViewController?
}

// MARK: - InfoRouterInput

extension InfoRouter: InfoRouterInput {
    func routeToMatrixInfo() {
        guard let url = URL(string: AppURL.matrixURL),
              UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func routeBack() {
        view?.dismiss(animated: true)
    }
}
