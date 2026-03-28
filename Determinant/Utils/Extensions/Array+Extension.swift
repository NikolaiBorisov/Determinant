//
//  Array+Extension.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 07.05.2022.
//

import Foundation

extension Array {
    subscript(someIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else { return nil }
        return self[index]
    }
}
