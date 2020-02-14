//
//  SceneDelegate.swift
//  Talula
//
//  Created by Diana Brnovik on 13/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        let window = UIWindow(windowScene: windowScene)
        let meteoriteStore = MeteoriteStore()
        let delegate = MeteoriteFetchedResultsControllerDelegate(meteoriteStore: meteoriteStore)
        let storage = MeteoriteStorage(delegate)
        meteoriteStore.meteoriteModels = storage.fetchedResultsController.fetchedObjects?.compactMap {
            MeteoriteModel(meteorite: $0)
        } ?? []
        window.rootViewController = UIHostingController(rootView: MeteoriteListView().environmentObject(meteoriteStore))
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.taskScheduler?.scheduleAppRefresh()
    }
}

