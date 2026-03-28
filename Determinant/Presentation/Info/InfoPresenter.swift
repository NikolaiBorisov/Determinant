//
//  InfoPresenter.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 06.05.2022.
//

import UIKit

final class InfoPresenter {
    
    // MARK: - Properties
    
    weak var view: InfoScreenViewInput?
    
    // MARK: - Private Properties
    
    private var cells = [InfoModels.Cell]()
    private var router: InfoRouterInput
    
    private(set) var state: InfoModels.State = .default {
        didSet {
            view?.handleState(state)
        }
    }
    
    // MARK: - Initialization
    
    init(router: InfoRouterInput) {
        self.router = router
    }
    
    // MARK: - Private Methods
    
    private func configureCellsModels() -> [InfoModels.Cell] {
        cells.removeAll()
        cells.append(.text(.init(text: "InfoVC.LabelMatrix3x3.Description".localized)))
        cells.append(.singlePhoto(.init(image: AppImage.matrix_3x3 ?? UIImage())))
        cells.append(.text(.init(text: "InfoVC.LabelMainDiagonal.Info".localized)))
        cells.append(.singlePhoto(.init(image: AppImage.main_diagonal ?? UIImage())))
        cells.append(.text(.init(text: "InfoVC.LabelSecondaryDiagonal.Info".localized)))
        cells.append(.singlePhoto(.init(image: AppImage.secondary_diagonal ?? UIImage())))
        cells.append(.text(.init(text: "InfoVC.LabelDeterminant.Info".localized)))
        cells.append(.button(.init(title: "MoreInfoButton.Title".localized, type: .info, action: { [weak self] in
            self?.router.routeToMatrixInfo()
        })))
        return cells
    }
}

// MARK: - InfoScreenViewOutput

extension InfoPresenter: InfoScreenViewOutput {
    func onBackTapped() {
        router.routeBack()
    }
    
    func viewDidLoad() {
        state = .success(configureCellsModels())
    }
}

// MARK: - InfoTableAdapterOutput

extension InfoPresenter: InfoTableAdapterOutput {
    func itemSelected(atIndex index: Int) {
        guard let cell = cells[someIndex: index] else { return }
        switch cell {
        case .singlePhoto(_), .text(_), .button(_), .gameField(_):
            break
        }
    }
}
