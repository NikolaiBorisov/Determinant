//
//  DeterminantTextField.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.06.2021.
//

import UIKit

final class DeterminantTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        font = UIFont.tfFont
        textAlignment = .center
        backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError(AppConstants.NSCoder.fatalError)
    }
}
