//
//  ResultsModels.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.05.2022.
//

import UIKit

enum ResultsModels {
    
    // MARK: - Nested Types
    
    enum State {
        case `default`
        case success([PreparableViewModel])
        case failure(Error)
    }
    
    enum Cell: PreparableViewModel {
        case text(TextCellData)
        
        var cellId: String {
            switch self {
            case .text(_):
                return ResultsTableViewCell.identifier
            }
        }
    }
    
    struct TextCellData {
        let player1Name: String
        let player2Name: String
        let result1: String
        let result2: String
        let date: Date?
    }
}
