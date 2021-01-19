//
//  String+DateFormatter.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 18.01.21.
//

import Foundation

extension String {
    func dateFormat(to: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatterGet.date(from: self) else {
            return self
        }

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = to
        
        return dateFormatterPrint.string(from: date)
    }
}
