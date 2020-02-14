//
//  AppDelegate.swift
//  Talula
//
//  Created by Diana Brnovik on 13/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    /// Manager of data downloads tasks.
    var taskScheduler: TaskScheduler?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.taskScheduler = TaskScheduler()
        self.taskScheduler?.foregroundRun()
        self.taskScheduler?.registerTask()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: Name.configuration, sessionRole: connectingSceneSession.role)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        self.taskScheduler?.foregroundRun()
    }
}

