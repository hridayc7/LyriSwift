//
//  AppDelegate.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 1/6/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.
//

//This is the main AppDelegate. It is pre-written by Xcode
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let defaults = UserDefaults()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if(defaults.string(forKey: Keys.firstName) != nil){
            gamePlayer.userName = defaults.string(forKey: Keys.firstName)!
        }
        if(defaults.string(forKey: Keys.lastName) != nil){
            gamePlayer.lastName = defaults.string(forKey: Keys.lastName)!
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

