//
//  AlertPresentable.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 18.01.21.
//

import UIKit

protocol AlertPresentable {
    func showError(with message: String)
}

extension AlertPresentable where Self: UIViewController {
    
    func showError(with message: String) {
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
