//
//  AboutView.swift
//  Talula
//
//  Created by Diana Brnovik on 14/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import SwiftUI

struct AboutView : View {
    let highMassLevel: String = Formatter.numberFormatter.localeRounded.string(from: Map.highMassLevel as NSNumber) ?? Map.highMassLevel.description
    let lowMassLevel: String = Formatter.numberFormatter.localeRounded.string(from: Map.lowMassLevel as NSNumber) ?? Map.lowMassLevel.description
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("This application shows the list of fallen meteorites on Earth since 2011 and also its count. The meteorites are sorted by their masses in descending order. Source data is obtained from NASA and it is updated periodically. In the detail of every fallen meteorite, the user can see its position on map.")
                          .lineLimit(nil)
                          .fixedSize(horizontal: false, vertical: true)
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            Image("BigMeteorite")
                                .resizable()
                                .scaledToFit()
                                .frame(width: IconSize.medium, height: IconSize.medium, alignment: .center)
                            Image("SmallMeteorite")
                                .resizable()
                                .scaledToFit()
                                .frame(width: IconSize.medium, height: IconSize.medium, alignment: .center)
                            Image("OtherMeteorite")
                                .resizable()
                                .scaledToFit()
                                .frame(width: IconSize.medium, height: IconSize.medium, alignment: .center)
                        }
                        VStack(alignment: .leading, spacing: 20) {
                          Text("This icon describes meteorites with mass value bigger than \(highMassLevel) g.")
                              .lineLimit(nil).fixedSize(horizontal: false, vertical: true)
                          Text("This icon describes with mass value smaller than \(highMassLevel) g and bigger than \(lowMassLevel) g.")
                              .lineLimit(nil).fixedSize(horizontal: false, vertical: true)
                          Text("This icon describes other types of meteorites.")
                              .lineLimit(nil).fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    Text("This application was implemented by Diana Brnovik.")
                        .font(.headline)
                        .fixedSize(horizontal: false, vertical: true)
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            Image("InformationGmail")
                                .resizable()
                                .scaledToFit()
                                .frame(width: IconSize.medium, height: IconSize.mini, alignment: .center)
                            Image("InformationLinkedIn")
                                .resizable()
                                .scaledToFit()
                                .frame(width: IconSize.medium, height: IconSize.mini, alignment: .center)
                        }
                        VStack(alignment: .leading, spacing: 20) {
                            Text("dia.brnovikova@gmail.com")
                                .font(.headline)
                            Text("Diana Brnovik")
                                .font(.headline)
                        }
                        .padding(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    Text("Icons")
                        .font(.title)
                    Text("This application uses free icons availables on certain websites. \nThe source of application icon is https://icons8.com/. \nThe source of other icons is https://www.flaticon.com/.")
                }
                .navigationBarTitle(Text("Information"))
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            }
        }
    }
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

