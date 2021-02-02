//
//  File.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/01/27.
//

import Foundation

//struct Cards: Codable {
//    var count: Int
//    var all: [Card]
//
//    enum CodingKeys: String, CodingKey {
//      case count
//      case all = "results"
//    }
//}


struct CardsResponse: Codable {
    var data: [Card]?
}
