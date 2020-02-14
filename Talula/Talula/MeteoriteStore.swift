//
//  MeteoriteStore.swift
//  Talula
//
//  Created by Diana Brnovik on 13/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import SwiftUI
import Combine

class MeteoriteStore: ObservableObject {
        
    @Published var meteoriteModels: [MeteoriteModel] = []
    
}
