//
//  AppDelegate.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/27.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // GLNTRKNA: 全局窗口实例，虽然现在主要用 SceneDelegate，但保留此引用是标准做法
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
       
//        customizeGLNTRKNAAppearance()
        
        return true
    }

   
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
