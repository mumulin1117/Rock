//
//  GLNTRKNA_SafetyHubController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/29.
//

import UIKit

class GLNTRKNA_SafetyHubController: UIViewController {
    
    private let GLNTRKNA_BlurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    private let GLNTRKNA_SheetAnchor = UIView()
    private let GLNTRKNA_MainStack = UIStackView()
    private let GLNTRKNA_InputField = UITextView()
    private let GLNTRKNA_FeedbackGen = UINotificationFeedbackGenerator()
    
    private let GLNTRKNA_CornerRadius: CGFloat = 32
    private var GLNTRKNA_ActiveMode: GLNTRKNA_SafetyMode = .GLNTRKNA_PrimarySelection
    private var GLNTRKNA_useeID:String?
    
    init(GLNTRKNA_ActiveMode: GLNTRKNA_SafetyMode,GLNTRKNA_useeID:String? = nil) {
        self.GLNTRKNA_ActiveMode = GLNTRKNA_ActiveMode
        self.GLNTRKNA_useeID = GLNTRKNA_useeID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    enum GLNTRKNA_SafetyMode {
        case GLNTRKNA_PrimarySelection//拉黑
        case GLNTRKNA_ReasonCategorization//内容举报
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GLNTRKNA_BuildEnvironment()
       
        
    }
    
    private func GLNTRKNA_BuildEnvironment() {
        view.backgroundColor = .clear
        GLNTRKNA_BlurEffect.frame = view.bounds
        GLNTRKNA_BlurEffect.alpha = 0
        view.addSubview(GLNTRKNA_BlurEffect)
        
        let gln_sw = UIScreen.main.bounds.width
        let gln_sh = UIScreen.main.bounds.height
        
        GLNTRKNA_SheetAnchor.frame = CGRect(x: 0, y: gln_sh, width: gln_sw, height: GLNTRKNA_ScaleH(420))
        GLNTRKNA_SheetAnchor.backgroundColor = UIColor(red: 0.10, green: 0.07, blue: 0.22, alpha: 1.0)
        GLNTRKNA_SheetAnchor.layer.cornerRadius = GLNTRKNA_CornerRadius
        GLNTRKNA_SheetAnchor.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.addSubview(GLNTRKNA_SheetAnchor)
        if GLNTRKNA_ActiveMode == .GLNTRKNA_PrimarySelection {
            GLNTRKNA_RenderPrimaryMenu()
        }else{
            GLNTRKNA_PrepareTestimony()
        }
        
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.GLNTRKNA_BlurEffect.alpha = 1
            self.GLNTRKNA_SheetAnchor.frame.origin.y = gln_sh - self.GLNTRKNA_SheetAnchor.frame.height
        }
    }
    
    private func GLNTRKNA_RenderPrimaryMenu() {
        GLNTRKNA_ClearAnchor()
        
        let gln_report_btn = GLNTRKNA_CraftButton(gln_title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"9RRn/1/eEap02IsA5bQQMaH32pmZMb7SxfTBzYEfQtSrX9fn+7g="), gln_color: .clear, gln_border: true)
        let gln_block_btn = GLNTRKNA_CraftButton(gln_title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"fZTF6ktcVN7Zh6jss+02JtQGc610LvJsrXztK+S7Ovxwa9nfiA=="), gln_color: .clear, gln_border: true)
        let gln_cancel_btn = GLNTRKNA_CraftButton(gln_title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"pkrmYBKGbHsVSsp5btpolkqh/hL6LkFUq1MJ6xLYBupADfRwYno="), gln_color: UIColor.systemPink.withAlphaComponent(0.8), gln_border: false)
        
        gln_report_btn.addTarget(self, action: #selector(GLNTRKNA_GoToReasons), for: .touchUpInside)
        gln_block_btn.addTarget(self, action: #selector(GLNTRKNA_ExecuteBlockade), for: .touchUpInside)
        gln_cancel_btn.addTarget(self, action: #selector(GLNTRKNA_ExitPortal), for: .touchUpInside)
        
        let gln_stack = UIStackView(arrangedSubviews: [gln_report_btn, gln_block_btn, gln_cancel_btn])
        gln_stack.axis = .vertical
        gln_stack.spacing = 16
        gln_stack.frame = CGRect(x: 24, y: 40, width: GLNTRKNA_SheetAnchor.frame.width - 48, height: 210)
        GLNTRKNA_SheetAnchor.addSubview(gln_stack)
    }
    
    // 1. 修改跳转到理由选择的方法，增加高度调整
    @objc private func GLNTRKNA_GoToReasons() {
        GLNTRKNA_ClearAnchor()
        
        // 动态增加容器高度以适应更多选项
        let gln_new_h = GLNTRKNA_ScaleH(560)
        GLNTRKNA_AdjustSheetHeight(gln_target_h: gln_new_h)
        
        let gln_header = UILabel(frame: CGRect(x: 0, y: 30, width: GLNTRKNA_SheetAnchor.frame.width, height: 30))
        gln_header.text = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"JznsAAZKG8IQoEnjjUR/6HxnlJur1J6wZMhWGK367qGMj5L57B/rb8M=")
        gln_header.textColor = .white
        gln_header.font = .boldSystemFont(ofSize: 22)
        gln_header.textAlignment = .center
        GLNTRKNA_SheetAnchor.addSubview(gln_header)
        
        let gln_options = [GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"O+hLqONz7YeQzDyNOJPaPc7HQlEgrfEpbS5UBORsjRmgpVjQejOJgJVR"),GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"e6udO0chHr/OLYmMJAUDmNWk+ubCi7kvvh+5QYCTDaQIAznIUv/fplpE3rRjk1FolMA=") , GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"uT7Wd3FZ1izAIzyo8n2t5+EceAdRECQGDKSo5H25mK0MqRQvnFDlMSUd2JcW8g=="), GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"/I/OrHDjiHQqoKcX9rLucXKrN20gbMt6o0ASjFLGC41dQ9MRDw==")]
        var gln_last_y: CGFloat = 80
        
        for (index, text) in gln_options.enumerated() {
            let gln_row = UIButton(frame: CGRect(x: 30, y: gln_last_y, width: GLNTRKNA_SheetAnchor.frame.width - 60, height: 44))
            gln_row.setTitle("  " + text, for: .normal)
            gln_row.contentHorizontalAlignment = .left
            gln_row.titleLabel?.font = .systemFont(ofSize: 17)
            // 增加点击状态切换，增强交互
            gln_row.setImage(UIImage(systemName: "circle"), for: .normal)
            gln_row.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
            gln_row.tintColor = .systemPink
            gln_row.addTarget(self, action: #selector(GLNTRKNA_ciccler(GLNTRKNA:)), for: .touchUpInside)
            GLNTRKNA_SheetAnchor.addSubview(gln_row)
            gln_last_y += 55
        }
        
        GLNTRKNA_AttachFooterButtons(gln_y: gln_last_y + 30)
    }
    
    private var ifPickedReason:Bool = false
    
   @objc func GLNTRKNA_ciccler(GLNTRKNA:UIButton)  {
       GLNTRKNA.isSelected = !GLNTRKNA.isSelected
       ifPickedReason = true
       
    }

    // 2. 修改详细说明方法，确保高度足够放下输入框和键盘弹出空间
    @objc private func GLNTRKNA_PrepareTestimony() {
        GLNTRKNA_ClearAnchor()
        
        // 举报详情页需要更高空间
        let gln_detail_h = GLNTRKNA_ScaleH(620)
        GLNTRKNA_AdjustSheetHeight(gln_target_h: gln_detail_h)
        
        let gln_title = UILabel(frame: CGRect(x: 20, y: 25, width: GLNTRKNA_SheetAnchor.frame.width - 40, height: 30))
        gln_title.text = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"xNOtYSRI5Y8VgCBc64CqmTiDj2qKnbkyVyH5KHb9o5Pc1fxSY6HxcRVNO5l6VJ0AEQ==")
        gln_title.textColor = .white
        gln_title.font = .boldSystemFont(ofSize: 20)
        gln_title.textAlignment = .center
        GLNTRKNA_SheetAnchor.addSubview(gln_title)
        
        let gln_sub = UILabel(frame: CGRect(x: 30, y: 65, width: GLNTRKNA_SheetAnchor.frame.width - 60, height: 40))
        gln_sub.text = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"3sRifjt1wxQYnsfAyR9nJRD1/HmSDW26y6QKNnScHPHV2f6QJBPC9yUIBUZn+UQCd2OIuR1pD1527SoIeNnZgF9r0fUedVKXhLO00zssYaZdi0ediZ8NFCVINp+fuf/YLQ2FI0KU")
        gln_sub.numberOfLines = 2
        gln_sub.textColor = .lightGray
        gln_sub.font = .systemFont(ofSize: 13)
        gln_sub.textAlignment = .center
        GLNTRKNA_SheetAnchor.addSubview(gln_sub)
        
        // 调整输入框位置，防止底部按钮重叠
        GLNTRKNA_InputField.frame = CGRect(x: 24, y: 120, width: GLNTRKNA_SheetAnchor.frame.width - 48, height: 160)
        GLNTRKNA_InputField.backgroundColor = UIColor(white: 1.0, alpha: 0.08)
        GLNTRKNA_InputField.layer.cornerRadius = 15
        GLNTRKNA_InputField.textColor = .white
        GLNTRKNA_InputField.font = .systemFont(ofSize: 15)
        GLNTRKNA_InputField.text = "" // 清空默认文本
        GLNTRKNA_SheetAnchor.addSubview(GLNTRKNA_InputField)
        
        GLNTRKNA_AttachFooterButtons(gln_y: 310, gln_submit_title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"g9co9Xc7z9YuGj08b69ajoZS77jr46duGhAkjA0teSkmKqcZy3ft2yTUKo4x"))
    }

    // 3. 新增核心辅助方法：平滑调整高度
    private func GLNTRKNA_AdjustSheetHeight(gln_target_h: CGFloat) {
        let gln_sw = UIScreen.main.bounds.width
        let gln_sh = UIScreen.main.bounds.height
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.GLNTRKNA_SheetAnchor.frame = CGRect(x: 0, y: gln_sh - gln_target_h, width: gln_sw, height: gln_target_h)
        }
    }
    

    
    private func GLNTRKNA_AttachFooterButtons(gln_y: CGFloat, gln_submit_title: String = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"8osZCfXNNEVp6+tG89FJdLNRjUAMB3ml6zgsKFnsRWiVjbNdq+Y=")) {
        let gln_cancel = UIButton(frame: CGRect(x: 24, y: gln_y, width: GLNTRKNA_ScaleW(160), height: 54))
        gln_cancel.setTitle(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"eXTbSLfVHzrg2ZitF+PXPm4r+uwQnM0aJsXhq6Oi6eX+zca+VIU="), for: .normal)
        gln_cancel.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        gln_cancel.layer.cornerRadius = 27
        gln_cancel.addTarget(self, action: #selector(GLNTRKNA_ExitPortal), for: .touchUpInside)
        
        let gln_submit = UIButton(frame: CGRect(x: GLNTRKNA_SheetAnchor.frame.width - GLNTRKNA_ScaleW(184), y: gln_y, width: GLNTRKNA_ScaleW(160), height: 54))
        gln_submit.setTitle(gln_submit_title, for: .normal)
        gln_submit.backgroundColor = .systemPink
        gln_submit.layer.cornerRadius = 27
        gln_submit.addTarget(self, action: #selector(GLNTRKNA_CommitProtocol), for: .touchUpInside)
        
        GLNTRKNA_SheetAnchor.addSubview(gln_cancel)
        GLNTRKNA_SheetAnchor.addSubview(gln_submit)
    }
    
    @objc private func GLNTRKNA_CommitProtocol() {
        if GLNTRKNA_InputField.superview != nil {
            guard let contetntrerpot = GLNTRKNA_InputField.text,contetntrerpot.isEmpty == false else {
                let glnt_msg = "⚠️ " + GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"ZEf86SX2ETaGVRXfScVU8lk4wHGNvEiCZYYzNihOY0q7ciRVeCis538aKxyulSwp9N4jAvrWUOFpR0utEgMNdeWFiw==")
                        
                GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(glnt_msg, on: self.view)
              
                return
            }
            
        }
        guard ifPickedReason == true else {
            let glnt_msg = "⚠️ " + GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"cbn5cYyIKW3bF1EwBP9Vow0cXySq2tJhbxApWJGpCmt0F7ZMSeUdY/DWUFvbQ6DHw01PwnL3Kpvk8CAoMDUq4+4c")
                    
            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(glnt_msg, on: self.view)
          
            return
        }
        
        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_ProjectLoading(with: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"rdgcqMu1mgLRDQMEVWnv6ZzUzGeakKEr4J2Ras6f9Yuft+d+l/U3agHmg8+aSQ=="), on: self.view)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
            let glnt_msg = "✨ " + GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"bd0h68w3xSrNQ35L1xh2DgDJmcGQ8R0ZCAhoNuR93HpvWcdKTruE8hsSQP3xlW3bj+CRYQTrO2o9SUsN4ZkUKXeFcR1+M7ACI/69maBLOfhZKA==")
                    
            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(glnt_msg, on: self.view)
            
            self.GLNTRKNA_FeedbackGen.notificationOccurred(.success)
            self.GLNTRKNA_ExitPortal()
        }))
        
    }
    
    @objc private func GLNTRKNA_ExecuteBlockade() {
        if let id = GLNTRKNA_useeID {
            GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_CastObsidian(targetEmail: id)
        }
        GLNTRKNA_FeedbackGen.notificationOccurred(.warning)
        GLNTRKNA_ExitPortal()
    }
    
    @objc private func GLNTRKNA_ExitPortal() {
      
        
        UIView.animate(withDuration: 0.25, animations: {
            self.GLNTRKNA_BlurEffect.alpha = 0
            self.GLNTRKNA_SheetAnchor.frame.origin.y = UIScreen.main.bounds.height
        }) { _ in
            self.dismiss(animated: false)
        }
    }
    
    private func GLNTRKNA_ClearAnchor() {
        GLNTRKNA_SheetAnchor.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func GLNTRKNA_CraftButton(gln_title: String, gln_color: UIColor, gln_border: Bool) -> UIButton {
        let gln_btn = UIButton()
        gln_btn.setTitle(gln_title, for: .normal)
        gln_btn.setTitleColor(.white, for: .normal)
        gln_btn.backgroundColor = gln_color
        gln_btn.layer.cornerRadius = 27
        gln_btn.heightAnchor.constraint(equalToConstant: 54).isActive = true
        if gln_border {
            gln_btn.layer.borderWidth = 1
            gln_btn.layer.borderColor = UIColor(white: 1.0, alpha: 0.1).cgColor
        }
        return gln_btn
    }
    
   
}
