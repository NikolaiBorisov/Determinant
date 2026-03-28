//
//  AppLabel.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

enum AppLabelType: String {
    case winnerInfoLabel = " "
    case appTitle = "D E T E R M I N A N T"
    case firstPlayerLabel = "ChooseSignVC.Player1Label.Text"
    case welcomeVCLabel = "Welcome to the Game\n«Determinant»"
    case secondPlayerLabel = "ChooseSignVC.Player2Label.Text"
    case instruction = "Instruction"
    case player1 = "Player1: "
    case player2 = "Player2: "
    case result1 = ""
    case result2 = "  "
}

final class AppLabel: UILabel {
    
    // MARK: - Initialization
    
    init(
        type: AppLabelType,
        fontSize: CGFloat = 25,
        fontWeight: UIFont.Weight = .medium,
        textAlignment: NSTextAlignment = .center,
        isRounded: Bool = false
    ) {
        super.init(frame: .zero)
        
        configureSelf(
            ofType: type,
            fontSize: fontSize,
            fontWeight: fontWeight,
            textAlignment: textAlignment,
            isRounded: isRounded
        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError(AppConstants.NSCoder.fatalError)
    }
    
    // MARK: - Private Methods
    
    private func configureSelf(
        ofType type: AppLabelType,
        fontSize: CGFloat = 25,
        fontWeight: UIFont.Weight = .medium,
        textAlignment: NSTextAlignment = .center,
        isRounded: Bool = false
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = textAlignment
        numberOfLines = 0
        font = .getAvenirNext(ofSize: fontSize, weight: fontWeight)
        textColor = .white
        text = type.rawValue.localized
        if isRounded {
            roundCorners()
        }
    }
}
