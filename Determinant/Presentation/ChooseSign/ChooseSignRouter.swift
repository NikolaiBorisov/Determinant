//
//  ChooseSignRouter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 10.05.2022.
//

import UIKit

protocol ChooseSignRouterInput {
    func routeToGameVC(playerName: (String, String), playerSign: (String, String))
}

final class ChooseSignRouter {
    
    // MARK: - Properties
    
    weak var view: UIViewController?
}

// MARK: - ChooseSignRouterInput

extension ChooseSignRouter: ChooseSignRouterInput {
    func routeToGameVC(playerName: (String, String), playerSign: (String, String)) {
        let vc = GameAssembly.assemble(playerName: playerName, playerSign: playerSign)
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
