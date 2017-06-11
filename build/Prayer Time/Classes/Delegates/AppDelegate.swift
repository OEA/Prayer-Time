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
        
        setupWindow()
        setupViewController()
        
        return true
    }
    
    private func setupWindow() {
        let screenBounds = UIScreen.main.bounds
        self.window = UIWindow(frame: screenBounds)
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
    }
    
    private func setupViewController() {
        
        let userDefaults = UserDefaults.standard
        
//        let city = userDefaults.string(forKey: "city")
        let county = userDefaults.string(forKey: "county")
//        let country = userDefaults.string(forKey: "country")
        
        if county != nil {
            let viewController = ViewController()
            self.window!.rootViewController = viewController
        } else {
            let locationPickerViewController = LocationPickerViewController()
            self.window!.rootViewController = locationPickerViewController
        }
    }

}

