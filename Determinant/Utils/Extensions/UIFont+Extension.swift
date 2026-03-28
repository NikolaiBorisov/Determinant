//
//  UIFont+Extension.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.06.2021.
//

import UIKit

extension UIFont {
    
    static var navBarFont: UIFont {
        UIFont(name: "Avenir Next Medium", size: 25) ?? UIFont.systemFont(ofSize: 25)
    }
    
    static var matrixLabelFont: UIFont {
        UIFont(name: "Avenir Next Medium", size: 18) ?? UIFont.systemFont(ofSize: 18)
    }
    
    static var labelFont: UIFont {
        UIFont(name: "Avenir Next Medium", size: 25) ?? UIFont.systemFont(ofSize: 25)
    }
    
    static var buttonFont: UIFont {
        UIFont(name: "Avenir Next Medium", size: 25) ?? UIFont.systemFont(ofSize: 25)
    }
    
    static var pageVCFont: UIFont {
        UIFont(name: "Avenir Next Medium", size: 24) ?? UIFont.systemFont(ofSize: 24)
    }
    
    static var tfFont: UIFont {
        UIFont(name: "Avenir Next Medium", size: 70) ?? UIFont.systemFont(ofSize: 70)
    }
    
    static var signButtonFont: UIFont {
        UIFont(name: "Menlo Bold", size: 45) ?? UIFont.systemFont(ofSize: 45)
    }
    
    static func getAvenirNext(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        avenirNext(ofSize: size, weight: weight)
    }
    
    static func avenirNext(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        switch weight {
        case .medium:
            return UIFont(name: "Avenir Next Medium", size: size) ?? .systemFont(ofSize: size, weight: weight)
        case .bold:
            return UIFont(name: "Avenir Next Bold", size: size) ?? .systemFont(ofSize: size, weight: weight)
        default:
            return UIFont(name: "Avenir Next Regular", size: size) ?? .systemFont(ofSize: size, weight: weight)
        }
    }
}
