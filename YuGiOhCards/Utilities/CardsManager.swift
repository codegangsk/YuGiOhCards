//
//  CardsManager.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/08/06.
//

import Foundation

/*class CardsManager {
    static let shared = CardsManager()
    
    func fetchCards() {
//        AF
//            .request("https://db.ygoprodeck.com/api/v7/cardinfo.php?")
//            .validate()
//            .responseDecodable(of: CardsResponse.self) { [weak self] (response) in
//                guard let self = self,
//                      let cards = response.value?.data
//                else { return }
            
//                SearchCardTableViewController.cards = cards
//            }
        
        API.shared.call(url: "https://db.ygoprodeck.com/api/v7/cardinfo.php?", for: CardsResponse.self) { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .success(let cardsResponse):
                break
            case .failure(let error):
                break
            }
        }
    }
} */
