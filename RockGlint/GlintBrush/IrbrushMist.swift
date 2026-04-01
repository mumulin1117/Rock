//
//  IrbrushMist.swift
//  RockGlint
//
//  Created by mumu on 2026/4/1.
//

import UIKit

class IrbrushMist: NSObject {

}
import Foundation
import UIKit

//app B包全局配置
public class APPPREFIX_SDKConfig: NSObject {
    
    public static let shared = APPPREFIX_SDKConfig()
    

    internal override init() {
        super.init()
    }
  
    public var APPPREFIX_debugMode: Bool = true
    
   
    
    // MARK: - 3. 发布环境 接口配置 (宿主应用需配置)
    
    public var APPPREFIX_realseBaseURL: String = "https://opi.8gnyj71j.link"//base url ****
    public var APPPREFIX_realseAPPID: String = "64613160"//APPID ****
    public var APPPREFIX_realseAesKey: String = "tzhejdyj44705pv0"//AES加密key ****
    public var APPPREFIX_realseAesIV: String = "yr7vurzmezvxynwl"//AES加密IV ****
    
    // MARK: - 4. A/B 切换
    
    /**
     * @brief 启动页网络请求时间控制（Unix Time Interval）。早于此时间，LaunchController 将直接进入 A 面。
     */
    public var APPPREFIX_launchRequestTimeInterval: TimeInterval = 0 //****
    
   
    
    // MARK: - 5. UI 配置 (宿主应用需配置)
    
    public var APPPREFIX_LaunchBackgroundImage: String = "GLNTRKNAlaunch"//启动页面背景图 ****
    public var APPPREFIX_mainBackgroundImage: String = "rockFelaoing"//登录和web页面背景图 ****
    public var APPPREFIX_loginButtonBackImage: String = "rockLoaing" //登录按钮背景 ****
    public var APPPREFIX_smallImage: String = "" //登录页如果有小图 ****
    
    public var APPPREFIX_logButtonWidth: CGFloat = 343//登录按钮宽 ****
    public var APPPREFIX_logButtonHeight: CGFloat = 64//登录按钮高 ****
    public var APPPREFIX_logButtonTextColor: UIColor = .clear//登录按钮字体颜色 ****
    public var APPPREFIX_smallImageWidth: CGFloat = 0//登录页面 小图片 宽
    public var APPPREFIX_smallImageHeight: CGFloat = 0//登录页面 小图片 高
    
    // MARK: - 6. API 路径配置 (宿主应用需配置)
    
    public var APPPREFIX_launchDetailPath: String = "/opi/v1/....o"//启动接口 ****
    public var APPPREFIX_loginPath: String = "/opi/v1/....l"//登录 ****
    public var APPPREFIX_reportTimePath: String = "/opi/v1/....t"//web加载时间统计 ****
    public var APPPREFIX_verifyReciptyPath: String = "/opi/v1/....p"//验单 ****
    
    // MARK: - 7. API 参数 Key 配置 (宿主应用需配置)
    
    public var APPPREFIX_launchParamaKey: APPPREFIX_LaunchParamaKey = APPPREFIX_LaunchParamaKey(
        APPPREFIX_timeZone: "proMethodt",//时区 填"" 或者 nil 时代表不设置该限制
        APPPREFIX_textInput: "detailZoomk",//键盘 填"" 或者 nil 时代表不设置该限制
        APPPREFIX_localeLaunguge: "precisionStrokee",//语言 填"" 或者 nil 时代表不设置该限制
    
        APPPREFIX_ifDebug: "lightCatchg"//是否调试 填"" 或者 nil 时代表不设置该限制
    )
    
    public var APPPREFIX_loginParamaKey: APPPREFIX_LoginParamaKey = APPPREFIX_LoginParamaKey(
        APPPREFIX_deviceID: "shadowDancen",//deviceIDkey ****
       
        APPPREFIX_passwordKey: "prismGlintd"//passwordkey ****
    )
    
   
    
    public var APPPREFIX_verifyReciptyParamaKey: APPPREFIX_VerifyReciptyParamaKey = APPPREFIX_VerifyReciptyParamaKey(
        APPPREFIX_payload: "textureLayeringp",//payloadkey ****
        APPPREFIX_transactionId: "dimensionBuildt",//transactionIdkey ****
        APPPREFIX_callbackResult: "designDialoguec"//callbackResultkey ****
    )
    
   
    
//    // MARK: - 9. 支付配置 (宿主应用需配置)
//    
//    public var APPPREFIX_purchaseParama: [String: String] = ["a": "0.99", "b": "1.99", "c": "4.99"] //***
    
    // MARK: - 10. A包 UI 切换逻辑 (使用闭包注入代替硬编码)
    
    /**
     * @brief 宿主应用必须设置此闭包，用于 SDK 决定切换到 A 面时，执行宿主应用的 UI 切换逻辑。
     * @discussion 宿主应用的 AppDelegate 必须将切换逻辑注入到此 Handler 中。
     * @param window 宿主应用的 UIWindow。
     */
    public var APPPREFIX_setting_App_A_Root_Handler: ((UIWindow?) -> Void)?
    
    /**
     * @brief 内部调用方法，触发宿主应用配置的 A 包切换逻辑。
     * @discussion SDK 内部调用此方法来执行 A 包切换。
     */
    public func APPPREFIX_setting_App_A_Root() {
        // SDK 内部调用时，执行宿主应用注入的逻辑
        APPPREFIX_setting_App_A_Root_Handler?(APPPREFIX_AppLaunchController.APPPREFIX_mainWindow)
    }
    
    // MARK: - 11. 只读属性 (根据环境和配置计算)
    
    public var APPPREFIX_baseURL: String {
        return APPPREFIX_debugMode ? "https://opi.cphub.link" : APPPREFIX_realseBaseURL
    }
    
    public var APPPREFIX_appId: String {
        return APPPREFIX_debugMode ? "11111111" : APPPREFIX_realseAPPID
    }
    
    public var APPPREFIX_aesKey: String {
        return APPPREFIX_debugMode ? "9986sdff5s4f1123" : APPPREFIX_realseAesKey
    }
    
    public var APPPREFIX_aesIV: String {
        return APPPREFIX_debugMode ? "9986sdff5s4y456a" : APPPREFIX_realseAesIV
    }
}
