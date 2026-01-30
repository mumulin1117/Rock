//
//  SceneDelegate.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/27.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        showAppropriateView()
    }

    func showAppropriateView() {
        if RNL_GlintVault.shard.isArtisanPresent {
            window?.rootViewController = GLNTRKNA_StudioTabController()
        } else {
            window?.rootViewController = GLNTRKNA_StudioTabController()//GLNTRKNA_AccessGateway()
        }
        window?.makeKeyAndVisible()
    }
}
