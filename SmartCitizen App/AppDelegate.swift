//
//  AppDelegate.swift
//  SmartCitizen App
//
//  Created by Mahmoud Alsamman on 23/09/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainViewController = MainViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController =  mainViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

