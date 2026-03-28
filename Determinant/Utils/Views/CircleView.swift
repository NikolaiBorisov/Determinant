//
//  CircleView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

final class CircleView: UIImageView {
    
    // MARK: - Nested Types
    
    struct Constants {
        static let circleSize: CGFloat = 30
        static let circleCornerRadius: CGFloat = circleSize / 2
    }
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        configureSelf()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureSelf() {
        backgroundColor = .white
        layer.cornerRadius = Constants.circleCornerRadius
        alpha = 0
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Constants.circleSize),
            widthAnchor.constraint(equalToConstant: Constants.circleSize)
        ])
    }
}
