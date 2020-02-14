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
                annotationTitle: meteorite.name ?? "",
                annotationSubtitle: meteorite.geotype ?? "")
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(Text("Map"))
    }
    
}

struct MeteoriteMapView_Previews : PreviewProvider {
    static var previews: some View {
        MeteoriteMapView(meteorite: Meteorite())
    }
}
