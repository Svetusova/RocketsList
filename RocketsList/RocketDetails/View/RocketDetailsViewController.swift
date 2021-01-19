//
//  RocketDetailsViewController.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 18.01.21.
//

import UIKit
import SwiftUI

class RocketDetailsViewController: UIViewController {
    
    var viewModel: RocketDetailsViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    fileprivate func setup() {
        guard let viewModel = viewModel else {
            return
        }
        
        let contentView = UIHostingController(rootView: RocketDetailsView(viewModel: viewModel))
        
        addChild(contentView)
        view.addSubview(contentView.view)
        
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
