//
//  ResultsPresenter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.05.2022.
//

import Foundation

final class ResultsPresenter {
    
    // MARK: - Properties
    
    weak var view: ResultsScreenViewInput?
    
    // MARK: - Private Properties
    
    private var cells = [ResultsModels.Cell]()
    private var router: ResultsScreenRouterInput
    
    private(set) var state: ResultsModels.State = .default {
        didSet {
            view?.handleState(state)
        }
    }
    
    // MARK: - Initialization
    
    init(router: ResultsScreenRouterInput) {
        self.router = router
    }
    
    // MARK: - Private Methods
    
    private func configureCellsModels() -> [ResultsModels.Cell] {
        cells.removeAll()
        cells.append(.text(.init(
            player1Name: "P1",
            player2Name: "P2",
            result1: "15",
            result2: "-10",
            date: Date())))
        return cells
    }
}

// MARK: - ResultsScreenViewOutput

extension ResultsPresenter: ResultsScreenViewOutput {
    func viewDidLoad() {
        state = .success(configureCellsModels())
    }
    
    func onBackTapped() {
        router.routeBack()
    }
}
