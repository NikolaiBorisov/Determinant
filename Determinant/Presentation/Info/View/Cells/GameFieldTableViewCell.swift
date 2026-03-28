//
//  GameFieldTableViewCell.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 28.05.2022.
//

import UIKit

protocol GameFieldTableViewCellDelegate: AnyObject {
    func textFieldTapped(sender: UITextField)
}

final class GameFieldTableViewCell: PreparableTableCell {
    
    // MARK: - Private Properties
    
    weak var delegate: GameFieldTableViewCellDelegate?
    
    private var viewModel: InfoModels.Cell?
    private var data: InfoModels.GameFieldCellData?
    private lazy var gameFieldView = GameFieldView()
    
    // MARK: - Methods
    
    override func prepare(withViewModel viewModel: PreparableViewModel?) {
        guard let viewModel = viewModel as? InfoModels.Cell else { return }
        self.viewModel = viewModel
        switch viewModel {
        case .gameField(let data):
            self.data = data
            gameFieldView.clearFields()
            gameFieldView.delegate = self
        case .singlePhoto(_), .text(_), .button(_):
            break
        }
        prepareView()
    }
    
    // MARK: - Private Methods
    
    private func prepareView() {
        selectionStyle = .none
        
        prepareContentView()
        gameFieldView.setupLayout(onView: self)
    }
    
    private func prepareContentView() {
        contentView.backgroundColor = .black
        contentView.addSubview(gameFieldView)
        contentView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}

extension GameFieldTableViewCell: GameFieldDelegate {
    func textFieldTapped(sender: UITextField) {
        delegate?.textFieldTapped(sender: sender)
    }
}
