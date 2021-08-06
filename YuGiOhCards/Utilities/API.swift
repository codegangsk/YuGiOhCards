//
//  API.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/08/06.
//

import Foundation
import Alamofire

class API {
    static let shared = API()
}

extension API {
    func call<T: Decodable>(url: String, for data: T.Type, completion: ((Result<T, Error>) -> Void)? = nil) {
        AF
            .request(url)
            .validate()
            .responseDecodable(of: data.self) { response in
                if let error = response.error {
                    completion?(.failure(error))
                }
                
                if let data = response.value {
                    completion?(.success(data))
                }
                
                completion?(.failure("Unknown Error"))
            }
    }
}

extension String: Error {

}
