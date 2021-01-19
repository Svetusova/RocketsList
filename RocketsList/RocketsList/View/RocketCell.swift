//
//  RocketCell.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 17.01.21.
//

import UIKit
import Kingfisher

class RocketCell: UITableViewCell, Reusable {

    @IBOutlet weak var badge: UIView!
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var viewModel: RocketDetailsViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        translatesAutoresizingMaskIntoConstraints = true
        
        setupUI()
    }

    func setupUI() {
        badge.layer.cornerRadius = badge.frame.width / 2
        badge.clipsToBounds = true
    }
    
    func update() {
        nameLabel.text = viewModel?.name
        
        if let imageUrl = viewModel?.image, let url = URL(string: imageUrl) {
            rocketImageView.kf.setImage(with: url)
        }
         
        badge.backgroundColor = viewModel?.badgeColor
        dateLabel.text = viewModel?.date
    }
}
