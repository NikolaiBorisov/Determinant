//
//  AppButton.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

final class AppButton: UIButton {
    
    // MARK: - Nested Types
    
    enum ButtonType: String {
        case instruction = "InstructionButton.Title"
        case game = "GameButton.Title"
        case matrixInfo = "MoreInfoButton.Title"
        case numberpadButton = ""
        case seeMatrix = "See the Matrix"
        case startOverButton = "Start Over"
    }
    
    // MARK: - Initialization
    
    init(
        type: ButtonType,
        bgColour: UIColor = .systemIndigo,
        alpha: CGFloat = 1,
        isEnabled: Bool = true
    ) {
        super.init(frame: .zero)
        setupSelf(type: type, bgColour: bgColour, alpha: alpha, isEnabled: isEnabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError(AppConstants.NSCoder.fatalError)
    }
    
    // MARK: - Actions
    
    @objc private func onButtonTapped() {
        pulsate()
    }
    
    // MARK: - Private Methods
    
    private func setupSelf(
        type: ButtonType,
        bgColour: UIColor = .systemIndigo,
        alpha: CGFloat = 1,
        isEnabled: Bool = true
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.buttonFont
        backgroundColor = bgColour.withAlphaComponent(alpha)
        self.isEnabled = isEnabled
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        setTitle(type.rawValue.localized, for: .normal)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
