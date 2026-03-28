//
//  GameAssembly.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.05.2022.
//

import UIKit

final class GameAssembly {
    static func assemble(playerName: (String, String), playerSign: (String, String)) -> UIViewController {
        let router = GameRouter()
        let presenter = GamePresenter(router: router, playerName: playerName, playerSign: playerSign)
        let tableAdapter = GameTableAdapter()
        let view = GameScreenViewController(output: presenter, tableAdapter: tableAdapter)
        presenter.view = view
        presenter.delegate = view.mainView
        router.view = view
        tableAdapter.output = presenter
        return view
    }
}
