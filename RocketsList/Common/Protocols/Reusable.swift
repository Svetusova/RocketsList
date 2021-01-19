//
//  Reusable.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 18.01.21.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable  {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
