//
//  PageViewControllerAssembly.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 02.05.2022.
//

import UIKit

final class PageViewControllerAssembly {
    static func assemble() -> UIViewController {
        let router = PageViewControllerRouter()
        let presenter = PageViewControllerPresenter(router: router)
        let view = PageViewController(output: presenter)
        presenter.view = view
        router.view = view
        return view
    }
}
