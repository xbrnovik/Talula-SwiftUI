//
//  MeteoriteRow.swift
//  Talula
//
//  Created by Diana Brnovik on 13/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import SwiftUI

struct MeteoriteRow : View {
    @ObservedObject var model: MeteoriteModel
    
    var body: some View {
        NavigationLink(destination: MeteoriteMapView(meteorite: model.meteorite)) {
            HStack(alignment: .center) {
                model.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: IconSize.medium, height: IconSize.medium, alignment: .center)
                VStack(alignment: .leading) {
                    Text(model.meteorite.name ?? "Unknown")
                        .lineLimit(nil)
                        .font(.headline)
                    Text(model.massFormatted ?? "Unknown")
                        .lineLimit(nil)
                        .font(.subheadline)
                }
            }
        }
    }
}

struct MeteoriteRow_Previews: PreviewProvider {
    static var previews: some View {
        MeteoriteRow(model: MeteoriteModel(meteorite: Meteorite()))
    }
}
