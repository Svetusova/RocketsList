//
//  Int+Formatter.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 18.01.21.
//

import Foundation

extension Int {
    func formatPoints() -> String {
        let number = Double(self)

        if number >= 1000, number <= 999999 {
            return String(format: "%.1fk", locale: Locale.current, number / 1000).replacingOccurrences(of: ".0", with: "")
        }

        if number > 999999 {
            return String(format: "%.1fm", locale: Locale.current, number / 1000000).replacingOccurrences(of: ".0", with: "")
        }

        return String(self)
    }
}
