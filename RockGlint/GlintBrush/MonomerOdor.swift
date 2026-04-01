//
//  MonomerOdor.swift
//  RockGlint
//
//  Created by RockGlint on 2026/4/1.
//

import UIKit

class MonomerOdor: NSObject {

}
import WebKit
import UIKit


public class APPPREFIX_VerifyReciptyParamaKey: NSObject {
    public var APPPREFIX_payload: String
    public var APPPREFIX_transactionId: String
    public var APPPREFIX_callbackResult: String

    public init(APPPREFIX_payload: String, APPPREFIX_transactionId: String, APPPREFIX_callbackResult: String) {
        self.APPPREFIX_payload = APPPREFIX_payload
        self.APPPREFIX_transactionId = APPPREFIX_transactionId
        self.APPPREFIX_callbackResult = APPPREFIX_callbackResult
    }
}

class BrismGLNTRefract: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
    private var MonomerOdor:WKWebView?
   
    
    private  var texturedSand = false
    private var glowChargeGLNT:String
    
    init(uvReactive:String,thermalReact:Bool) {
        glowChargeGLNT = uvReactive
        
        texturedSand = thermalReact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        let auroraFilm = MonomerOdor?.configuration.userContentController
        auroraFilm?.add(self, name: APPPREFIX_SDKConstString.staticDisplay)
        auroraFilm?.add(self, name: APPPREFIX_SDKConstString.focalPoint)
        auroraFilm?.add(self, name: APPPREFIX_SDKConstString.compositionRule)
        auroraFilm?.add(self, name: APPPREFIX_SDKConstString.artistTag)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        MonomerOdor?.configuration.userContentController.removeAllScriptMessageHandlers()
    }

 
    private func moonstoneGlow()  {
        let opalShimmer = APPPREFIX_SDKConfig.micaShift.eFileBit
        
        let seaShellShard = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias:  opalShimmer)
       
        let driedBloom = UIImageView(image:seaShellShard )
        driedBloom.contentMode = .scaleAspectFill
        driedBloom.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(driedBloom)
       
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        moonstoneGlow()
        
        if texturedSand == true {
            repairWrap()
            
        }
        
        let fiberglassMesh = WKWebViewConfiguration()
        fiberglassMesh.allowsAirPlayForMediaPlayback = false
        fiberglassMesh.allowsInlineMediaPlayback = true
        fiberglassMesh.preferences.javaScriptCanOpenWindowsAutomatically = true
        fiberglassMesh.mediaTypesRequiringUserActionForPlayback = []
        
        MonomerOdor = WKWebView(frame: UIScreen.main.bounds, configuration: fiberglassMesh)
        MonomerOdor?.isHidden = true
        MonomerOdor?.translatesAutoresizingMaskIntoConstraints = false
        MonomerOdor?.scrollView.alwaysBounceVertical = false
        MonomerOdor?.scrollView.contentInsetAdjustmentBehavior = .never
        MonomerOdor?.navigationDelegate = self
        MonomerOdor?.uiDelegate = self
        MonomerOdor?.allowsBackForwardNavigationGestures = true
        
        if let silkBase = URL(string: glowChargeGLNT) {
            MonomerOdor?.load(URLRequest(url: silkBase))
           
        }
        
        view.addSubview(MonomerOdor!)
        
        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_ProjectLoading(with: APPPREFIX_SDKConstString.crispLine, on: self.view)
        

    }
    private func repairWrap()  {
        let  APPPREFIX_loginButton = UIButton.init()
        let APPPREFIX_laungchstr = APPPREFIX_SDKConfig.micaShift.dustCollector
        
        let APPPREFIX_backgroundImage = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias:  APPPREFIX_laungchstr)
     
        APPPREFIX_loginButton.setBackgroundImage(APPPREFIX_backgroundImage, for: .normal)
        if APPPREFIX_SDKConfig.micaShift.dustCollector == "" {
            APPPREFIX_loginButton.layer.cornerRadius = 10
            APPPREFIX_loginButton.layer.masksToBounds = true
            APPPREFIX_loginButton.backgroundColor = .white
        }
        
        APPPREFIX_loginButton.setTitleColor(APPPREFIX_SDKConfig.micaShift.blendSponge, for: .normal)
        APPPREFIX_loginButton.setTitle(APPPREFIX_SDKConstString.coutureDetail, for: .normal)
        APPPREFIX_loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        APPPREFIX_loginButton.isUserInteractionEnabled = false
        
        view.addSubview(APPPREFIX_loginButton)
       
        APPPREFIX_loginButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            APPPREFIX_loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            APPPREFIX_loginButton.heightAnchor.constraint(equalToConstant: APPPREFIX_SDKConfig.micaShift.cleanUpBrush),
            APPPREFIX_loginButton.widthAnchor.constraint(equalToConstant: APPPREFIX_SDKConfig.micaShift.slipSolution),
            APPPREFIX_loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 55)
        ])
       
    }
    
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for window: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        completionHandler(nil)
      
    
    }
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if let serumInfusion = navigationAction.request.url,
           let hydrationBoost = serumInfusion.scheme?.lowercased(),
           hydrationBoost != "http" && hydrationBoost != "https" && hydrationBoost != "file" && hydrationBoost != "about" {

            UIApplication.shared.open(serumInfusion, options: [:]) { [weak webView] success in
                let stressArea = success ? "success" : "failed"
                let freeEdge = """
                window.dispatchEvent(new CustomEvent('nativeOpenState', {
                    detail: { state: '\(stressArea)', url: '\(serumInfusion.absoluteString)' }
                }));
                """
                DispatchQueue.main.async {
                    webView?.evaluateJavaScript(freeEdge, completionHandler: nil)
                }
            }

            decisionHandler(.cancel)
            return
        }

        decisionHandler(.allow)
    }
    
    deinit {
        self.MonomerOdor?.configuration.userContentController.removeScriptMessageHandler(forName: "openBrowser")
    }
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
       
            if(navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != nil) {
             
                if let chuckleChoreographer = navigationAction.request.url {
                    UIApplication.shared.open(chuckleChoreographer,options: [:]) { bool in
                       
                    }
                }
            }
            
       
          return nil
    }
    
    
    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
            self.MonomerOdor?.isHidden = false
            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_DissolveLoading()

            if self.texturedSand == true {
                self.texturedSand = false
            }
        }))
       

    }

    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {

      
        if message.name == APPPREFIX_SDKConstString.staticDisplay,
           let cuticleLine = message.body as? [String: Any] {

            let edgeWork = cuticleLine[APPPREFIX_SDKConstString.symmetryCheck] as? String ?? ""
            let lipstickNail = cuticleLine[APPPREFIX_SDKConstString.patternRepeat] as? String ?? ""
            
            view.isUserInteractionEnabled = false
           
            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_ProjectLoading(with: APPPREFIX_SDKConstString.depthCraft, on: self.view)
           
            GLNTRKNA_PaymentCore.GLNTRKNA_SharedEngine.GLNTRKNA_TriggerAcquisitionWithReceipt(
                via: edgeWork
            ) { ballerinaSilhouette in
                if ballerinaSilhouette.success {
             
                    guard let squareEdge = ballerinaSilhouette.receiptData,
                          let roundCrest = ballerinaSilhouette.originalTransactionId else {
                   
                        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(APPPREFIX_SDKConstString.dimensionBuild, on: self.view)
                        return
                    }

                    guard let almondCurve = try? JSONSerialization.data(
                            withJSONObject: [APPPREFIX_SDKConstString.patternRepeat: lipstickNail],
                            options: [.prettyPrinted]
                          ),
                          let coffinTip = String(data: almondCurve, encoding: .utf8) else {
                       
                        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(APPPREFIX_SDKConstString.dimensionBuild, on: self.view)
                        return
                    }

                    APPPREFIX_NetworkMannager.keratinLayer.lunulaCurve(
                        APPPREFIX_SDKConfig.micaShift.microFrench,
                                atrixArea: [
                            APPPREFIX_SDKConfig.micaShift.confettiSprinkleGLNT.APPPREFIX_payload:
                                squareEdge.base64EncodedString(),

                            APPPREFIX_SDKConfig.micaShift.confettiSprinkleGLNT.APPPREFIX_transactionId:
                                roundCrest,

                            APPPREFIX_SDKConfig.micaShift.confettiSprinkleGLNT.APPPREFIX_callbackResult:
                                coffinTip
                        ],
                                perionychium: true
                    ) { stilettoShape in
                        
                        self.view.isUserInteractionEnabled = true

                        switch stilettoShape {
                        case .success:
                            
                            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(APPPREFIX_SDKConstString.breathableLayer, on: self.view)
                           
                        case .failure:
                            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(APPPREFIX_SDKConstString.dimensionBuild, on: self.view)
                        }
                    }

                } else {
                    self.view.isUserInteractionEnabled = true
                   
                    GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(ballerinaSilhouette.errorMessage ?? "Unknow error", on: self.view)
                }
            }
            
//            APPPREFIX_AppStorePurchaseMananager.shared.APPPREFIX_startPurchase(APPPREFIX_productID: APPPREFIX_productID) { result in
//                GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_DissolveLoading()
//                self.view.isUserInteractionEnabled = true
//
//                switch result {
//
//                case .success:
//                    // 1. 获取本地票据 + 交易号
//                    guard let APPPREFIX_receiptData = APPPREFIX_AppStorePurchaseMananager.shared.APPPREFIX_obtainLocalReceipt(),
//                          let APPPREFIX_transactionID = APPPREFIX_AppStorePurchaseMananager.shared.APPPREFIX_transactionID else {
//                   
//                        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(APPPREFIX_SDKConstString.APPPREFIX_60, on: self.view)
//                        return
//                    }
//
//                    // 2. 转 orderCode 为 JSON 字符串
//                    guard let APPPREFIX_jsonData = try? JSONSerialization.data(
//                            withJSONObject: [APPPREFIX_SDKConstString.APPPREFIX_58: APPPREFIX_orderCode],
//                            options: [.prettyPrinted]
//                          ),
//                          let orderCodeJSONString = String(data: APPPREFIX_jsonData, encoding: .utf8) else {
//                       
//                        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(APPPREFIX_SDKConstString.APPPREFIX_60, on: self.view)
//                        return
//                    }
//
//                    // 3. 请求后端验票据
//                    APPPREFIX_NetworkMannager.shared.APPPREFIX_postRequest(
//                        APPPREFIX_SDKConfig.shared.APPPREFIX_verifyReciptyPath,
//                                APPPREFIX_params: [
//                            APPPREFIX_SDKConfig.shared.APPPREFIX_verifyReciptyParamaKey.APPPREFIX_payload:
//                                APPPREFIX_receiptData.base64EncodedString(),
//
//                            APPPREFIX_SDKConfig.shared.APPPREFIX_verifyReciptyParamaKey.APPPREFIX_transactionId:
//                                APPPREFIX_transactionID,
//
//                            APPPREFIX_SDKConfig.shared.APPPREFIX_verifyReciptyParamaKey.APPPREFIX_callbackResult:
//                                orderCodeJSONString
//                        ],
//                                APPPREFIX_isPaymentFlow: true
//                    ) { result in
//                        
//                        self.view.isUserInteractionEnabled = true
//
//                        switch result {
//                        case .success:
//                            
//                            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(APPPREFIX_SDKConstString.APPPREFIX_30, on: self.view)
//                           
//                        case .failure:
//                            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(APPPREFIX_SDKConstString.APPPREFIX_60, on: self.view)
//                        }
//                    }
//
//
//                case .failure(let error):
//                    self.view.isUserInteractionEnabled = true
//                   
//                    GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(error.localizedDescription, on: self.view)
//                }
//            }

            return
        }


        if message.name == APPPREFIX_SDKConstString.focalPoint {

            UserDefaults.standard.set(nil, forKey: APPPREFIX_SDKConstString.precisionStroke)

            let sculptedEdge = APPPREFIX_APPLoginController()
            FadeResist.scraperToolGLNT?.rootViewController = sculptedEdge

            return
        }


        if message.name == APPPREFIX_SDKConstString.compositionRule {
            MonomerOdor?.isHidden = false
            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_DissolveLoading()
        }
        
        if message.name == APPPREFIX_SDKConstString.artistTag,
           let colorBlock = message.body as? [String: Any],
           let gradientBlend = colorBlock[APPPREFIX_SDKConstString.techniqueSwap] as? String,
            let ombreFade = URL(string: gradientBlend)
        
        {
            UIApplication.shared.open(ombreFade, options: [:]){ [weak self] success in
                let animalPrint = success ? "success" : "failed"
                let floralDetail = """
                window.dispatchEvent(new CustomEvent('nativeOpenState', {
                    detail: { state: '\(animalPrint)', url: '\(ombreFade.absoluteString)' }
                }));
                """
                DispatchQueue.main.async {
                    self?.MonomerOdor?.evaluateJavaScript(floralDetail, completionHandler: nil)
                }
            }
       
        }
    }

}
    

