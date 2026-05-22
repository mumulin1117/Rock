//
//  RockEntryManicureKit.swift
//  RockGlint
//

import UIKit

extension CGFloat {
    static var polishWidthRatio: CGFloat {
        UIScreen.main.bounds.width / 375.0
    }
    
    static var polishHeightRatio: CGFloat {
        UIScreen.main.bounds.height / 812.0
    }
}

func polishCanvasW(_ value: CGFloat) -> CGFloat {
    value * .polishWidthRatio
}

func polishCanvasH(_ value: CGFloat) -> CGFloat {
    value * .polishHeightRatio
}

enum RockEntryManicureKit {
    
    static let midnightLacquer = UIColor(red: 0.02, green: 0.02, blue: 0.10, alpha: 1)
    static let violetPolishPanel = UIColor(red: 0.13, green: 0.08, blue: 0.25, alpha: 1)
    static let softStudioCopy = UIColor(red: 0.66, green: 0.63, blue: 0.73, alpha: 1)
    static let hotGlossLink = UIColor(red: 1.00, green: 0.13, blue: 0.48, alpha: 1)
    static let chevronGlossPink = UIColor(red: 0.95, green: 0.50, blue: 0.94, alpha: 1)
    
    static func studioFrame(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        CGRect(
            x: polishCanvasW(x),
            y: polishCanvasH(y),
            width: polishCanvasW(width),
            height: polishCanvasH(height)
        )
    }
    
    static func polishSlice(_ name: String) -> UIImage? {
        if let loadedImage = UIImage(named: name) {
            return loadedImage
        }
        
        let pngExtension = unsealPolishText("Yy9z1jamAqNpIQEb+u2AezlFGdKtq4e871TWyYjfVZa5zBc=")
        let sliceFolder = unsealPolishText("k1lpwv8CeKjAjYDopINhtb1nStMn94zZ+a2LQ3LnNi+oDB9wk8vDTkH0")
        let retinaSuffix = unsealPolishText("zueCp0Pld1H2uqnpJtEd1pMbA4MxvBg4WinWJZEYITLXLV4=")
        let imageCandidates: [(String, String, String?)] = [
            (name, pngExtension, sliceFolder),
            (name + retinaSuffix, pngExtension, sliceFolder),
            (name, pngExtension, nil),
            (name + retinaSuffix, pngExtension, nil)
        ]
        
        for candidate in imageCandidates {
            if let imageURL = Bundle.main.url(forResource: candidate.0, withExtension: candidate.1, subdirectory: candidate.2),
               let diskImage = UIImage(contentsOfFile: imageURL.path) {
                return diskImage
            }
        }
        return nil
    }
    
    static func pinBackdropSlice(_ name: String, to view: UIView) -> UIImageView {
        let loadedImage = UIImageView(frame: view.bounds)
        loadedImage.image = polishSlice(name)
        loadedImage.contentMode = .scaleAspectFill
        loadedImage.clipsToBounds = true
        view.addSubview(loadedImage)
        return loadedImage
    }
    
    static func backCharmButton(target: Any?, action: Selector) -> UIButton {
        let backButton = UIButton(type: .custom)
        backButton.frame = studioFrame(3, 42, 48, 48)
        backButton.setImage(polishSlice(unsealPolishText("cUDX/aS3VDwuhH3WFCCJi6X8FPhZmunvvNA9NLcpz8DUb9z1yNnrr0C5GknuIQ==")), for: .normal)
        backButton.addTarget(target, action: action, for: .touchUpInside)
        backButton.imageView?.contentMode = .scaleAspectFit
        return backButton
    }
    
    static func stylePolishField(_ field: PolishDoneTextField, placeholder: String, secure: Bool = false) {
        field.backgroundColor = violetPolishPanel
        field.layer.cornerRadius = polishCanvasH(10)
        field.clipsToBounds = true
        field.textColor = .white
        field.tintColor = hotGlossLink
        field.font = .systemFont(ofSize: polishCanvasW(16), weight: .regular)
        field.isSecureTextEntry = secure
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: polishCanvasW(16), height: 1))
        field.leftViewMode = .always
        field.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: softStudioCopy,
                .font: UIFont.systemFont(ofSize: polishCanvasW(16), weight: .regular)
            ]
        )
    }
    
    @discardableResult
    static func fieldGemLabel(_ text: String, frame: CGRect, in view: UIView) -> UILabel {
        let fieldLabel = UILabel(frame: frame)
        fieldLabel.text = text
        fieldLabel.textColor = .white
        fieldLabel.font = .systemFont(ofSize: polishCanvasW(17), weight: .semibold)
        view.addSubview(fieldLabel)
        return fieldLabel
    }
    
    static func lacePolicyLinks(_ textView: PolishDoneTextView, compact: Bool = false) {
        let policyCopy = unsealPolishText("nFd2wAw5Ei/espY/FMjGDS2Sb72NW/u/jAlDH+1LAGFKFDKWzUmFzsEiZGrJi27iSqBOEEPQHH9m06gauQgnmygr98WS8gLWqiZrsBrRv08larOdsCHdliA53kpDSMVZtLeHaSbXdw==")
        let policyFont = UIFont.systemFont(ofSize: polishCanvasW(compact ? 13 : 14), weight: .regular)
        let policyText = NSMutableAttributedString(
            string: policyCopy,
            attributes: [
                .foregroundColor: softStudioCopy,
                .font: policyFont
            ]
        )
        let termsRange = (policyCopy as NSString).range(of: unsealPolishText("IB+UVJg0HHsrPFOqyYLmhyHAl1S9SZM1B0JM/dNovVdcud+DceN+4F0uUlIiB5SGMgQ="))
        let privacyRange = (policyCopy as NSString).range(of: unsealPolishText("oDEDg+xiMKn1QXWPZ9LSbru3VmjnNcRGMB4HFjmf1JMEBPgZiwnIfLEn1Yd2QsbR"))
        let linkAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: hotGlossLink,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        policyText.addAttributes(linkAttributes, range: termsRange)
        policyText.addAttributes(linkAttributes, range: privacyRange)
        policyText.addAttribute(.link, value: unsealPolishText("j34y/SDLehe0ECRGNTRYSBZqhCdUo6CDyOlMEAWiyBGYH3oKitEkr/PhVg=="), range: termsRange)
        policyText.addAttribute(.link, value: unsealPolishText("lnhfHJWhu8r2B3EfzG6ROJvVpVxkPWYjpPlH5R8o1gzz+PJMOtTTe2huzUPL"), range: privacyRange)
        
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.linkTextAttributes = linkAttributes
        textView.attributedText = policyText
    }
    
    static func policyDocTitle(from url: URL) -> String {
        url.absoluteString == unsealPolishText("j34y/SDLehe0ECRGNTRYSBZqhCdUo6CDyOlMEAWiyBGYH3oKitEkr/PhVg==") ? unsealPolishText("IrXSRSgati22OeytH/RHisxFuaim/TlPmuMhMSebozU5DTGPZqmyawQ5ynEOoopP") : unsealPolishText("pQk6yIOEWVCOV6v3I832bK8bZYQ1vHn8DmP036HEJun9+YYzXuGc6ZMhwei1BA==")
    }
}
