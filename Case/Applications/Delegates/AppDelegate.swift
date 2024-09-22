//
//  AppDelegate.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    var appRouter : AppRouter?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupApp()
        return true
    } 
    func setupApp() {
        window = UIWindow(frame: UIScreen.main.bounds)
        appRouter = AppRouter(window: window!)
        appRouter?.startLaunch()
        NetworkConnection.shared.startMonitoring()
    }
}

