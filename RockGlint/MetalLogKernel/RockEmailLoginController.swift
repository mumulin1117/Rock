//
//  RockEmailLoginController.swift
//  RockGlint
//

import UIKit

class RockEmailLoginController: UIViewController, UITextFieldDelegate {

    private let alwaysShowsSignupCharm: Bool
    private let heroBackdrop = UIImageView()
    private let loginTitle = UILabel()
    private let emailCaption = UILabel()
    private let passwordCaption = UILabel()
    
    private let emailPolishField: PolishDoneTextField = {
        let field = PolishDoneTextField()
        field.keyboardType = .emailAddress
        return field
    }()
    
    private let secretPolishField: PolishDoneTextField = {
        let field = PolishDoneTextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginGlossButton = UIButton(type: .custom)
    private let signupOutlineButton = UIButton(type: .custom)
    private let policyCheckButton = UIButton(type: .custom)
    private let policyLinkTextView = PolishDoneTextView()

    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    init(alwaysShowsSignupCharm: Bool = false) {
        self.alwaysShowsSignupCharm = alwaysShowsSignupCharm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.alwaysShowsSignupCharm = false
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildEmailLoginCanvas()
        bindLoginControls()
        refreshLoginButtonState()
    }
    
    private func buildEmailLoginCanvas() {
        view.backgroundColor = RockEntryManicureKit.midnightLacquer
        
        heroBackdrop.frame = view.bounds
        heroBackdrop.image = RockEntryManicureKit.polishSlice(unsealPolishText("MMtjRAIDMUxFzffE8+g/zeEOxaV5K+MITE+8xm0XdNVcJTL7VgEg40bDFy/UEfzf5hmpjUsNM9sIGycq"))
        heroBackdrop.contentMode = .scaleAspectFill
        heroBackdrop.clipsToBounds = true
        view.addSubview(heroBackdrop)
        
        let backButton = RockEntryManicureKit.backCharmButton(target: self, action: #selector(returnToWelcomeStudio))
        view.addSubview(backButton)
        
        loginTitle.frame = RockEntryManicureKit.studioFrame(0, 58, 375, 32)
        loginTitle.text = unsealPolishText("ZqVbi4idzrR7Mltyy45eFQO3I1F7JI+eVNZFlQ4XRdgY1Ba/2g==")
        loginTitle.textColor = .white
        loginTitle.textAlignment = .center
        loginTitle.font = .boldSystemFont(ofSize: polishCanvasW(18))
        view.addSubview(loginTitle)
        
        emailCaption.text = unsealPolishText("E1+asigvZ+TK6KtJmL2yDXfHkFpIF7bu46/hAZT1mJWSiW4o93chGQ4=")
        emailCaption.frame = RockEntryManicureKit.studioFrame(22, 318, 190, 24)
        emailCaption.textColor = .white
        emailCaption.font = .systemFont(ofSize: polishCanvasW(17), weight: .semibold)
        view.addSubview(emailCaption)
        
        emailPolishField.frame = RockEntryManicureKit.studioFrame(20, 354, 335, 49)
        RockEntryManicureKit.stylePolishField(emailPolishField, placeholder: unsealPolishText("tZ3mpzRQSXWdYZbxACff1blgc0JhYuzAC3QgMt0b+7iEEuKcKvnpz2Z8hzzp3WlQ"))
        view.addSubview(emailPolishField)
        
        passwordCaption.text = unsealPolishText("23I9Kg+vhCz6QpHeZDl5DFbos2eqAxsVi/o6SLr6rYWqHowq8KP7zDhzjgU=")
        passwordCaption.frame = RockEntryManicureKit.studioFrame(22, 447, 190, 24)
        passwordCaption.textColor = .white
        passwordCaption.font = .systemFont(ofSize: polishCanvasW(17), weight: .semibold)
        view.addSubview(passwordCaption)
        
        secretPolishField.frame = RockEntryManicureKit.studioFrame(20, 480, 335, 49)
        RockEntryManicureKit.stylePolishField(secretPolishField, placeholder: unsealPolishText("R5INmljLS72OsFN9j+4eyb/htRVJlIRs9tXV3hsRWQ0QL3BjbZY9d6aw9UTeAvXeKT+0"), secure: true)
        view.addSubview(secretPolishField)
        
        loginGlossButton.setBackgroundImage(RockEntryManicureKit.polishSlice(unsealPolishText("XprWAsLv3TDeeHhSZ7TgvdGRJ2y5CZT3vpmBYCC1MzUjkf8q3yvR+QzvEwvH4lAhjUR4xGF/")), for: .normal)
        loginGlossButton.addTarget(self, action: #selector(performEmailLogin), for: .touchUpInside)
        view.addSubview(loginGlossButton)
        
        signupOutlineButton.frame = RockEntryManicureKit.studioFrame(15, 638, 345, 64)
        signupOutlineButton.setBackgroundImage(RockEntryManicureKit.polishSlice(unsealPolishText("G5aH48gY3SJn8WDHCN7JPWUuvrk0UGSyT2/J8GTq86i9yYl/jo4ijRTUOPx/jcW7Ao/Tr33IldU=")), for: .normal)
        signupOutlineButton.addTarget(self, action: #selector(openAccountSignup), for: .touchUpInside)
        view.addSubview(signupOutlineButton)
        
        policyCheckButton.frame = RockEntryManicureKit.studioFrame(22, 720, 22, 22)
        policyCheckButton.setImage(RockEntryManicureKit.polishSlice(unsealPolishText("fKt+MH4/LeNI6SzNNQWGsdvYmkr+/dSx0d4ZS+6hmx5+RzJ9sjWt2ElA4Y8Bq4NBiENJuqb0QIg=")), for: .normal)
        policyCheckButton.setImage(RockEntryManicureKit.polishSlice(unsealPolishText("i7l06BT7dvnI5ZTFQeSNJm3cDwD841pXvFDMxgGKajsF41BanIT+ZIDTiaqq5WeLYIicOpD2I1EeEA==")), for: .selected)
        policyCheckButton.isSelected = true
        view.addSubview(policyCheckButton)
        
        policyLinkTextView.frame = RockEntryManicureKit.studioFrame(50, 718, 306, 58)
        RockEntryManicureKit.lacePolicyLinks(policyLinkTextView)
        policyLinkTextView.delegate = self
        view.addSubview(policyLinkTextView)
    }
    
    private func bindLoginControls() {
        policyCheckButton.addTarget(self, action: #selector(togglePolicyAgreement), for: .touchUpInside)
        emailPolishField.addTarget(self, action: #selector(refreshLoginButtonState), for: .editingChanged)
        secretPolishField.addTarget(self, action: #selector(refreshLoginButtonState), for: .editingChanged)
        
        let keyboardTap = UITapGestureRecognizer(target: self, action: #selector(dismissPolishKeyboard))
        keyboardTap.cancelsTouchesInView = false
        view.addGestureRecognizer(keyboardTap)
    }
    
    @objc private func refreshLoginButtonState() {
        let isReadyForLogin = (emailPolishField.text?.isEmpty == false) && (secretPolishField.text?.isEmpty == false)
        let showsSignupButton = alwaysShowsSignupCharm || isReadyForLogin
        loginGlossButton.frame = RockEntryManicureKit.studioFrame(15, showsSignupButton ? 562 : 638, 345, 64)
        loginGlossButton.alpha = isReadyForLogin ? 1.0 : 0.5
        signupOutlineButton.isHidden = showsSignupButton == false
    }
    
    @objc private func togglePolicyAgreement() {
        policyCheckButton.isSelected.toggle()
    }
    
    @objc private func returnToWelcomeStudio() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func openAccountSignup() {
        navigationController?.pushViewController(RockAccountSignupController(), animated: true)
    }
    
    @objc private func performEmailLogin() {
        guard policyCheckButton.isSelected else {
            presentLoginNotice(msg: unsealPolishText("xXnbrfHwvK1OEGDC0BhbfHQ/3QOQ0zR/Ahh6jDaaNk3dVzxPtJ7PGl8j1z5/76SwkPU1msIMOze4lxJW31/OSoILyIFOoHdaqpeu/ARrzhuu"))
            return
        }
        
        let email = emailPolishField.text ?? unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw=")
        let secret = secretPolishField.text ?? unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw=")
        
        if email.contains(unsealPolishText("xXjKT4TTyGvR81mUztkhN5noAWawsHpAtTyLBAPmr0gH")) && secret.count >= 6 {
            loginGlossButton.isEnabled = false
            loginGlossButton.alpha = 0.5
            RockStudioServiceBridge.showLoading(unsealPolishText("j9ytPnOL2iscXARpcVLWmqknq3sabry4A7BPuIlXa4NtPyfN1ZEtwMA="), on: self.view)
            let result = RockStudioServiceBridge.verifyIdentity(email: email, secret: secret)
            if result {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    if let window = self.view.window {
                        let toastMessage = unsealPolishText("Dae38yoVlpgQ49a+x2TAnav8SBPE0nf2PcwJO6Ic3n7JNSCu") + unsealPolishText("tJEir5WdEWrq4cBWg9jJt9l7jLBWTC+tVFeGJjq3WcxBFZKRK+Zt608Wu6BtPnIWWaE=")
                        RockStudioServiceBridge.flash(toastMessage, on: self.view)
                        window.rootViewController = RockStudioServiceBridge.studioTabController()
                    }
                }
                return
            } else {
                let toastMessage = unsealPolishText("0OWFhBPt7uqMSJUiBhLR0kD6X3dUevTDcUouxYsHAP87yxopEifl") + unsealPolishText("sC4hWCs/JqRernxjhzq1teOz1POHDjtE4cI3Ys0U9ui187d3x6cEGume3icP7ZwVjZKdnOAZwoZCq+r7YQBnQpO3jAVc")
                RockStudioServiceBridge.flash(toastMessage, on: self.view)
                loginGlossButton.isEnabled = true
                refreshLoginButtonState()
            }
        } else {
            presentLoginNotice(msg: unsealPolishText("h/TUI6tjvktCd4axcLQkthmTeZPZzjOvtupGcDlg4cMnMuHTOMNBSWFehaGB08u+CLHMvyd/pxB/fZgRifhXdpCFGbtjOw=="))
        }
    }
    
    private func presentLoginNotice(msg: String) {
        let noticeAlert = UIAlertController(title: unsealPolishText("EhvfS4J+YL6JcHTC7IAdHrT1EhI97AmYA20NmpZODmvkbqGbMFQ="), message: msg, preferredStyle: .alert)
        noticeAlert.addAction(UIAlertAction(title: unsealPolishText("5Gd6yaeTcpDyoFJNMdlUKyFOLpTG9AxEfin6PWRNfxGMZA=="), style: .default))
        present(noticeAlert, animated: true)
    }
    
    @objc private func dismissPolishKeyboard() {
        view.endEditing(true)
    }
}

extension RockEmailLoginController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        present(RockPolicyScrollController(docType: RockEntryManicureKit.policyDocTitle(from: URL)), animated: true)
        return false
    }
}
