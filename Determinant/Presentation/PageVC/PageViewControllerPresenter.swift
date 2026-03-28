//
//  PageViewControllerPresenter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 02.05.2022.
//

import Foundation

final class PageViewControllerPresenter {
    
    // MARK: - Properties
    
    weak var view: PageViewControllerViewInput?
    
    // MARK: - Private Properties
    
    private var textContent: [String]
    private let router: PageViewControllerRouterInput
    
    // MARK: - Initialization
    
    init(router: PageViewControllerRouterInput) {
        self.router = router
        self.textContent = [
            "InstructionVC.Page1.Text".localized,
            "InstructionVC.Page2.Text".localized
        ]
    }
}

// MARK: - PageViewControllerViewOutput

extension PageViewControllerPresenter: PageViewControllerViewOutput {
    var instructionText: [String] { textContent }
}
