//
//  ChooseSignAssembly.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 10.05.2022.
//

import UIKit

final class ChooseSignAssembly {
    static func assemble() -> UIViewController {
        let router = ChooseSignRouter()
        let presenter = ChooseSignPresenter(router: router)
        let view = ChooseSignScreenViewController(output: presenter)
        presenter.view = view
        router.view = view
        return view
    }
}
