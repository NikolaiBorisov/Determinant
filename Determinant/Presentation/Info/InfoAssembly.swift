//
//  InfoAssembly.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 06.05.2022.
//

import UIKit

final class InfoAssembly {
    static func assemble() -> UIViewController {
        let router = InfoRouter()
        let presenter = InfoPresenter(router: router)
        let tableAdapter = InfoTableAdapter()
        let view = InfoScreenViewController(output: presenter, tableAdapter: tableAdapter)
        router.view = view
        presenter.view = view
        return view
    }
}
