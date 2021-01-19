//
//  RocketDetailsViewModel.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 18.01.21.
//

import Foundation
import UIKit

class RocketDetailsViewModel {
    
    var rocket: Rocket
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
    
    var name: String {
        get {
            return rocket.name ?? ""
        }
    }
    
    var date: String {
        get {
            return rocket.firstFlightDate?.dateFormat(to: "dd MMM, yyy") ?? ""
        }
    }
    
    var image: String {
        get {
            guard let rocketImage = rocket.images?[0] else {
                return ""
            }
            
            return rocketImage
        }
    }
    
    var badgeColor: UIColor {
        get {
            guard let successRate = rocket.successRate else {
                return UIColor.red
            }
            
            return successRate < 30 ? UIColor.red : (successRate < 60 ? UIColor.orange : Colors.greenBadge)
        }
    }
    
    var country: String {
        get {
            return rocket.country ?? ""
        }
    }
    
    var description: String {
        get {
            return rocket.description ?? ""
        }
    }
    
    var activity: String {
        get {
            return rocket.active ?? false ? "(active)" : "(inactive)"
        }
    }
    
    var costInDollars: String {
        get {
            return (rocket.cost?.formatPoints())! + " $"
        }
    }
    
    var wikiUrl: String {
        get {
            return rocket.wikipedia ?? ""
        }
    }
    
    var imageUrl: URL? {
        get {
            return URL(string: image) ?? nil
        }
    }
}

