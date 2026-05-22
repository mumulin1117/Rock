//
//  RockWelcomeStudioController.swift
//  RockGlint
//

import UIKit

class RockWelcomeStudioController: UIViewController {
    
    private let heroBackdrop = UIImageView()
    private let appleBadgeButton = UIButton(type: .custom)
    private let emailLoginButton = UIButton(type: .custom)
    private let emailButtonGradient = CAGradientLayer()
    private let eulaBadgeButton = UIButton(type: .custom)
    private let policyCheckButton = UIButton(type: .custom)
    private let policyTextView = PolishDoneTextView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildWelcomeStudio()
    }
    
    private func buildWelcomeStudio() {
        view.backgroundColor = RockEntryManicureKit.midnightLacquer
        
        heroBackdrop.frame = view.bounds
        heroBackdrop.image = RockEntryManicureKit.polishSlice(unsealPolishText("19s1Adhp95WB8PZ+5ZwaRIDy8WX1bZCAVVU5vKXA58892AisLw6t9UavkCW+sZ7MLakGNw=="))
        heroBackdrop.contentMode = .scaleAspectFill
        heroBackdrop.clipsToBounds = true
        view.addSubview(heroBackdrop)
        
        eulaBadgeButton.frame = RockEntryManicureKit.studioFrame(280, 64, 80, 36)
        eulaBadgeButton.setImage(RockEntryManicureKit.polishSlice(unsealPolishText("G2Zv25VxBgHjoK2+Q8zg2l+0qJfhUW7BfHoeWWvisP7EQF/i/jZwWlUvAjC+je+OVgcMJA==")), for: .normal)
        eulaBadgeButton.addTarget(self, action: #selector(openEula), for: .touchUpInside)
        view.addSubview(eulaBadgeButton)
        
        appleBadgeButton.frame = RockEntryManicureKit.studioFrame(15, 618, 64, 64)
        appleBadgeButton.setImage(RockEntryManicureKit.polishSlice(unsealPolishText("+wXzjOafygKrYMR30TGnWsFRgaJc70dwUofVH+gsE1YK8/9gxq9hadHMueVAug0tUGF+Vzs=")), for: .normal)
        appleBadgeButton.addTarget(self, action: #selector(performAppleSignIn), for: .touchUpInside)
        view.addSubview(appleBadgeButton)
        
        emailLoginButton.frame = RockEntryManicureKit.studioFrame(88, 618, 272, 64)
        emailLoginButton.layer.cornerRadius = polishCanvasH(32)
        emailLoginButton.layer.masksToBounds = true
        emailLoginButton.setTitle(unsealPolishText("o/W9KJx3l/+MeW03IvtuNhV0AXGcAtqzTnpfD3OfGPYi5YL+Zhs5NjQ="), for: .normal)
        emailLoginButton.setTitleColor(.white, for: .normal)
        emailLoginButton.titleLabel?.font = .boldSystemFont(ofSize: polishCanvasW(20))
        emailLoginButton.addTarget(self, action: #selector(openEmailLogin), for: .touchUpInside)
        view.addSubview(emailLoginButton)
        emailButtonGradient.frame = emailLoginButton.bounds
        emailButtonGradient.colors = [
            UIColor(red: 1.00, green: 0.72, blue: 0.80, alpha: 1).cgColor,
            UIColor(red: 0.86, green: 0.34, blue: 0.95, alpha: 1).cgColor
        ]
        emailButtonGradient.startPoint = CGPoint(x: 0, y: 0.5)
        emailButtonGradient.endPoint = CGPoint(x: 1, y: 0.5)
        emailLoginButton.layer.insertSublayer(emailButtonGradient, at: 0)
        
        policyCheckButton.frame = RockEntryManicureKit.studioFrame(22, 720, 22, 22)
        policyCheckButton.setImage(RockEntryManicureKit.polishSlice(unsealPolishText("fKt+MH4/LeNI6SzNNQWGsdvYmkr+/dSx0d4ZS+6hmx5+RzJ9sjWt2ElA4Y8Bq4NBiENJuqb0QIg=")), for: .normal)
        policyCheckButton.setImage(RockEntryManicureKit.polishSlice(unsealPolishText("i7l06BT7dvnI5ZTFQeSNJm3cDwD841pXvFDMxgGKajsF41BanIT+ZIDTiaqq5WeLYIicOpD2I1EeEA==")), for: .selected)
        policyCheckButton.addTarget(self, action: #selector(toggleWelcomeConsent), for: .touchUpInside)
        view.addSubview(policyCheckButton)
        
        policyTextView.frame = RockEntryManicureKit.studioFrame(50, 718, 306, 58)
        RockEntryManicureKit.lacePolicyLinks(policyTextView)
        policyTextView.delegate = self
        view.addSubview(policyTextView)
        
        let emailLoginHotspot = UIButton(type: .custom)
        emailLoginHotspot.frame = RockEntryManicureKit.studioFrame(118, 476, 139, 111)
        emailLoginHotspot.addTarget(self, action: #selector(openEmailLogin), for: .touchUpInside)
        view.addSubview(emailLoginHotspot)
    }
    
    @objc private func toggleWelcomeConsent() {
        policyCheckButton.isSelected.toggle()
    }
    
    @objc private func openEula() {
        present(RockPolicyScrollController(docType: unsealPolishText("IrXSRSgati22OeytH/RHisxFuaim/TlPmuMhMSebozU5DTGPZqmyawQ5ynEOoopP")), animated: true)
    }
    
    @objc private func openEmailLogin() {
        navigationController?.pushViewController(RockEmailLoginController(alwaysShowsSignupCharm: true), animated: true)
    }
    
    @objc private func performAppleSignIn() {
        guard policyCheckButton.isSelected else {
            flashWelcomeNotice(unsealPolishText("FoUONJX3ABVZQrN3LBrQUvWEsv4VYzWbkLelbwH9LfwNgJ6IpW5PnYpQcw7zpvirnmcsU4D4aljOqDPbxx5p9d7xfwfNtR8BAy9yQe83hfbk1H0="))
            return
        }
        
        RockStudioServiceBridge.showLoading(unsealPolishText("zbXvVuLaMtLXSt30t/q6w5CFiM4GOyPazqD9O4IDKiGG6bCvAqvF1Wt9Is4+iQ=="), on: view)
        ApplePolishSignInBridge.sharedPolishBridge.requestApplePolishSignIn(from: self) { [weak self] success, message in
            guard let self = self else { return }
            RockStudioServiceBridge.hideLoading()
            if success, let window = self.view.window {
                window.rootViewController = RockStudioServiceBridge.studioTabController()
            } else {
                self.flashWelcomeNotice(message ?? unsealPolishText("WTmISbJZJ38SO/Nqt3EfObGgoxCH/wU0GE8ckMTyDiqdOgF9htURlHlkb6HwWojegzk="))
            }
        }
    }
    
    private func flashWelcomeNotice(_ msg: String) {
        RockStudioServiceBridge.flash(unsealPolishText("0OWFhBPt7uqMSJUiBhLR0kD6X3dUevTDcUouxYsHAP87yxopEifl") + msg, on: view)
    }
}

extension RockWelcomeStudioController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        present(RockPolicyScrollController(docType: RockEntryManicureKit.policyDocTitle(from: URL)), animated: true)
        return false
    }
}
