//
//  GLNTRKNA_MutualGlintGate.swift
//  RockGlint
//
//  Created by RockGlint on 2026/5/22.
//

import UIKit

enum GLNTRKNA_ConnectionIntent {
    case GLNTRKNA_PrivateChat
    case GLNTRKNA_VideoChat
}

final class GLNTRKNA_MutualGlintGate {
    static func GLNTRKNA_RequestPassage(from GLNTRKNAHost: UIViewController, toward GLNTRKNATarget: GLNTRKNA_MomentEntry, intent: GLNTRKNA_ConnectionIntent, unlocked: @escaping () -> Void) {
        if GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_IsMutualAdoring(targetEmail: GLNTRKNATarget.glnt_userId) {
            unlocked()
            return
        }
        
        let GLNTRKNAPrompt = GLNTRKNA_MutualGlintPromptController(GLNTRKNACelestialData: GLNTRKNATarget, GLNTRKNAIntent: intent)
        GLNTRKNAPrompt.GLNTRKNA_UnlockBridge = unlocked
        GLNTRKNAHost.present(GLNTRKNAPrompt, animated: true)
    }
}

final class GLNTRKNA_MutualGlintPromptController: UIViewController {
    var GLNTRKNA_UnlockBridge: (() -> Void)?
    
    private let GLNTRKNACelestialData: GLNTRKNA_MomentEntry
    private let GLNTRKNAIntent: GLNTRKNA_ConnectionIntent
    
    private let GLNTRKNA_Shade = UIControl()
    private let GLNTRKNA_CardImage = UIImageView()
    private let GLNTRKNA_LockImage = UIImageView()
    private let GLNTRKNA_TitleLabel = UILabel()
    private let GLNTRKNA_MessageLabel = UILabel()
    private let GLNTRKNA_FollowButton = UIButton(type: .custom)
    private let GLNTRKNA_CloseButton = UIButton(type: .custom)
    
    init(GLNTRKNACelestialData: GLNTRKNA_MomentEntry, GLNTRKNAIntent: GLNTRKNA_ConnectionIntent) {
        self.GLNTRKNACelestialData = GLNTRKNACelestialData
        self.GLNTRKNAIntent = GLNTRKNAIntent
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError(unsealPolishText("8M7F4AoQB4o1FG6vQGulqAaL7OuliW4mMpmZ5GlfaJTEBV2cFAneW7dbtAiyzLSuD7zO1ZttVtmhGuUEp5yrO843EUqD"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_BuildMutualPrompt()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        GLNTRKNA_LayoutMutualPrompt()
    }
    
    private func GLNTRKNA_BuildMutualPrompt() {
        view.backgroundColor = .clear
        
        GLNTRKNA_Shade.backgroundColor = UIColor.black.withAlphaComponent(0.58)
        GLNTRKNA_Shade.addTarget(self, action: #selector(GLNTRKNA_ClosePrompt), for: .touchUpInside)
        view.addSubview(GLNTRKNA_Shade)
        
        GLNTRKNA_CardImage.image = GLNTRKNA_LoadConnectionSlice(unsealPolishText("fFNP26IRyqV6icvIhnomehW+px3P+9pfhl8+hAFrYTj0DASvKJly5sBlCiLfFePb"))?.resizableImage(withCapInsets: UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32), resizingMode: .stretch)
        GLNTRKNA_CardImage.contentMode = .scaleToFill
        view.addSubview(GLNTRKNA_CardImage)
        
        GLNTRKNA_LockImage.image = GLNTRKNA_LoadConnectionSlice(unsealPolishText("9aNGrWbNdGSEwfbuvf5sR/inLSQvqpJusJJfe5z40T3a7M6iMGmdqljtkZuoOmqd"))
        GLNTRKNA_LockImage.contentMode = .scaleAspectFit
        view.addSubview(GLNTRKNA_LockImage)
        
        GLNTRKNA_TitleLabel.text = GLNTRKNAIntent == .GLNTRKNA_PrivateChat ? unsealPolishText("gRjO6pouH6ZMv7x8KWkGxEfZNXG1W6513QHDDvvIpkirmGgDXaqWSVxP4iSuDQ==") : unsealPolishText("YSz8aXQkH2XdBhV5691jcISRjtag9HotpEfxGIcN2zG+wqdgB736rLjY4JdQAdA9qqP9dQ==")
        GLNTRKNA_TitleLabel.textColor = .white
        GLNTRKNA_TitleLabel.textAlignment = .center
        GLNTRKNA_TitleLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        GLNTRKNA_TitleLabel.adjustsFontSizeToFitWidth = true
        GLNTRKNA_TitleLabel.minimumScaleFactor = 0.72
        view.addSubview(GLNTRKNA_TitleLabel)
        
        GLNTRKNA_MessageLabel.text = GLNTRKNAIntent == .GLNTRKNA_PrivateChat ? unsealPolishText("Vs0ta5n3IEe3B8rjBFfwQSkJzhK5IRduQLVRKvgdaYfW1RcQQtPgBD/XU1MlbjZtleM1425IG0unk4adR4q+4VAjPBgsDJ6apAndPaThiNUcG7EJbgdvU68pZ4EuEqrxY3PzQfg6") : unsealPolishText("HQNU3c2k/g9u9YRv+YvgIaw2T8hEfz+AJIS+tjp4ZLrWpvA6yMUEwx6Q6SPMT+Ay1VwedxQ22kUHGrpEFnNAIwgnmZ4qrQxlcur1X7i+mTj7iVqy")
        GLNTRKNA_MessageLabel.textColor = UIColor(white: 1, alpha: 0.72)
        GLNTRKNA_MessageLabel.textAlignment = .center
        GLNTRKNA_MessageLabel.font = .systemFont(ofSize: 15, weight: .medium)
        GLNTRKNA_MessageLabel.numberOfLines = 2
        view.addSubview(GLNTRKNA_MessageLabel)
        
        if let GLNTRKNAButtonImage = GLNTRKNA_LoadConnectionSlice(unsealPolishText("Khh0RGaYaOleaQR4WnEblDPl5D3f4EGqOL8m1KeNIkQ93GAu+BvNs2RPK1bBwZEZ8aZunHkw/ZPO")) {
            GLNTRKNA_FollowButton.setBackgroundImage(GLNTRKNAButtonImage.resizableImage(withCapInsets: UIEdgeInsets(top: 24, left: 40, bottom: 24, right: 40), resizingMode: .stretch), for: .normal)
        } else {
            GLNTRKNA_FollowButton.setTitle(unsealPolishText("pZz/j0SyBkrHKc3sPVKSElZk4c5+7EgjSUHtV5HnFjLArDguCHk="), for: .normal)
            GLNTRKNA_FollowButton.backgroundColor = .systemPink
            GLNTRKNA_FollowButton.layer.cornerRadius = 24
        }
        GLNTRKNA_FollowButton.addTarget(self, action: #selector(GLNTRKNA_FollowToUnlock), for: .touchUpInside)
        view.addSubview(GLNTRKNA_FollowButton)
        
        GLNTRKNA_CloseButton.setBackgroundImage(GLNTRKNA_LoadConnectionSlice(unsealPolishText("9NyW0gukmOBqbZyTANVf/58MhHymZ3Iu7IXegNeWPjL4fNPmwqA+BLqR4AywuGHTrA==")), for: .normal)
        GLNTRKNA_CloseButton.setImage(UIImage(systemName: unsealPolishText("9gvyrSNLbVg3FgsKcQx2W3R3AsXvtrTeWXILo6fwqTXmN4RyCQ==")), for: .normal)
        GLNTRKNA_CloseButton.tintColor = UIColor(red: 0.12, green: 0.09, blue: 0.22, alpha: 1)
        GLNTRKNA_CloseButton.addTarget(self, action: #selector(GLNTRKNA_ClosePrompt), for: .touchUpInside)
        view.addSubview(GLNTRKNA_CloseButton)
    }
    
    private func GLNTRKNA_LayoutMutualPrompt() {
        GLNTRKNA_Shade.frame = view.bounds
        
        let GLNTRKNAX = view.bounds.width / 375.0
        let GLNTRKNAY = view.bounds.height / 812.0
        
        GLNTRKNA_CardImage.frame = CGRect(x: 30 * GLNTRKNAX, y: 289 * GLNTRKNAY, width: 315 * GLNTRKNAX, height: 234 * GLNTRKNAY)
        GLNTRKNA_LockImage.frame = CGRect(x: 125 * GLNTRKNAX, y: 241 * GLNTRKNAY, width: 124 * GLNTRKNAX, height: 90 * GLNTRKNAY)
        GLNTRKNA_TitleLabel.frame = CGRect(x: 49 * GLNTRKNAX, y: 350 * GLNTRKNAY, width: 277 * GLNTRKNAX, height: 30 * GLNTRKNAY)
        GLNTRKNA_MessageLabel.frame = CGRect(x: 55 * GLNTRKNAX, y: 389 * GLNTRKNAY, width: 265 * GLNTRKNAX, height: 44 * GLNTRKNAY)
        GLNTRKNA_FollowButton.frame = CGRect(x: 54 * GLNTRKNAX, y: 450 * GLNTRKNAY, width: 267 * GLNTRKNAX, height: 48 * GLNTRKNAY)
        GLNTRKNA_CloseButton.frame = CGRect(x: 173 * GLNTRKNAX, y: 537 * GLNTRKNAY, width: 30 * GLNTRKNAX, height: 30 * GLNTRKNAX)
    }
    
    @objc private func GLNTRKNA_FollowToUnlock() {
        let GLNTRKNAOrb = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb
        if GLNTRKNAOrb.GLNTRKNA_IsAdoring(targetEmail: GLNTRKNACelestialData.glnt_userId) == false {
            GLNTRKNAOrb.GLNTRKNA_ToggleAdoration(targetEmail: GLNTRKNACelestialData.glnt_userId)
        }
        
        let GLNTRKNAUnlocked = GLNTRKNAOrb.GLNTRKNA_IsMutualAdoring(targetEmail: GLNTRKNACelestialData.glnt_userId)
        let GLNTRKNABridge = GLNTRKNA_UnlockBridge
        dismiss(animated: true) {
            if GLNTRKNAUnlocked {
                GLNTRKNABridge?()
            }
        }
    }
    
    @objc private func GLNTRKNA_ClosePrompt() {
        dismiss(animated: true)
    }
    
    private func GLNTRKNA_LoadConnectionSlice(_ GLNTRKNAName: String) -> UIImage? {
        if let GLNTRKNAImage = UIImage(named: GLNTRKNAName) {
            return GLNTRKNAImage
        }
        if let GLNTRKNAPath = Bundle.main.path(forResource: GLNTRKNAName + unsealPolishText("zueCp0Pld1H2uqnpJtEd1pMbA4MxvBg4WinWJZEYITLXLV4="), ofType: unsealPolishText("Yy9z1jamAqNpIQEb+u2AezlFGdKtq4e871TWyYjfVZa5zBc=")) {
            return UIImage(contentsOfFile: GLNTRKNAPath)
        }
        return nil
    }
}
