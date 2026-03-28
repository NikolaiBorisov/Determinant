//
//  AppConstants.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

enum AppImage {
    static let matrix = UIImage(named: "matrix")
    static let matrix_3x3 = UIImage(named: "matrix_3x3")
    static let icon_close = UIImage(systemName: "multiply.circle")?.withRenderingMode(.alwaysTemplate)
    static let info_circle = UIImage(systemName: "info.circle")
    static let game_controller = UIImage(systemName: "gamecontroller")
    static let doc_plaintext = UIImage(systemName: "doc.plaintext")
    static let back_button = UIImage(systemName: "chevron.backward")
    static let main_diagonal = UIImage(named: "main_diagonal")
    static let secondary_diagonal = UIImage(named: "secondary_diagonal")
}

enum AppURL {
    static let matrixURL = "https://nauchniestati.ru/spravka/opredelitel-matricy/"
}

enum AppConstants {
    
    enum Image {
        static let logoImageName = "number"
        static let backButtonImage = "arrowshape.turn.up.left.fill"
        static let gameVCIcon = "gamecontroller"
        static let infoVCIcon = "info.circle"
        static let matrixImage = "Matrix3x3"
    }
    
    enum NSCoder {
        static let fatalError = "init(coder:) has not been implemented"
    }
    
    enum VCTitle {
        static let signVCTitle = "+Choose the Sign-"
        static let infoVCTitle = "Matrix 3x3"
    }
    
    enum LabelContent {
        static let matrixLabelText = "1. Main Diagonal =\n(a11a22a33)+(a12a23a31)+(a13a21a32)\n\n2. Secondary Diagonal =\n(a13a22a31) - (a12a21a33) - (a11a23a32)\n\n3. Determinant =\nMain Diagonal - Secondary Diagonal"
    }
    
    enum Gif {
        static let name = "Albert"
    }
}
