//
//  CardRequested.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/01/20.
//

import Foundation
import Alamofire

struct Card: Decodable {
    var name: String
    var type: String
    var atk: Int
    var def: Int
    var race: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case atk
        case def
        case race
        case description = "desc"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: CodingKeys.name)
        type = try values.decode(String.self, forKey: CodingKeys.type)
        atk = try values.decode(Int.self, forKey: CodingKeys.atk)
        def = try values.decode(Int.self, forKey: CodingKeys.def)
        race = try values.decode(String.self, forKey: CodingKeys.race)
        description = try values.decode(String.self, forKey: CodingKeys.description)
    }
}    


