//
//  AppStarter.swift
//  Talula
//
//  Created by Diana Brnovik on 14/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import SwiftUI

final class AppStarter {
    
    /// Application window.
    fileprivate var window: UIWindow
    /// Delegate for downloads.
    fileprivate var delegate: MeteoriteFetchedResultsControllerDelegate?
    /// App storage.
    fileprivate var storage: MeteoriteStorage?
    
    init(_ windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)
        self.window.rootViewController = hostingController()
        self.window.makeKeyAndVisible()
    }
    
    /// Returns main hosting view controller.
    func hostingController() -> UIViewController {
        let meteoriteModelContainer = MeteoriteModelContainer()
        self.delegate = MeteoriteFetchedResultsControllerDelegate(meteoriteModelContainer: meteoriteModelContainer)
        self.storage = MeteoriteStorage(delegate)
        meteoriteModelContainer.meteoriteModels = storage?.fetchedResultsController.fetchedObjects?.compactMap {
            MeteoriteModel(meteorite: $0)
        } ?? []
        return UIHostingController(rootView: MeteoriteListView().environmentObject(meteoriteModelContainer))
    }
}
