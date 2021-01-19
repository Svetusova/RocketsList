//
//  NetworkService.swift
//  RocketsList
//
//  Created by Svetlana Matusova on 17.01.21.
//

import Foundation
import Alamofire

typealias result<T> = (Result<T, Error>) -> Void

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(of type: T.Type, from url: String, completeHandler: @escaping result<T>)
}

class NetworkService: NetworkServiceProtocol {
    func fetchData<T: Decodable>(of type: T.Type, from url: String, completeHandler: @escaping result<T>) {
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: T.self) {response in
                switch response.result {
                    case .success(let result):
                        completeHandler(.success(result))
                        
                    case .failure(let error):
                        completeHandler(.failure(error))
            }
        }
    }
}
