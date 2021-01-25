//
//  API.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/01/25.
//

import Foundation
class cardRequestedController {
    func fetchItems(matching query: [String: String], completion: @escaping ([CardRequested]?) -> Void) {
        let baseURL = URL(string: "https://db.ygoprodeck.com/api/v7/cardinfo.php")!
        
        guard let url = baseURL.withQueries(query) else {
            completion(nil)
            print("Unable to build URL with supplied queries.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
                   let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                    print(String(decoding: jsonData, as: UTF8.self))
                } else {
                    print("json data malformed")
                }
            }
            
            guard let data = data,
                  let cardsRequested = try? JSONDecoder().decode(CardsRequested.self, from: data)
            else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
                return
            }

            completion(cardsRequested.results)
        }
        task.resume()
    }
}
