//
//  RocketsListViewModel.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 18.01.21.
//

import Foundation

enum RocketsError: Error {
    case noRocketFound
    
    var localizedDescription: String {
        return "No such rocket found."
    }
}

class RocketsListViewModel {
    
    private var networkService: NetworkServiceProtocol?
    
    private lazy var rockets = [Rocket]()
    
    var allRockets: [Rocket] {
        return rockets
    }
    
    var rocketsCount: Int {
        return rockets.count
    }
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchRockets(completeHandler: @escaping (Bool, Error?) -> Void) {
        let url = RocketsApi.rocketsPath
        
        networkService?.fetchData(of: [Rocket].self, from: url) { [weak self] result in
            switch result {
                case .success(let rocketsResponse):
                    self?.rockets = rocketsResponse
                    
                    if self?.rockets.count == 0 {
                        completeHandler(false, RocketsError.noRocketFound)
                        
                        return
                    }
                    
                    completeHandler(true, nil)
                case .failure(let error):
                    completeHandler(false, error)
            }
        }
    }
    
    func rocket(by index: Int) -> Rocket? {
        guard index < rockets.count else {
            return nil
        }
        
        return rockets[index]
    }
}
