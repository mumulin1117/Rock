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
        gln_img.image = UIImage(named: "gln_rkna_login_hero")
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
        gln_tf.attributedPlaceholder = NSAttributedString(string: "Enter your email", attributes: [.foregroundColor: UIColor.lightGray])
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
        gln_tf.attributedPlaceholder = NSAttributedString(string: "Enter your password", attributes: [.foregroundColor: UIColor.lightGray])
        return gln_tf
    }()
    
    private let GLNTRKNA_CommitTrigger: UIButton = {
        let gln_btn = UIButton()
        gln_btn.setBackgroundImage(UIImage(named: "GLNTRKNA_CommitTrigger"), for: .normal)
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
        
        let gln_base_text = "By continuing you agree to our <Terms of Service> and <Privacy Policy>."
        let gln_attributed = NSMutableAttributedString(string: gln_base_text, attributes: [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: GLNTRKNA_ScaleW(13))])
        
        let gln_range1 = (gln_base_text as NSString).range(of: "<Terms of Service>")
        let gln_range2 = (gln_base_text as NSString).range(of: "<Privacy Policy>")
        
        gln_attributed.addAttribute(.link, value: "rnl://terms", range: gln_range1)
        gln_attributed.addAttribute(.link, value: "rnl://privacy", range: gln_range2)
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
            GLNTRKNA_PostAlert(msg: "Please accept the Terms and Privacy Policy first.")
            return
        }
        
        let gln_mail = GLNTRKNA_ArtisanEmail.text ?? ""
        let gln_pass = GLNTRKNA_ArtisanSecret.text ?? ""
        
        if gln_mail.contains("@") && gln_pass.count >= 6 {
            GLNTRKNA_CommitTrigger.isEnabled = false
            GLNTRKNA_CommitTrigger.alpha = 0.5
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                if let gln_win = self.view.window {
                   // Navigate to main workspace here
                }
            }
        } else {
            GLNTRKNA_PostAlert(msg: "Invalid Email or Password credentials.")
        }
    }
    
    private func GLNTRKNA_PostAlert(msg: String) {
        let gln_alert = UIAlertController(title: "Rock Studio", message: msg, preferredStyle: .alert)
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
        let gln_dest = URL.absoluteString == "rnl://terms" ? "Terms of Service" : "Privacy Policy"
        
       
        let go = GLNTRKNA_LegalViewer.init(docType: URL.absoluteString)
        self.present(go, animated: true)
        return false
    }
}
