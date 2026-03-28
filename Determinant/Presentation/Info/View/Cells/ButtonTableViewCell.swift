//
//  ButtonTableViewCell.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 07.05.2022.
//

import UIKit

final class ButtonTableViewCell: PreparableTableCell {
    
    // MARK: - Private Properties
    
    private var viewModel: InfoModels.Cell?
    private var data: InfoModels.ButtonCellData?
    
    private lazy var containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        return $0
    }(UILabel())
    
    private lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = .white
        $0.backgroundColor = .clear
        $0.cornerRadius = 10
        return $0
    }(UILabel())
    
    // MARK: - Methods
    
    override func prepare(withViewModel viewModel: PreparableViewModel?) {
        guard let viewModel = viewModel as? InfoModels.Cell else { return }
        self.viewModel = viewModel
        switch viewModel {
        case .button(let data):
            self.data = data
            titleLabel.text = data.title
        default:
            break
        }
        prepareView()
    }
    
    // MARK: - Private Methods
    
    private func prepareView() {
        selectionStyle = .none
        contentView.superview?.backgroundColor = .black
        contentView.backgroundColor = .black
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        
        containerView.backgroundColor = .systemIndigo
        containerView.borderColor = .white
        containerView.borderWidth = 2
        containerView.cornerRadius = 10
        containerView.clipsToBounds = true
        
        prepareButton()
    }
    
    private func prepareButton() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
}
