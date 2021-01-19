//
//  Rocket.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 17.01.21.
//

import Foundation

struct Rocket: Decodable {
    let id: String
    let name: String?
    let active: Bool?
    let country: String?
    let description: String?
    let successRate: Int?
    let firstFlightDate: String?
    let cost: Int?
    let wikipedia: String?
    let images: [String]?
    
    init(id: String,
         name: String?,
         active: Bool?,
         country: String?,
         description: String?,
         successRate: Int?,
         firstFlight: String?,
         cost: Int?,
         wikipedia: String?,
         images: [String]?) {
        self.id = id
        self.name = name
        self.active = active
        self.country = country
        self.description = description
        self.successRate = successRate
        self.firstFlightDate = firstFlight
        self.cost = cost
        self.wikipedia = wikipedia
        self.images = images
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case active
        case country
        case description
        case successRate = "success_rate_pct"
        case firstFlightDate = "first_flight"
        case cost = "cost_per_launch"
        case wikipedia
        case images = "flickr_images"
    }
}
