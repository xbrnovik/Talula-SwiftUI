//
//  Meteorite.swift
//  Talula
//
//  Created by Diana Brnovik on 13/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import SwiftUI
import Combine

class MeteoriteModel: ObservableObject, Identifiable {
        
    var meteorite: Meteorite
    var id: String {
        meteorite.meteoriteId!
    }
    var image: Image {
        if meteorite.mass >= 10000 {
            return Icon.meteoriteBig.image
        } else if meteorite.mass >= 1000 {
            return Icon.meteoriteSmall.image
        } else {
            return Icon.meteoriteOther.image
        }
    }
    var massFormatted: String? {
        guard
            let massNumber = (round(1000 * meteorite.mass) / 1000) as NSNumber?,
            let massString = Formatter.numberFormatter.localeDecimal.string(from: massNumber),
            massNumber != 0
        else {
            return nil
        }
        return "\(massString) g"
    }
    
    init(meteorite: Meteorite) {
        self.meteorite = meteorite
    }
    
    
}
