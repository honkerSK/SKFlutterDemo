//
//  AppDelegate.swift
//  swift_embed_flutter
//
//  Created by sunke on 2020/7/1.
//  Copyright © 2020 KentSun. All rights reserved.
//

import UIKit
import FlutterPluginRegistrant


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // 1.创建一个FlutterEngine对象
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 2.启动flutterEngine
        flutterEngine.run()

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

