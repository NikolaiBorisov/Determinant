//
//  GamePresenter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.05.2022.
//

import Foundation
import UIKit

protocol GamePresenterDelegate: AnyObject {
    func didRequestShowResultMatrix()
    func didRequestStartOver()
    func textFieldTapped(sender: UITextField)
}

final class GamePresenter {
    
    // MARK: - Properties
    
    weak var delegate: GamePresenterDelegate?
    weak var view: GameScreenViewInput?
    
    // MARK: - Private Properties
    
    private var router: GameRouterInput
    private var cells = [InfoModels.Cell]()
    private var playerName: (String, String)
    private var playerSign: (String, String)
    
    private(set) var state: InfoModels.State = .default {
        didSet {
            view?.handleState(state)
        }
    }
    
    // MARK: - Initialization
    
    init(router: GameRouterInput,
         playerName: (String, String),
         playerSign: (String, String)) {
        self.router = router
        self.playerName = playerName
        self.playerSign = playerSign
    }
    
    // MARK: - Private Methods
    
    private func configureCellsModels() -> [InfoModels.Cell] {
        cells.removeAll()
        cells.append(.text(.init(text: playerName.0 + " (\(playerSign.0))",
                                 color: playerSign.0 == "+" ? .blue : .red,
                                 isGameActive: true)))
        cells.append(.text(.init(text: playerName.1 + " (\(playerSign.1))",
                                 color: playerSign.1 == "+" ? .blue : .red,
                                 isGameActive: true)))
        cells.append(.gameField(.init(title: "")))
        cells.append(.button(.init(title: "Result", type: .result, action: nil)))
        cells.append(.button(.init(title: "Start Over", type: .start, action: nil)))
        return cells
    }
}

// MARK: - GameScreenViewOutput

extension GamePresenter: GameScreenViewOutput {
    func onBackTapped() {
        router.routeBack()
    }
    
    func viewDidLoad() {
        state = .success(configureCellsModels())
    }
}

// MARK: - GameTableAdapterOutput

extension GamePresenter: GameTableAdapterOutput {
    func textFieldTapped(sender: UITextField) {
        delegate?.textFieldTapped(sender: sender)
    }
    
    func itemSelected(atIndex index: Int) {
        guard let cell = cells[someIndex: index] else { return }
        switch cell {
        case .button(let data):
            switch data.type {
            case .result:
                delegate?.didRequestShowResultMatrix()
            case .start:
                delegate?.didRequestStartOver()
                state = .success(configureCellsModels())
            default:
                break
            }
        case .gameField(_):
            break
        default:
            break
        }
    }
}
