//
//  LogoImageView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

final class LogoImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        configureSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError(AppConstants.NSCoder.fatalError)
    }
    
    private func configureSelf() {
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = .white
        fadeTransition()
        image = AppImage.matrix
    }
}
