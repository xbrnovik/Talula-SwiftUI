//
//  Meteorite.swift
//  Talula
//
//  Created by Diana Brnovik on 13/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import SwiftUI
import Combine

class Meteorite: ObservableObject, Identifiable {
        
    let meteoriteId: String
    let latitude: Double
    let longitude: Double
    let geotype: String?
    let mass: Float
    let name: String?
    
    @Published var image: UIImage?
    
    init() {
        meteoriteId = "123"
        longitude = 5.915807
        latitude = 45.572353
        geotype = "type"
        mass = 123.0
        name = "Chambéry"
        
        image = nil
    }
    
}
