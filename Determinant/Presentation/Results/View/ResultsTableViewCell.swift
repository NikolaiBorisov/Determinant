//
//  ResultsTableViewCell.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.05.2022.
//

import UIKit

final class ResultsTableViewCell: PreparableTableCell {
    
    // MARK: - Private Properties
    
    private var viewModel: ResultsModels.Cell?
    private var data: ResultsModels.TextCellData?
    
    private lazy var player1label = AppLabel(type: .player1, fontSize: 20, textAlignment: .left)
    private lazy var player2label = AppLabel(type: .player2, fontSize: 20, textAlignment: .left)
    private lazy var nameStackView = StackViewFactory.generate(
        views: [player1label, player2label]
    )
    
    private lazy var result1label = AppLabel(type: .player1, fontSize: 20, textAlignment: .right)
    private lazy var result2label = AppLabel(type: .player2, fontSize: 20, textAlignment: .right)
    private lazy var resultStackView = StackViewFactory.generate(
        views: [result1label, result2label]
    )
    
    private lazy var mainStackView = StackViewFactory.generate(
        axis: .horizontal,
        distribution: .fillProportionally,
        views: [nameStackView, resultStackView]
    )
    
    private lazy var dateLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.textAlignment = .justified
        $0.font = .getAvenirNext(ofSize: 20, weight: .medium)
        return $0
    }(UILabel())
    
    
    // MARK: - Methods
    
    override func prepare(withViewModel viewModel: PreparableViewModel?) {
        guard let viewModel = viewModel as? ResultsModels.Cell else { return }
        self.viewModel = viewModel
        switch viewModel {
        case .text(let data):
            self.data = data
        }
        player1label.text = "Player1: \(data?.player1Name ?? "")"
        player2label.text = "Player2: \(data?.player2Name ?? "")"
        result1label.text = data?.result1
        result2label.text = data?.result2
        dateLabel.text = "Date: \(Date.getFormattedDateFrom(date: data?.date ?? Date()))"
        prepareView()
    }
    
    // MARK: - Private Methods
    
    private func prepareView() {
        selectionStyle = .none
        contentView.backgroundColor = .black
        contentView.addSubview(dateLabel)
        contentView.addSubview(mainStackView)
        
        prepareLabel()
    }
    
    private func prepareLabel() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
            
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
