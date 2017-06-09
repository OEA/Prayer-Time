//
//  AppDelegate.swift
//  Prayer Time
//
//  Created by Omer Emre Aslan on 10/06/2017.
//  Copyright © 2017 Omer Emre Aslan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let screenBounds = UIScreen.main.bounds
        
        self.window = UIWindow(frame: screenBounds)
        
        let viewController = UIViewController()
        
        self.window!.rootViewController = viewController
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        
        return true
    }

}

