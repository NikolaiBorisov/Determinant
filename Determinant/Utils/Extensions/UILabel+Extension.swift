//
//  UILabel+Extension.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.06.2021.
//

import UIKit

extension UILabel {
    func roundCorners(radius: CGFloat = 10, borderWidth: CGFloat = 2) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = UIColor.white.cgColor
    }
}
