//
//  GLNTRKNA_AccessGateway.swift
//  RockGlint
//

import UIKit

extension CGFloat {
    static var GLNTRKNA_W_Ratio: CGFloat {
        return UIScreen.main.bounds.width / 375.0
    }
    static var GLNTRKNA_H_Ratio: CGFloat {
        return UIScreen.main.bounds.height / 812.0
    }
}

func GLNTRKNA_ScaleW(_ value: CGFloat) -> CGFloat {
    return value * .GLNTRKNA_W_Ratio
}

func GLNTRKNA_ScaleH(_ value: CGFloat) -> CGFloat {
    return value * .GLNTRKNA_H_Ratio
}

class GLNTRKNA_AccessGateway: UIViewController, UITextFieldDelegate {

    private let GLNTRKNA_CanvasScroll = UIScrollView()
    private let GLNTRKNA_ArtisanContainer = UIView()
    
    private let GLNTRKNA_VibeBanner: UIImageView = {
        let gln_img = UIImageView()
        gln_img.contentMode = .scaleAspectFill
        gln_img.image = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_rkna_login_hero")
        gln_img.clipsToBounds = true
        return gln_img
    }()
    
    private let GLNTRKNA_EmailSymbol = UILabel()
    private let GLNTRKNA_SecretSymbol = UILabel()
    
    private let GLNTRKNA_ArtisanEmail: UITextField = {
        let gln_tf = UITextField()
        gln_tf.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        gln_tf.layer.cornerRadius = 12
        gln_tf.textColor = .white
        gln_tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 10))
        gln_tf.leftViewMode = .always
        gln_tf.attributedPlaceholder = NSAttributedString(string: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"IwnNc5hB1wDekP7OkESmgEnec6i5fE59rBUYLj9FlJT80BEQSeIm0vTRz5ZbmBr0"), attributes: [.foregroundColor: UIColor.lightGray])
        gln_tf.keyboardType = .emailAddress
        return gln_tf
    }()
    
    private let GLNTRKNA_ArtisanSecret: UITextField = {
        let gln_tf = UITextField()
        gln_tf.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        gln_tf.layer.cornerRadius = 12
        gln_tf.textColor = .white
        gln_tf.isSecureTextEntry = true
        gln_tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 10))
        gln_tf.leftViewMode = .always
        gln_tf.attributedPlaceholder = NSAttributedString(string: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"PbXR50au4D/o99fM5BpWlcA1IWvuO3d3Hj8+HrwBoD8WeOUFjG0xU1JUtS/ELqJDq8/F"), attributes: [.foregroundColor: UIColor.lightGray])
        return gln_tf
    }()
    
    private let GLNTRKNA_CommitTrigger: UIButton = {
        let gln_btn = UIButton()
        gln_btn.setBackgroundImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_CommitTrigger"), for: .normal)
        gln_btn.contentMode = .scaleAspectFit
        return gln_btn
    }()
    
    private let GLNTRKNA_ConsentTick: UIButton = {
        let gln_btn = UIButton(type: .custom)
        gln_btn.setImage(UIImage(systemName: "circle"), for: .normal)
        gln_btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        gln_btn.tintColor = .systemPink
        return gln_btn
    }()
    
    private let GLNTRKNA_PolicyTerminal = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_InitializeBaseFrame()
        GLNTRKNA_ForgeLayout()
        GLNTRKNA_BindSignals()
    }
    
    private func GLNTRKNA_InitializeBaseFrame() {
        view.backgroundColor = UIColor(red: 0.02, green: 0.02, blue: 0.1, alpha: 1.0)
        GLNTRKNA_CanvasScroll.frame = view.bounds
        view.addSubview(GLNTRKNA_CanvasScroll)
        GLNTRKNA_CanvasScroll.addSubview(GLNTRKNA_ArtisanContainer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(GLNTRKNA_AdjustForKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(GLNTRKNA_AdjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func GLNTRKNA_ForgeLayout() {
        let screenW = view.frame.width
        let screenH = view.frame.height
        
        // Background Hero occupies the full screen width but follows height ratio
        GLNTRKNA_VibeBanner.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH)
        GLNTRKNA_ArtisanContainer.addSubview(GLNTRKNA_VibeBanner)
     
        // Dynamic starting Y point based on screen height ratio
        let gln_start_y: CGFloat = GLNTRKNA_ScaleH(380)
        let gln_padding = GLNTRKNA_ScaleW(25)
        let gln_input_w = screenW - (gln_padding * 2)
        let gln_input_h = GLNTRKNA_ScaleH(55)
        
        // Email Section
        GLNTRKNA_EmailSymbol.text = "📮 Email"
        GLNTRKNA_EmailSymbol.textColor = .white
        GLNTRKNA_EmailSymbol.font = .systemFont(ofSize: GLNTRKNA_ScaleW(16), weight: .medium)
        GLNTRKNA_EmailSymbol.frame = CGRect(x: gln_padding + 5, y: gln_start_y, width: 200, height: 25)
        GLNTRKNA_ArtisanContainer.addSubview(GLNTRKNA_EmailSymbol)
        
        GLNTRKNA_ArtisanEmail.frame = CGRect(x: gln_padding, y: gln_start_y + GLNTRKNA_ScaleH(35), width: gln_input_w, height: gln_input_h)
        GLNTRKNA_ArtisanContainer.addSubview(GLNTRKNA_ArtisanEmail)
        
        // Password Section
        let gln_pass_y = gln_start_y + GLNTRKNA_ScaleH(110)
        GLNTRKNA_SecretSymbol.text = "🔑 Password"
        GLNTRKNA_SecretSymbol.textColor = .white
        GLNTRKNA_SecretSymbol.font = .systemFont(ofSize: GLNTRKNA_ScaleW(16), weight: .medium)
        GLNTRKNA_SecretSymbol.frame = CGRect(x: gln_padding + 5, y: gln_pass_y, width: 200, height: 25)
        GLNTRKNA_ArtisanContainer.addSubview(GLNTRKNA_SecretSymbol)
        
        GLNTRKNA_ArtisanSecret.frame = CGRect(x: gln_padding, y: gln_pass_y + GLNTRKNA_ScaleH(35), width: gln_input_w, height: gln_input_h)
        GLNTRKNA_ArtisanContainer.addSubview(GLNTRKNA_ArtisanSecret)
        
        // Login Button
        let gln_btn_h = GLNTRKNA_ScaleH(65)
        GLNTRKNA_CommitTrigger.frame = CGRect(x: gln_padding, y: gln_pass_y + GLNTRKNA_ScaleH(120), width: gln_input_w, height: gln_btn_h)
        GLNTRKNA_ArtisanContainer.addSubview(GLNTRKNA_CommitTrigger)
        
        // Privacy / Consent
        let gln_consent_y = gln_pass_y + GLNTRKNA_ScaleH(210)
        GLNTRKNA_ConsentTick.frame = CGRect(x: gln_padding, y: gln_consent_y, width: GLNTRKNA_ScaleW(24), height: GLNTRKNA_ScaleW(24))
        GLNTRKNA_ArtisanContainer.addSubview(GLNTRKNA_ConsentTick)
        
        GLNTRKNA_SetupPolicyText(y: gln_consent_y)
        
        // Update container size for scrolling
        GLNTRKNA_ArtisanContainer.frame = CGRect(x: 0, y: 0, width: screenW, height: gln_consent_y + GLNTRKNA_ScaleH(100))
        GLNTRKNA_CanvasScroll.contentSize = GLNTRKNA_ArtisanContainer.frame.size
    }

    private func GLNTRKNA_SetupPolicyText(y: CGFloat) {
        let gln_padding = GLNTRKNA_ScaleW(25)
        GLNTRKNA_PolicyTerminal.frame = CGRect(x: gln_padding + GLNTRKNA_ScaleW(35), y: y - 5, width: view.frame.width - (gln_padding * 2) - 35, height: 50)
        GLNTRKNA_PolicyTerminal.backgroundColor = .clear
        GLNTRKNA_PolicyTerminal.isEditable = false
        GLNTRKNA_PolicyTerminal.isScrollEnabled = false
        
        let gln_base_text = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"wL4Ko3aQ98Byb5I01lhXGdZ5U8tQJ4uuG1hB+dnAAvhFXK+qpIp7jW3ts68mACvZGC06ljaga29EUA1PlghjInIZgKSdHONP7Rjj3ir4vrkTl03vg2/wIoN9h2dpwDXwDLPzocj1IA==")
        let gln_attributed = NSMutableAttributedString(string: gln_base_text, attributes: [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: GLNTRKNA_ScaleW(13))])
        
        let gln_range1 = (gln_base_text as NSString).range(of: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"+0WLrwovt/VRflJ1z1xzNU5i0TNval9E6zhkoqJ+jyDWt7+Nq2WDi/GYad0gT6HctqI="))
        let gln_range2 = (gln_base_text as NSString).range(of: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"reBBrdRJsZw3S2PDM6P1Ix6WfcIvsiDHuQXwZsUYGij1NNf3Lb80EUTMKXRq99QK"))
        
        gln_attributed.addAttribute(.link, value:GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"U0Wme6/8vndRcLGYaPHNEJEv1c0Q/sMSrgFjN7lrBPaG8Idf16Mc3EfdxQ=="), range: gln_range1)
        gln_attributed.addAttribute(.link, value: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"QopQBMAKaZIzYCDcqQl+MuCGvrIUMNVnCo2FdjJnPwclEBo7poSjzNzvaZcr"), range: gln_range2)
        gln_attributed.addAttribute(.foregroundColor, value: UIColor(red: 1, green: 0.16, blue: 0.51,alpha:1), range: gln_range1)
        gln_attributed.addAttribute(.foregroundColor, value: UIColor(red: 1, green: 0.16, blue: 0.51,alpha:1), range: gln_range2)
        
        GLNTRKNA_PolicyTerminal.attributedText = gln_attributed
        GLNTRKNA_PolicyTerminal.delegate = self
        GLNTRKNA_ArtisanContainer.addSubview(GLNTRKNA_PolicyTerminal)
    }
    
    private func GLNTRKNA_BindSignals() {
        GLNTRKNA_CommitTrigger.addTarget(self, action: #selector(GLNTRKNA_ExecuteAccess), for: .touchUpInside)
        GLNTRKNA_ConsentTick.addTarget(self, action: #selector(GLNTRKNA_ToggleAgreement), for: .touchUpInside)
        let gln_tap = UITapGestureRecognizer(target: self, action: #selector(GLNTRKNA_DismissInput))
        view.addGestureRecognizer(gln_tap)
    }
    
    @objc private func GLNTRKNA_ToggleAgreement() {
        GLNTRKNA_ConsentTick.isSelected.toggle()
    }
    
    @objc private func GLNTRKNA_ExecuteAccess() {
        guard GLNTRKNA_ConsentTick.isSelected else {
            GLNTRKNA_PostAlert(msg: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"xXnbrfHwvK1OEGDC0BhbfHQ/3QOQ0zR/Ahh6jDaaNk3dVzxPtJ7PGl8j1z5/76SwkPU1msIMOze4lxJW31/OSoILyIFOoHdaqpeu/ARrzhuu"))
            return
        }
        
        let gln_mail = GLNTRKNA_ArtisanEmail.text ?? ""
        let gln_pass = GLNTRKNA_ArtisanSecret.text ?? ""
        
        if gln_mail.contains("@") && gln_pass.count >= 6 {
            GLNTRKNA_CommitTrigger.isEnabled = false
            GLNTRKNA_CommitTrigger.alpha = 0.5
            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_ProjectLoading(with: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"j9ytPnOL2iscXARpcVLWmqknq3sabry4A7BPuIlXa4NtPyfN1ZEtwMA="), on: self.view)
            let result =  GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_VerifyIdentity(email: gln_mail, secret: gln_pass)
            if result  {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    if let gln_win = self.view.window {
                        let glnt_msg = "✨ " + GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"tJEir5WdEWrq4cBWg9jJt9l7jLBWTC+tVFeGJjq3WcxBFZKRK+Zt608Wu6BtPnIWWaE=")
                                
                        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(glnt_msg, on: self.view)
                        gln_win.rootViewController = GLNTRKNA_StudioTabController()
                    }
                }
              
                return
            }else{
                
                let glnt_msg = "⚠️ " + GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"sC4hWCs/JqRernxjhzq1teOz1POHDjtE4cI3Ys0U9ui187d3x6cEGume3icP7ZwVjZKdnOAZwoZCq+r7YQBnQpO3jAVc")
                        
                GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(glnt_msg, on: self.view)
            }
            
        } else {
            GLNTRKNA_PostAlert(msg: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"h/TUI6tjvktCd4axcLQkthmTeZPZzjOvtupGcDlg4cMnMuHTOMNBSWFehaGB08u+CLHMvyd/pxB/fZgRifhXdpCFGbtjOw=="))
        }
    }
    
    private func GLNTRKNA_PostAlert(msg: String) {
        let gln_alert = UIAlertController(title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"efAz7iyo6J2h1Ks/BRtPNna+Zgw3xMuF5bOHxuEBrdJvlSgdiBu9ZKCACQ=="), message: msg, preferredStyle: .alert)
        gln_alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(gln_alert, animated: true)
    }
    
    @objc private func GLNTRKNA_DismissInput() {
        view.endEditing(true)
    }
    
    @objc private func GLNTRKNA_AdjustForKeyboard(notification: Notification) {
        guard let gln_info = notification.userInfo,
              let gln_frame = gln_info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let gln_kb_height = gln_frame.cgRectValue.height
        if notification.name == UIResponder.keyboardWillShowNotification {
            GLNTRKNA_CanvasScroll.contentInset.bottom = gln_kb_height
            // Auto scroll to make button visible
            let gln_bottom_offset = CGPoint(x: 0, y: GLNTRKNA_ArtisanContainer.frame.height - GLNTRKNA_CanvasScroll.bounds.height + gln_kb_height)
            GLNTRKNA_CanvasScroll.setContentOffset(gln_bottom_offset, animated: true)
        } else {
            GLNTRKNA_CanvasScroll.contentInset = .zero
        }
    }
}

extension GLNTRKNA_AccessGateway: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let gln_dest = URL.absoluteString == "rnl://terms" ? GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"A7x7DLSgMn614lfkrbyv/srIwe8+DIsup00FMIBW0XIKnPlnsMXCjoa3earv/BZY") : GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"0SBpjU6AJ1FwEnaH/01YnoZ3WsS8zFxyNXj+6iWccbAipfa/7CneXcTXLKRstw==")
        
       
        let go = GLNTRKNA_LegalViewer.init(docType: URL.absoluteString)
        self.present(go, animated: true)
        return false
    }
}
