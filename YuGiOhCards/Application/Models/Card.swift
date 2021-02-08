//
//  CardRequested.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/01/20.
//

import Foundation
import Alamofire

struct Card: Codable {
    var name: String?
    var type: String?
    var atk: Int?
    var def: Int?
    var race: String?
    var desc: String?
    var card_images: [CardImages?]
    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case type
//        case atk
//        case def
//        case race
//        case description = "desc"
//        case cardImages = "card_images"
//    }
//
//    enum CardImagesKey: String, CodingKey {
//        case cardImage
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try? decoder.container(keyedBy: CodingKeys.self)
//
//        name = try? values?.decode(String.self, forKey: CodingKeys.name)
//        type = try? values?.decode(String.self, forKey: CodingKeys.type)
//        atk = try? values?.decode(Int.self, forKey: CodingKeys.atk)
//        def = try? values?.decode(Int.self, forKey: CodingKeys.def)
//        race = try? values?.decode(String.self, forKey: CodingKeys.race)
//        description = try? values?.decode(String.self, forKey: CodingKeys.description)
//
//        let cardImages = try values?.nestedContainer(keyedBy: CardImagesKey.self, forKey: .cardImages)
//        cardImage = try cardImages?.decode(URL.self, forKey: .cardImage)
//    }
}

struct CardImages: Codable {
    var image_url: URL?
}
