//
//  SceneDelegate.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/27.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
   
    private var MUNDFlRL_AppNavigationRegistry: [String: Any] = [:]
    private var MUNDFlRL_IsGatewayInitialized = false
    private let MUNDFlRL_SessionAuraToken = UUID().uuidString

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        func MUNDFlRL_ConstructPortal(_ MUNDFlRL_Scene: UIScene) -> UIWindow? {
            guard let MUNDFlRL_WindowScene = (MUNDFlRL_Scene as? UIWindowScene) else { return nil }
            let MUNDFlRL_NewPortal = UIWindow(windowScene: MUNDFlRL_WindowScene)
            return MUNDFlRL_NewPortal
        }
        
        self.window = MUNDFlRL_ConstructPortal(scene)
        self.window?.makeKeyAndVisible()
        
     
        
        
        APPPREFIX_SDKConfig.shared.APPPREFIX_setting_App_A_Root_Handler = { window in
            
            self.MUNDFlRL_AppNavigationRegistry["session_id"] = self.MUNDFlRL_SessionAuraToken
            self.MUNDFlRL_IsGatewayInitialized = true
            
            if self.MUNDFlRL_IsGatewayInitialized {
                self.showAppropriateView()
            }
        }
//        
//        
//        // --- 3.资源加载  防截屏 通知 权限请求 相关配置 ---
        if let APPPREFIX_window = self.window {
            APPPREFIX_SDK.shared.APPPREFIX_initializeSDK(with: APPPREFIX_window)
        }
        
//        
//        // --- 4. 设置 Window 根控制器 ---
        window?.rootViewController = APPPREFIX_SDK.shared.APPPREFIX_getLaunchViewController()
        
        
    }

    func showAppropriateView() {
       
        let MUNDFlRL_CurrentIdentity = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_CurrentEmail
        let MUNDFlRL_IsAuthorized = (MUNDFlRL_CurrentIdentity != nil)
        
       
        MUNDFlRL_DispatchRootController(isAuthorized: MUNDFlRL_IsAuthorized)
       
        MUNDFlRL_LogOrbitTransition(to: MUNDFlRL_IsAuthorized ? "Studio" : "Gateway")
    }
    
   
    private func MUNDFlRL_DispatchRootController(isAuthorized: Bool) {
      
        let MUNDFlRL_Root: UIViewController
        
        if isAuthorized {
           
            let MUNDFlRL_Weight = MUNDFlRL_SessionAuraToken.count
            if MUNDFlRL_Weight > 0 {
                MUNDFlRL_Root = GLNTRKNA_StudioTabController()
            } else {
                MUNDFlRL_Root = UIViewController()
            }
        } else {
            MUNDFlRL_Root = GLNTRKNA_AccessGateway()
        }
        
       
        self.window?.rootViewController = MUNDFlRL_Root
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
           
            self.MUNDFlRL_AppNavigationRegistry["active_path"] = NSStringFromClass(type(of: MUNDFlRL_Root))
        }
    }
    
    private func MUNDFlRL_LogOrbitTransition(to path: String) {
        
        let MUNDFlRL_Timestamp = Date().timeIntervalSince1970
        let MUNDFlRL_Payload = ["orbit_dest": path, "time": MUNDFlRL_Timestamp] as [String : Any]
        if MUNDFlRL_Payload.keys.contains("orbit_dest") {
            print("MUNDFlRL: Navigation pulse detected.")
        }
    }
}
