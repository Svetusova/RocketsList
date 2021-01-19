//
//  NetworkServiceMock.swift
//  RocketsListTests
//
//  Created by Svetlana Matusova on 18.01.21.
//

import Foundation
import Alamofire
@testable import RocketsList

final class NetworkServiceMock: NetworkServiceProtocol {

    var networkClientError = false
    
    var resourse = "rockets"

    enum NetworkServiceError: Error {
        case generic
        case invalidData
    }
    
    func fetchData<T: Decodable>(of type: T.Type, from url: String, completeHandler: @escaping result<T>) {
        
        if networkClientError {
            completeHandler(.failure(NetworkServiceError.generic))
        } else {
            let bundle = Bundle(for: NetworkServiceMock.self)

            if let path = bundle.path(forResource: resourse, ofType: "json") {
                let url = URL(fileURLWithPath: path)

                do {
                    let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
                    let decodedData: T = try JSONDecoder().decode(T.self, from: data)

                    completeHandler(.success(decodedData))
                } catch {
                    completeHandler(.failure(NetworkServiceError.invalidData))
                }
            }
        }
    }
}
