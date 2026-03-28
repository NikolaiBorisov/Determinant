//
//  PlayerSignButton.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.06.2021.
//

import UIKit

final class PlayerSignButton: UIButton {
    
    enum PlayerSignButtonType: String {
        case buttonPlus = "+"
        case buttonMinus = "-"
    }
    
    init(type: PlayerSignButtonType) {
        super.init(frame: .zero)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.signButtonFont
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = .darkGray
        setTitle(type.rawValue, for: .normal)
        widthAnchor.constraint(equalToConstant: 50).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError(AppConstants.NSCoder.fatalError)
    }
}
