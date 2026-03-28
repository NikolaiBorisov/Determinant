//
//  PageTextView.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

final class PageTextView: UITextView {
    
    // MARK: - Initialization
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        configureSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError(AppConstants.NSCoder.fatalError)
    }
    
    // MARK: - Private Methods
    
    private func configureSelf() {
        isEditable = false
        font = .getAvenirNext(ofSize: 24, weight: .medium)
        textColor = .white
        textAlignment = .center
        backgroundColor = .systemIndigo
    }
}
