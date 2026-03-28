//
//  StackViewFactory.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 24.04.2022.
//

import UIKit

final class StackViewFactory {
    static func generate(
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: UIStackView.Distribution = .fillEqually,
        spacing: CGFloat = 10,
        views: [UIView]
    ) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.distribution = .fillEqually
        stackView.spacing = spacing
        return stackView
    }
}
