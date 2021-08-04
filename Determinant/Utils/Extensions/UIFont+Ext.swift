//
//  UIFont+Ext.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 19.06.2021.
//

import UIKit

extension UIFont {
    
    static var navBarFont: UIFont {
        return UIFont(name: "Avenir Next Medium", size: 25) ?? UIFont.systemFont(ofSize: 25)
    }
    
    static var matrixLabelFont: UIFont {
        return UIFont(name: "Avenir Next Medium", size: 18) ?? UIFont.systemFont(ofSize: 18)
    }
    
    static var labelFont: UIFont {
        return UIFont(name: "Avenir Next Medium", size: 25) ?? UIFont.systemFont(ofSize: 25)
    }
    
    static var buttonFont: UIFont {
        return UIFont(name: "Avenir Next Medium", size: 25) ?? UIFont.systemFont(ofSize: 25)
    }
    
    static var pageVCFont: UIFont {
        return UIFont(name: "Avenir Next Medium", size: 24) ?? UIFont.systemFont(ofSize: 24)
    }
    
    static var tfFont: UIFont {
        return UIFont(name: "Avenir Next Medium", size: 70) ?? UIFont.systemFont(ofSize: 70)
    }
    
    static var signButtonFont: UIFont {
        return UIFont(name: "Menlo Bold", size: 45) ?? UIFont.systemFont(ofSize: 45)
    }
}
