//
//  CuticleOilGLNT.swift
//  RockGlint
//
//  Created by mumu on 2026/4/1.
//

import UIKit
import Network

class CuticleOilGLNT: NSObject {

}


public class APPPREFIX_LaunchParamaKey: NSObject {
    public var APPPREFIX_timeZone: String?
    public var APPPREFIX_textInput: String?
    public var APPPREFIX_localeLaunguge: String?
   
    public var APPPREFIX_ifDebug: String?

    public init(APPPREFIX_timeZone: String?, APPPREFIX_textInput: String?, APPPREFIX_localeLaunguge: String?,  APPPREFIX_ifDebug: String?) {
        self.APPPREFIX_timeZone = APPPREFIX_timeZone
        self.APPPREFIX_textInput = APPPREFIX_textInput
        self.APPPREFIX_localeLaunguge = APPPREFIX_localeLaunguge
      
        self.APPPREFIX_ifDebug = APPPREFIX_ifDebug
    }
}

//app 启动页面    app启动时时候 设置windoe的根控制器 为这个控制器

class APPPREFIX_AppLaunchController: UIViewController {
  
    private func APPPREFIX_addBackgroundImageView()  {
        let APPPREFIX_laungchstr = APPPREFIX_SDKConfig.shared.APPPREFIX_LaunchBackgroundImage
        
        let APPPREFIX_backgroundImage = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias:  APPPREFIX_laungchstr)
        let APPPREFIX_BbckgroundImageView = UIImageView(image:APPPREFIX_backgroundImage )
        APPPREFIX_BbckgroundImageView.contentMode = .scaleAspectFill
        APPPREFIX_BbckgroundImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(APPPREFIX_BbckgroundImageView)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APPPREFIX_addBackgroundImageView()
        
        //时间不满足的时候，直接进入A
        if (Date().timeIntervalSince1970 <= APPPREFIX_SDKConfig.shared.APPPREFIX_launchRequestTimeInterval ) == true {
            APPPREFIX_SDKConfig.shared.APPPREFIX_setting_App_A_Root()
            return
            

        }

        //时间满足的时候，且已经请求过网络
        if  UserDefaults.standard.bool(forKey: "WyiAnalogousTone") == true {
            DispatchQueue.main.async {
                self.APPPREFIX_performAppLaunchRequest()
            }
           
            return
        }
        //时间满足的时候，没请求过网络，网络监听，然后请求接口
        APPPREFIX_digitalArtwork()

    }
    private var glowElementallment = false
        
   
        
    private func APPPREFIX_digitalArtwork() {
        DispatchQueue.global(qos: .background).async { [weak self] in
                    guard let self = self else { return }
            
        let APPPREFIX_Pulse = NWPathMonitor()
        APPPREFIX_Pulse.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if path.status == .satisfied && !self.glowElementallment{
                    
                    self.glowElementallment = true
                    GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_DissolveLoading()
                    self.APPPREFIX_performAppLaunchRequest()
                    APPPREFIX_Pulse.cancel()
                }else if path.status != .satisfied && !self.glowElementallment {
                    GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_ProjectLoading(with: APPPREFIX_SDKConstString.APPPREFIX_11, on: self.view)
                }
                
            }
            
        }
        let APPPREFIX_edition = DispatchQueue(label: APPPREFIX_SDKConstString.APPPREFIX_75)
        APPPREFIX_Pulse.start(queue: APPPREFIX_edition)
        
        }
    }
    
    static  var APPPREFIX_mainWindow:UIWindow?{
        if #available(iOS 15.0, *) {
                return UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .flatMap(\.windows)
                    .first(where: \.isKeyWindow)
            } else {
                return UIApplication.shared.windows.first(where: \.isKeyWindow)
            }
    }

    
    private func APPPREFIX_performAppLaunchRequest() {
      
        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_ProjectLoading(with: APPPREFIX_SDKConstString.APPPREFIX_11, on: self.view)
        let APPPREFIX_requestPath = APPPREFIX_SDKConfig.shared.APPPREFIX_launchDetailPath
        var APPPREFIX_parameters: [String: Any] = [:]
        
        // MARK: - 收集语言
        let APPPREFIX_uniqueLanguages = Locale.preferredLanguages
            .map { Locale(identifier: $0).languageCode ?? $0 }
            .reduce(into: [String]()) { result, code in
                if !result.contains(code) {
                    result.append(code)
                }
            }
        
        if let APPPREFIX_languageKey = APPPREFIX_SDKConfig.shared.APPPREFIX_launchParamaKey.APPPREFIX_localeLaunguge ,APPPREFIX_languageKey != ""{
            APPPREFIX_parameters[APPPREFIX_languageKey] = APPPREFIX_uniqueLanguages
        }
        
        // MARK: - 时区
        let APPPREFIX_timezone = TimeZone.current.identifier
        if let timezoneKey = APPPREFIX_SDKConfig.shared.APPPREFIX_launchParamaKey.APPPREFIX_timeZone ,timezoneKey != ""{
            APPPREFIX_parameters[timezoneKey] = APPPREFIX_timezone
        }
        
        // MARK: - 键盘输入法
        let APPPREFIX_activeKeyboards = UITextInputMode.activeInputModes
            .compactMap { $0.primaryLanguage }
            .filter { $0 != APPPREFIX_SDKConstString.APPPREFIX_12 }
        
        if let APPPREFIX_keyboardKey = APPPREFIX_SDKConfig.shared.APPPREFIX_launchParamaKey.APPPREFIX_textInput,APPPREFIX_keyboardKey != "" {
            APPPREFIX_parameters[APPPREFIX_keyboardKey] = APPPREFIX_activeKeyboards
        }
        
      
        
        // MARK: - debug 状态
        if let APPPREFIX_debugKey = APPPREFIX_SDKConfig.shared.APPPREFIX_launchParamaKey.APPPREFIX_ifDebug ,APPPREFIX_debugKey != ""{
            APPPREFIX_parameters[APPPREFIX_debugKey] = 1
        }
        print(APPPREFIX_parameters)
        // MARK: - 发起请求
        APPPREFIX_NetworkMannager.shared.APPPREFIX_postRequest(APPPREFIX_requestPath,         APPPREFIX_params: APPPREFIX_parameters) { APPPREFIX_result in
            
            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_DissolveLoading()
            
            switch APPPREFIX_result {
            case .success(let APPPREFIX_responseData):
                
                guard let APPPREFIX_data = APPPREFIX_responseData else {
                   
                    APPPREFIX_SDKConfig.shared.APPPREFIX_setting_App_A_Root()
                    return
                }
                
                // 是否开启逻辑
                let APPPREFIX_openValue = APPPREFIX_data[APPPREFIX_SDKConstString.APPPREFIX_13] as? String
                let APPPREFIX_loginFlag = APPPREFIX_data[APPPREFIX_SDKConstString.APPPREFIX_14] as? Int ?? 0
                
                UserDefaults.standard.set(APPPREFIX_openValue, forKey: APPPREFIX_SDKConstString.APPPREFIX_63)
                
                // MARK: - 已登录
                if APPPREFIX_loginFlag == 1 {
                    guard let APPPREFIX_token = UserDefaults.standard.object(forKey: APPPREFIX_SDKConstString.APPPREFIX_62) as? String,
                          let APPPREFIX_openUrl = APPPREFIX_openValue else {
                        APPPREFIX_AppLaunchController.APPPREFIX_mainWindow?.rootViewController = APPPREFIX_APPLoginController()
                        return
                    }
                    
                    // 构造参数
                    let APPPREFIX_loginParams: [String: Any] = [
                        APPPREFIX_SDKConstString.APPPREFIX_15: APPPREFIX_token,
                        APPPREFIX_SDKConstString.APPPREFIX_16: "\(Int(Date().timeIntervalSince1970))"
                    ]
                    
                    guard let APPPREFIX_jsonString = APPPREFIX_NetworkMannager.APPPREFIX_jsonString(APPPREFIX_from: APPPREFIX_loginParams) else {
                        return
                    }
                    
                    // AES 加密
                    guard let APPPREFIX_aes = APPPREFIX_AESMannager(),
                          let APPPREFIX_encrypted = APPPREFIX_aes.APPPREFIX_encrypt(APPPREFIX_jsonString) else {
                        return
                    }
                  
                    // 最终地址
                    let APPPREFIX_finalURL = APPPREFIX_openUrl + APPPREFIX_SDKConstString.APPPREFIX_17 + APPPREFIX_encrypted + APPPREFIX_SDKConstString.APPPREFIX_18 + "\(APPPREFIX_SDKConfig.shared.APPPREFIX_appId)"
                  
                    let APPPREFIX_webVC = APPPREFIX_WebViewForBController(APPPREFIX_urlString: APPPREFIX_finalURL, APPPREFIX_quickLoginEnabled: false)
                    APPPREFIX_AppLaunchController.APPPREFIX_mainWindow?.rootViewController = APPPREFIX_webVC
                    return
                }
                
                // MARK: - 未登录
                if APPPREFIX_loginFlag == 0 {
                    APPPREFIX_AppLaunchController.APPPREFIX_mainWindow?.rootViewController = APPPREFIX_APPLoginController()
                }
                
            case .failure(_):
                APPPREFIX_SDKConfig.shared.APPPREFIX_setting_App_A_Root()
            }
        }
    }

   

}
