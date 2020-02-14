//
//  MeteoriteRow.swift
//  Talula
//
//  Created by Diana Brnovik on 13/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import SwiftUI

struct MeteoriteRow : View {
    
    @ObservedObject var meteorite: Meteorite
    
    var body: some View {
        NavigationLink(destination: MeteoriteMapView(meteorite: meteorite)) {
            HStack(alignment: .center) {
                Image("BigMeteorite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIIconSize.medium, height:UIIconSize.medium, alignment: .center)
                VStack(alignment: .leading) {
                    Text(meteorite.name ?? "")
                        .lineLimit(nil)
                        .font(.headline)
                    Text("\(meteorite.mass) g" ?? "")
                        .lineLimit(nil)
                        .font(.subheadline)
                }
            }
        }
    }
    
}

