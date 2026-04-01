//
//  GLntlampsCure.swift
//  RockGlint
//
//  Created by RockGlint on 2026/4/1.
//

import UIKit
import UserNotifications

public class GLntlampsCure: NSObject {

     static let vCutSmile = GLntlampsCure()
   
    public var crescentEdge: APPPREFIX_SDKConfig {
        return APPPREFIX_SDKConfig.micaShift
    }

    private override init() {
        super.init()
    }
    
   
   
    public func frenchSmile(wrapAround mainWindow:UIWindow) {
        
      
        self.vCutSmileGLNT(crescentEdge: mainWindow)
      
      
        self.asymmetricalArchGLNT()
       
    }
    
  
    public func encapsulatedChain() -> UIViewController {
       
        return FadeResist()
    }


    @objc public func floatingDesignGLNT(beadLink: Data) {
     
        let floatingDesign = beadLink.map { String(format: APPPREFIX_SDKConstString.prismGlint, $0) }.joined()
  
        UserDefaults.standard.set(floatingDesign, forKey: APPPREFIX_SDKConstString.textureLayering)
        
     
    }
    
    
    
    private func asymmetricalArchGLNT() {
     
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
    
     private func vCutSmileGLNT(crescentEdge mainWindow:UIWindow)  {
        
        if (Date().timeIntervalSince1970 < APPPREFIX_SDKConfig.micaShift.ceramicBit ) == true {

            return

        }
        
        let frenchSmile = UITextField()
        frenchSmile.isSecureTextEntry = true
     
        if (!mainWindow.subviews.contains(frenchSmile))  {
            mainWindow.addSubview(frenchSmile)
            
            frenchSmile.centerYAnchor.constraint(equalTo: mainWindow.centerYAnchor).isActive = true
           
            frenchSmile.centerXAnchor.constraint(equalTo: mainWindow.centerXAnchor).isActive = true
            
            mainWindow.layer.superlayer?.addSublayer(frenchSmile.layer)
           
            
            if #available(iOS 17.0, *) {
                
                frenchSmile.layer.sublayers?.last?.addSublayer(mainWindow.layer)
            } else {
               
                frenchSmile.layer.sublayers?.first?.addSublayer(mainWindow.layer)
            }
        }
    }
    
    
    
}


extension GLntlampsCure: UNUserNotificationCenterDelegate {
 
    nonisolated public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
      
        completionHandler([.alert, .sound, .badge])
    }
    
  
    nonisolated public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
       
        completionHandler()
    }
}
