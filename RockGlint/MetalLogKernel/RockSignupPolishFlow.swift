//
//  RockSignupPolishFlow.swift
//  RockGlint
//

import UIKit

struct RockAccountDraft {
    let draftEmail: String
    let draftSecret: String
}

class RockAccountSignupController: UIViewController {
    
    private let heroBackdrop = UIImageView()
    private let signupEmailField = PolishDoneTextField()
    private let signupSecretField = PolishDoneTextField()
    private let signupGradientButton = UIButton(type: .custom)
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildSignupCanvas()
    }
    
    private func buildSignupCanvas() {
        view.backgroundColor = RockEntryManicureKit.midnightLacquer
        
        heroBackdrop.frame = view.bounds
        heroBackdrop.image = RockEntryManicureKit.polishSlice(unsealPolishText("GT+1u94dYR3DY8Oq7NObUgiIhiaf+uOSbY8AR9tA4jolfumc3KIjEeoWBcl3Jna9L1S7kR3YD3dO"))
        heroBackdrop.contentMode = .scaleAspectFill
        heroBackdrop.clipsToBounds = true
        view.addSubview(heroBackdrop)
        
        view.addSubview(RockEntryManicureKit.backCharmButton(target: self, action: #selector(returnToEmailLogin)))
        
        RockEntryManicureKit.fieldGemLabel(unsealPolishText("E1+asigvZ+TK6KtJmL2yDXfHkFpIF7bu46/hAZT1mJWSiW4o93chGQ4="), frame: RockEntryManicureKit.studioFrame(22, 318, 190, 24), in: view)
        signupEmailField.frame = RockEntryManicureKit.studioFrame(20, 354, 335, 49)
        RockEntryManicureKit.stylePolishField(signupEmailField, placeholder: unsealPolishText("tZ3mpzRQSXWdYZbxACff1blgc0JhYuzAC3QgMt0b+7iEEuKcKvnpz2Z8hzzp3WlQ"))
        signupEmailField.keyboardType = .emailAddress
        view.addSubview(signupEmailField)
        
        RockEntryManicureKit.fieldGemLabel(unsealPolishText("23I9Kg+vhCz6QpHeZDl5DFbos2eqAxsVi/o6SLr6rYWqHowq8KP7zDhzjgU="), frame: RockEntryManicureKit.studioFrame(22, 447, 190, 24), in: view)
        signupSecretField.frame = RockEntryManicureKit.studioFrame(20, 480, 335, 49)
        RockEntryManicureKit.stylePolishField(signupSecretField, placeholder: unsealPolishText("R5INmljLS72OsFN9j+4eyb/htRVJlIRs9tXV3hsRWQ0QL3BjbZY9d6aw9UTeAvXeKT+0"), secure: true)
        view.addSubview(signupSecretField)
        
        signupGradientButton.frame = RockEntryManicureKit.studioFrame(15, 638, 345, 64)
        signupGradientButton.setBackgroundImage(RockEntryManicureKit.polishSlice(unsealPolishText("R5TPt+8/UMDxIpH3ytBzFF0LyBuszpAVXAdorN1HH9ByHUhi9PPbKBIE/OE32uso4Zbcbw==")), for: .normal)
        signupGradientButton.addTarget(self, action: #selector(continueToProfilePolish), for: .touchUpInside)
        view.addSubview(signupGradientButton)
        
        let keyboardTap = UITapGestureRecognizer(target: self, action: #selector(dismissPolishKeyboard))
        keyboardTap.cancelsTouchesInView = false
        view.addGestureRecognizer(keyboardTap)
    }
    
    @objc private func returnToEmailLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func dismissPolishKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func continueToProfilePolish() {
        let draftEmail = signupEmailField.text ?? unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw=")
        let draftSecret = signupSecretField.text ?? unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw=")
        guard draftEmail.contains(unsealPolishText("xXjKT4TTyGvR81mUztkhN5noAWawsHpAtTyLBAPmr0gH")), draftSecret.count >= 6 else {
            RockStudioServiceBridge.flash(unsealPolishText("5C49RLbYdKOeorAIJnm5CzB+DwRGHsgsJyxk2y2YeyFdjV1QtIgqMgTXcNz365PMx9uKFkFcNjA0Afe62HStCLfHdH1nKhF0mRf7T7urig=="), on: view)
            return
        }
        let accountDraft = RockAccountDraft(draftEmail: draftEmail, draftSecret: draftSecret)
        navigationController?.pushViewController(RockProfilePolishController(accountDraft: accountDraft), animated: true)
    }
}

class RockProfilePolishController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let accountDraft: RockAccountDraft
    private let heroBackdrop = UIImageView()
    private let profileAvatarView = UIImageView()
    private let nicknamePolishField = PolishDoneTextField()
    private let birthdayValueLabel = UILabel()
    private let bioPolishTextView = PolishDoneTextView()
    
    private let bioPlaceholder = unsealPolishText("dhr58YUuYZ61ukgJP9WWBow2D1mV3I1pL/wLqJlmHv+o3VkCJmvt4LKiWxhJTQpu+ZW9K73B08/Yxoh+BFsgvJRDO1OldAJZHg==")
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    init(accountDraft: RockAccountDraft) {
        self.accountDraft = accountDraft
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError(unsealPolishText("Lh8fInKF2tif7EvfO749MVXf0glTHs/Tu9bLm14SmtGO8AEctCT1j3P9M6rrtRZFUg==")) }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildProfilePolishForm()
    }
    
    private func buildProfilePolishForm() {
        view.backgroundColor = RockEntryManicureKit.midnightLacquer
        
        heroBackdrop.frame = view.bounds
        heroBackdrop.image = RockEntryManicureKit.polishSlice(unsealPolishText("k+X/aLScQWXisvQYOz9VjKThMT5Q3NoeDU1yueRa1pZ1JCaEqGq5hgnV2zCh3qK8f2tb"))
        heroBackdrop.contentMode = .scaleAspectFill
        heroBackdrop.clipsToBounds = true
        view.addSubview(heroBackdrop)
        
        view.addSubview(RockEntryManicureKit.backCharmButton(target: self, action: #selector(returnToSignup)))
        
        profileAvatarView.frame = RockEntryManicureKit.studioFrame(137, 112, 102, 102)
        profileAvatarView.layer.cornerRadius = profileAvatarView.bounds.height / 2
        profileAvatarView.clipsToBounds = true
        profileAvatarView.backgroundColor = UIColor(white: 1, alpha: 0.08)
        profileAvatarView.contentMode = .scaleAspectFill
        profileAvatarView.image = RockStudioServiceBridge.vaultGraphic(named: unsealPolishText("m+SNPACZVZpWyEfBOb2ZaCniUpv1vvfpXHM27nGG0k5ZGfqYJOM+s1FUww==")) ?? RockStudioServiceBridge.vaultGraphic(named: unsealPolishText("OLvZPdpQWugWpm5QBHWe7hkZqLKkz0CwITgJj9qA39D7oKSPI5WFlKmxk1Xe"))
        profileAvatarView.isUserInteractionEnabled = true
        profileAvatarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showAvatarSourceSheet)))
        view.addSubview(profileAvatarView)
        
        let cameraIcon = UIImageView(frame: RockEntryManicureKit.studioFrame(168, 142, 40, 40))
        cameraIcon.image = RockEntryManicureKit.polishSlice(unsealPolishText("HLZVYNbAMsqfdvCV/nDWjDiHfURh0yhH93rzLfKhXxXMYpEQcK2gXy9S2+K0LXF2"))
        cameraIcon.contentMode = .scaleAspectFit
        view.addSubview(cameraIcon)
        
        addProfileRow(title: unsealPolishText("xV4Uw/XK6NwaZytw+87CnoW6QOCBnzlLZTHkZ9adO2bUJ8VRAtrbhg=="), y: 242, content: nicknamePolishField)
        nicknamePolishField.text = unsealPolishText("D+bdz5kSoZOZhqI4hXuY4jcoCuPnOlHQLIDiPgIdKYsDoJo3+LYtTNkp")
        nicknamePolishField.placeholder = unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw=")
        
        let birthdayRow = UIControl(frame: RockEntryManicureKit.studioFrame(15, 324, 345, 70))
        styleProfilePanel(birthdayRow)
        birthdayRow.addTarget(self, action: #selector(pickBirthday), for: .touchUpInside)
        view.addSubview(birthdayRow)
        addRowLabel(unsealPolishText("UIJPtNykLq10L78blL0JqopIL4MbllR9BJubbejcOQIGp/p/DzEVVw=="), in: birthdayRow)
        birthdayValueLabel.frame = CGRect(x: birthdayRow.bounds.width - polishCanvasW(250), y: 0, width: polishCanvasW(214), height: birthdayRow.bounds.height)
        birthdayValueLabel.text = unsealPolishText("EDIuFVe28g/flwK7F+ejHezsOdWW+T2G0GGwV6tFq7EzpH1aATJBQ3eRefBpDw7DHw==")
        birthdayValueLabel.textColor = RockEntryManicureKit.softStudioCopy
        birthdayValueLabel.textAlignment = .right
        birthdayValueLabel.font = .systemFont(ofSize: polishCanvasW(16), weight: .regular)
        birthdayRow.addSubview(birthdayValueLabel)
        addChevron(in: birthdayRow)
        
        let aboutPanel = UIView(frame: RockEntryManicureKit.studioFrame(15, 406, 345, 224))
        styleProfilePanel(aboutPanel)
        view.addSubview(aboutPanel)
        addRowLabel(unsealPolishText("FBWvtDXt7u9XUjdIDmVmodmu9uBvsJhRK3+zkc9rcHq1fWY+TNRK8g=="), in: aboutPanel, height: polishCanvasH(62))
        bioPolishTextView.frame = CGRect(x: polishCanvasW(15), y: polishCanvasH(68), width: aboutPanel.bounds.width - polishCanvasW(30), height: polishCanvasH(132))
        bioPolishTextView.backgroundColor = .clear
        bioPolishTextView.textColor = RockEntryManicureKit.softStudioCopy
        bioPolishTextView.tintColor = RockEntryManicureKit.hotGlossLink
        bioPolishTextView.font = .systemFont(ofSize: polishCanvasW(16), weight: .regular)
        bioPolishTextView.textContainerInset = .zero
        bioPolishTextView.textContainer.lineFragmentPadding = 0
        bioPolishTextView.text = bioPlaceholder
        bioPolishTextView.delegate = self
        aboutPanel.addSubview(bioPolishTextView)
        addChevron(in: aboutPanel, y: polishCanvasH(23))
        
        let enterButton = UIButton(type: .custom)
        enterButton.frame = RockEntryManicureKit.studioFrame(15, 684, 345, 64)
        enterButton.setBackgroundImage(RockEntryManicureKit.polishSlice(unsealPolishText("VFvPnPCFMs+XcaIcUGAYhAUexPR9nHqYYWvgrp8KKxhggpML7WdCceyvMbleSc0jPANY")), for: .normal)
        enterButton.addTarget(self, action: #selector(enterRockStudio), for: .touchUpInside)
        view.addSubview(enterButton)
        
        let keyboardTap = UITapGestureRecognizer(target: self, action: #selector(dismissPolishKeyboard))
        keyboardTap.cancelsTouchesInView = false
        view.addGestureRecognizer(keyboardTap)
    }
    
    private func addProfileRow(title: String, y: CGFloat, content: UITextField) {
        let profileRow = UIView(frame: RockEntryManicureKit.studioFrame(15, y, 345, 70))
        styleProfilePanel(profileRow)
        view.addSubview(profileRow)
        addRowLabel(title, in: profileRow)
        content.frame = CGRect(x: profileRow.bounds.width - polishCanvasW(220), y: 0, width: polishCanvasW(184), height: profileRow.bounds.height)
        content.backgroundColor = .clear
        content.textColor = RockEntryManicureKit.softStudioCopy
        content.tintColor = RockEntryManicureKit.hotGlossLink
        content.textAlignment = .right
        content.font = .systemFont(ofSize: polishCanvasW(16), weight: .regular)
        content.leftView = nil
        content.clearButtonMode = .never
        profileRow.addSubview(content)
        addChevron(in: profileRow)
    }
    
    private func styleProfilePanel(_ view: UIView) {
        view.backgroundColor = RockEntryManicureKit.violetPolishPanel
        view.layer.cornerRadius = polishCanvasH(15)
        view.clipsToBounds = true
    }
    
    private func addRowLabel(_ text: String, in panel: UIView, height: CGFloat? = nil) {
        let rowLabel = UILabel(frame: CGRect(x: polishCanvasW(15), y: 0, width: polishCanvasW(150), height: height ?? panel.bounds.height))
        rowLabel.text = text
        rowLabel.textColor = .white
        rowLabel.font = .boldSystemFont(ofSize: polishCanvasW(18))
        panel.addSubview(rowLabel)
    }
    
    private func addChevron(in panel: UIView, y: CGFloat? = nil) {
        let chevronIcon = UIImageView(frame: CGRect(x: panel.bounds.width - polishCanvasW(28), y: y ?? ((panel.bounds.height - polishCanvasH(22)) / 2), width: polishCanvasW(22), height: polishCanvasH(22)))
        chevronIcon.image = RockEntryManicureKit.polishSlice(unsealPolishText("4rNNdMz1luACFIbKsM+gyHFD028KZC1eA1hRtfKuL18jW6kYb0S42mou8hij/aWtOg=="))
        chevronIcon.contentMode = .scaleAspectFit
        chevronIcon.tintColor = RockEntryManicureKit.chevronGlossPink
        panel.addSubview(chevronIcon)
    }
    
    @objc private func returnToSignup() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func dismissPolishKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func showAvatarSourceSheet() {
        let sourceSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        sourceSheet.addAction(UIAlertAction(title: unsealPolishText("NoUAIcnca9+JBRJuIP0b01S0X9lq1w15EKIvXTutTaU9XM9WdrUs22F2"), style: .default) { _ in
            self.openAvatarPicker(source: .camera)
        })
        sourceSheet.addAction(UIAlertAction(title: unsealPolishText("lAYB+SQowC8Bszc4vsnW4zwcOjzyiq06f6+jroA2yXmEXIF03zrxRzqQdA=="), style: .default) { _ in
            self.openAvatarPicker(source: .photoLibrary)
        })
        sourceSheet.addAction(UIAlertAction(title: unsealPolishText("RX1QGpQcc6q+ihFG7U4D7tya/2rOf5yqvg9twrS2oQRuSqAX9c4="), style: .cancel))
        present(sourceSheet, animated: true)
    }
    
    private func openAvatarPicker(source: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(source) else {
            RockStudioServiceBridge.flash(unsealPolishText("cjikbStEOSMJZkdwhAxRY1S8MZo06AnHFvLmy6OeXOYniJq4Rv65Co3HyP1rgRMRDATUfCH/KXyA2x68wA=="), on: view)
            return
        }
        let picker = UIImagePickerController()
        picker.sourceType = source
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
            profileAvatarView.image = pickedImage
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    @objc private func pickBirthday() {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = Date()
        
        let birthdaySheet = UIAlertController(title: unsealPolishText("UIJPtNykLq10L78blL0JqopIL4MbllR9BJubbejcOQIGp/p/DzEVVw=="), message: unsealPolishText("kriKYmtBHdGxoOF04/+iGeLoMFB0jhuXhEasjSW9utMkMoClgJUSqg=="), preferredStyle: .actionSheet)
        picker.frame = CGRect(x: 0, y: 30, width: view.bounds.width - 20, height: 210)
        birthdaySheet.view.addSubview(picker)
        birthdaySheet.addAction(UIAlertAction(title: unsealPolishText("RX1QGpQcc6q+ihFG7U4D7tya/2rOf5yqvg9twrS2oQRuSqAX9c4="), style: .cancel))
        birthdaySheet.addAction(UIAlertAction(title: unsealPolishText("X0cjeDBf/h3j0EaykAHKQxVGuQxjykiyELlw3Sjopbqkg1H1"), style: .default) { _ in
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: unsealPolishText("924HWb5/bYI4u4I25Euq0oXpdPgJ30kmlRKxi2beFwaUBug5DQvE4lwrQA=="))
            dateFormatter.dateFormat = unsealPolishText("OcMkJHXvFI76f9iiIOloQpbXwEpRzOn13Wpmw9rSj+M2Bjty1MNsMZ9IKzvG")
            self.birthdayValueLabel.text = dateFormatter.string(from: picker.date)
        })
        present(birthdaySheet, animated: true)
    }
    
    @objc private func enterRockStudio() {
        let loginResult = RockStudioServiceBridge.verifyIdentity(
            email: accountDraft.draftEmail,
            secret: accountDraft.draftSecret
        )
        guard loginResult else {
            RockStudioServiceBridge.flash(unsealPolishText("1H54iwDZhu92upt3vWCWOyTN3vSn1Dv4i9AqwOGitb0zGUDC5zV9FcFmmKyqc6yLgpwpwYJvi1lt+/jTcIKXe0dUVAap2Y4ggAmeU76UYKE8Bt+l/gbcABr5zw=="), on: view)
            return
        }
        
        let profileBio = bioPolishTextView.text == bioPlaceholder ? unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw=") : bioPolishTextView.text
        RockStudioServiceBridge.reviseProfileVisual(
            alias: nicknamePolishField.text,
            bio: profileBio,
            birthday: birthdayValueLabel.text,
            avatarImage: profileAvatarView.image
        )
        
        if let window = view.window {
            window.rootViewController = RockStudioServiceBridge.studioTabController()
        }
    }
}

extension RockProfilePolishController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == bioPlaceholder {
            textView.text = unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw=")
            textView.textColor = .white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = bioPlaceholder
            textView.textColor = RockEntryManicureKit.softStudioCopy
        }
    }
}
