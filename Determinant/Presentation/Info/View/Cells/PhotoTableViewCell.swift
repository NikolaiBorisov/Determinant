//
//  PhotoTableViewCell.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 06.05.2022.
//

import UIKit

final class PhotoTableViewCell: PreparableTableCell {
    
    // MARK: - Private Properties
    
    private var viewModel: InfoModels.Cell?
    private var data: InfoModels.PhotoCellData?
    
    private lazy var imageViewContainer: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    // MARK: - Methods
    
    override func prepare(withViewModel viewModel: PreparableViewModel?) {
        guard let viewModel = viewModel as? InfoModels.Cell else { return }
        self.viewModel = viewModel
        switch viewModel {
        case .singlePhoto(let data):
            self.data = data
        case .text(_), .button(_), .gameField(_):
            break
        }
        imageViewContainer.image = data?.image
        prepareView()
    }
    
    // MARK: - Private Methods
    
    private func prepareView() {
        selectionStyle = .none
        contentView.backgroundColor = .black
        contentView.addSubview(imageViewContainer)
        contentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        prepareImageView()
    }
    
    private func prepareImageView() {
        NSLayoutConstraint.activate([
            imageViewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageViewContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageViewContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageViewContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
