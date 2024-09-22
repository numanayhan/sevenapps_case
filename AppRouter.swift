//
//  AppRouter.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import Foundation
import UIKit
public class DefaultNavigation: UINavigationController {
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return  .default
    }
}

class AppRouter {
    private let window : UIWindow?
    init(window: UIWindow ) {
        self.window = window
    }
    func startLaunch() {
        window!.rootViewController = DefaultNavigation(rootViewController: Launch())
        window!.makeKeyAndVisible()
    } 
}
