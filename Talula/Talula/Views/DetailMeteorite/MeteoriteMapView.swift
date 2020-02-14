//
//  MeteoriteMapView.swift
//  Talula
//
//  Created by Diana Brnovik on 14/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import SwiftUI

struct MeteoriteMapView : View {
    
    @ObservedObject var meteorite: Meteorite
    
    var body: some View {
        MapView(latitude: meteorite.latitude,
                longitude: meteorite.longitude,
                annotationTitle: meteorite.name ?? "Unknown",
                annotationSubtitle: meteorite.geotype ?? "Unknown")
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(Text("Map"))
    }
    
}
