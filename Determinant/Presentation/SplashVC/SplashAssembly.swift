//
//  SplashAssembly.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 26.04.2022.
//

import UIKit

final class SplashAssembly {
    static func assemble() -> UIViewController {
        let router = SplashRouter()
        let presenter = SplashPresenter(router: router)
        let view = SplashScreenViewController(output: presenter)
        presenter.view = view
        router.view = view
        return view
    }
}
