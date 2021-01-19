//
//  Api.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 17.01.21.
//

import Foundation

struct Request {
    
   struct Api {
        static let scheme = "https://"
        static let spaceX = "api.spacexdata.com/v4/"
    }
    
    struct Path {
        static let rockets = "rockets"
    }
    
    struct Parameters {
        static let id = "id"
    }
}
