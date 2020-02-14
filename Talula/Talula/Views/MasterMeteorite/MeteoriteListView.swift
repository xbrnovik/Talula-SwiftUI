//
//  ContentView.swift
//  Talula
//
//  Created by Diana Brnovik on 13/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import SwiftUI

struct MeteoriteListView: View {
    @EnvironmentObject var meteoriteModelContainer: MeteoriteModelContainer
    @State var isPresentingModal: Bool = false
    
    /// Prevents from showing empty lines in list.
    init() {
        UITableView.appearance().tableFooterView = UIView()
    }

    var body: some View {
        NavigationView {
            List {
                Section(footer: ListFooter()) {
                    ForEach(meteoriteModelContainer.meteoriteModels) { model in
                        MeteoriteRow(model: model)
                    }
                }
            }
            .environment(\.defaultMinListRowHeight, RowSize.small)
            .navigationBarItems(trailing: infoButton)
            .navigationBarTitle(Text("Meteorites"))
        }
        .listStyle(GroupedListStyle())
    }
    
    private var infoButton: some View {
        Button(action: {
            self.isPresentingModal = true
        }) {
            Image(systemName: "info.circle")
            .font(.title)
        }.sheet(isPresented: $isPresentingModal) {
            AboutView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeteoriteListView()
    }
}

struct ListFooter: View {
    @EnvironmentObject var meteoriteModelContainer: MeteoriteModelContainer
    
    var body: some View {
        Text("\(meteoriteModelContainer.meteoriteModels.count) meteorites")
    }
}
