//
//  Date+Extension.swift
//  Determinant
//
//  Created by NIKOLAI BORISOV on 09.05.2022.
//

import Foundation

extension Date {
    static func getFormattedDateFrom(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyy, HH:mm"
        return dateFormatter.string(from: date)
    }
}
