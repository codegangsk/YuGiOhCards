//
//  CardRequested.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/01/20.
//

import Foundation

struct CardRequested: Codable {
    var name: String
    var type: String
    var atk: Int
    var def: Int
    var race: String
    var description: String
    var cardImage: [URL]
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case atk
        case def
        case race
        case description = "desc"
        case cardImage = "card_images"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: CodingKeys.name)
        type = try values.decode(String.self, forKey: CodingKeys.type)
        atk = try values.decode(Int.self, forKey: CodingKeys.atk)
        def = try values.decode(Int.self, forKey: CodingKeys.def)
        race = try values.decode(String.self, forKey: CodingKeys.race)
        description = try values.decode(String.self, forKey: CodingKeys.description)
        cardImage = try values.decode([URL].self, forKey: CodingKeys.cardImage)
    }
}

struct CardsRequested: Codable {
    let results: [CardRequested]
}
