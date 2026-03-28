//
//  ResultsAssembly.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.05.2022.
//

import UIKit

final class ResultsAssembly {
    static func assemble() -> UIViewController {
        let router = ResultsRouter()
        let presenter = ResultsPresenter(router: router)
        let tableAdapter = ResultsTableAdapter()
        let view = ResultsScreenViewController(output: presenter, tableAdapter: tableAdapter)
        presenter.view = view
        router.view = view
        return view
    }
}
