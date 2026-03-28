//
//  InfoModels.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 06.05.2022.
//

import UIKit

enum InfoModels {
    
    // MARK: - Nested Types
    
    enum State {
        case `default`
        case success([PreparableViewModel])
        case failure(Error)
    }
    
    enum Cell: PreparableViewModel {
        case singlePhoto(PhotoCellData)
        case text(TextCellData)
        case gameField(GameFieldCellData)
        case button(ButtonCellData)
        
        var cellId: String {
            switch self {
            case .singlePhoto(_):
                return PhotoTableViewCell.identifier
            case .text(_):
                return TextTableViewCell.identifier
            case .button(_):
                return ButtonTableViewCell.identifier
            case .gameField(_):
                return GameFieldTableViewCell.identifier
            }
        }
    }
    
    struct PhotoCellData {
        let image: UIImage
    }
    
    struct TextCellData {
        let text: String
        var color: UIColor? = .white
        var isGameActive: Bool = false
    }
    
    struct GameFieldCellData {
        let title: String
        var delegate: GameFieldDelegate?
    }
    
    enum ButtonCellType {
        case result
        case start
        case info
    }
    
    struct ButtonCellData {
        let title: String
        let type: ButtonCellType
        var action: (() -> Void)?
    }
}
