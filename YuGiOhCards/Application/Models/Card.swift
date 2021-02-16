//
//  CardRequested.swift
//  YuGiOhCards
//
//  Created by Sophie Kim on 2021/01/20.
//

import Foundation
import Alamofire

struct Card: Codable, Equatable {
    var name: String?
    var type: String?
    var atk: Int?
    var def: Int?
    var race: String?
    var desc: String?
    var card_images: [CardImages?]
}

struct CardImages: Codable, Equatable {
    var image_url: URL?
}
