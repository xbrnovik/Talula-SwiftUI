//
//  MeteoriteResponse.swift
//  Talula
//
//  Created by Diana Brnovik on 13/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import Foundation

struct MeteoriteResponse: Decodable {
    let meteoriteId: String
    let latitude: Double
    let longitude: Double
    let geotype: String?
    let mass: Float
    let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case meteoriteId = "id", latitude = "reclong", longitude = "reclat", geotype = "recclass", mass, name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        guard
            let lat = Double(try container.decode(String.self, forKey: .latitude)),
            let long = Double(try container.decode(String.self, forKey: .longitude))
        else {
            throw NSError(domain: ErrorDomain.dataDomain, code: ErrorCode.incorrectDataFormat, userInfo: nil)
        }
        meteoriteId = try container.decode(String.self, forKey: .meteoriteId)
        latitude = lat
        longitude = long
        geotype = try container.decode(String.self, forKey: .geotype)
        mass = Float(try container.decode(String.self, forKey: .mass)) ?? 0 // Float value cannot be nil, as well as mass of meteorite should not be 0 g - zero value is considered as unknown.
        name = try container.decode(String.self, forKey: .name)
    }
}
