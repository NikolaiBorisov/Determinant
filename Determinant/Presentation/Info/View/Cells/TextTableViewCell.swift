//
//  TextTableViewCell.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 06.05.2022.
//

import UIKit

final class TextTableViewCell: PreparableTableCell {
    
    // MARK: - Private Properties
    
    private var viewModel: InfoModels.Cell?
    private var data: InfoModels.TextCellData?
    
    private lazy var label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.textAlignment = .justified
        $0.font = .getAvenirNext(ofSize: 20, weight: .medium)
        return $0
    }(UILabel())
    
    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if data?.isGameActive == true {
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0))
        }
    }
    
    // MARK: - Methods
    
    override func prepare(withViewModel viewModel: PreparableViewModel?) {
        guard let viewModel = viewModel as? InfoModels.Cell else { return }
        self.viewModel = viewModel
        switch viewModel {
        case .text(let data):
            self.data = data
            if data.isGameActive {
                updateGameView()
            }
        case .singlePhoto(_), .button(_), .gameField(_):
            break
        }
        label.text = data?.text
        prepareView()
    }
    
    // MARK: - Private Methods
    
    private func updateGameView() {
        contentView.superview?.backgroundColor = .black
        contentView.setupBorder(withColor: data?.color ?? .white)
        label.textAlignment = .center
    }
    
    private func prepareView() {
        selectionStyle = .none
        contentView.backgroundColor = .black
        contentView.addSubview(label)
        
        prepareLabel()
    }
    
    private func prepareLabel() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
