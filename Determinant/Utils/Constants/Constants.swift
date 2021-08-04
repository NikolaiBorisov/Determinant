//
//  Constants.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 18.06.2021.
//

import UIKit

enum Constants {
  
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
  
  enum TabBarItem {
    static let item0Title = "Game"
    static let item1Title = "Info"
  }
  
  enum ButtonTitle {
    static let plusButtonTitle = "+"
    static let minusButtonTitle = "-"
  }
  
  enum LabelContent {
    static let matrixLabelText = "1. Main Diagonal =\n(a11a22a33)+(a12a23a31)+(a13a21a32)\n\n2. Secondary Diagonal =\n(a13a22a31) - (a12a21a33) - (a11a23a32)\n\n3. Determinant =\nMain Diagonal - Secondary Diagonal"
  }
  
  enum URL {
    static let matrixURL = "https://nauchniestati.ru/spravka/opredelitel-matricy/"
  }
  
  enum Gif {
    static let name = "Albert"
  }
  
}
