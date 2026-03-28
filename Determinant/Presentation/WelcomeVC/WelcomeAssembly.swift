//
//  WelcomeAssembly.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 26.04.2022.
//

import UIKit

final class WelcomeAssembly {
    static func assemble() -> UIViewController {
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(router: router)
        let view = WelcomeScreenViewController(output: presenter)
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .flipHorizontal
        presenter.view = view
        router.view = view
        return view
    }
}
