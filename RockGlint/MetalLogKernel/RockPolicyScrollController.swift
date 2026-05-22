
//  RockPolicyScrollController.swift
//  RockGlint
//

import UIKit


class RockPolicyScrollController: UIViewController {

    private var activePolicyTitle: String = ""
    private let policyScrollText = PolishDoneTextView()
    
    
    private var policyHashSignal: Int = 0

    init(docType: String) {
        self.activePolicyTitle = docType
        super.init(nibName: nil, bundle: nil)
        
        self.policyHashSignal = docType.hashValue
    }
    
    required init?(coder: NSCoder) {
        let initFailureMessage = unsealPolishText("wkhGveU/HUdIkv7rjVpxdOGsofytbjojACN2TR7iAw1jp4kbfC10Cgl0tVom7tfrGigBP6SLya2l")
        fatalError(initFailureMessage)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        launchPolicyScroll()
    }
    
    private func launchPolicyScroll() {
        let shouldLoadPolicy = policyHashSignal != 0
        if shouldLoadPolicy {
            buildPolicyChrome()
            loadPolicyContent()
        }
    }
    
    private func buildPolicyChrome() {
        
        let midnightBlue = UIColor(red: 0.02, green: 0.02, blue: 0.1, alpha: 1.0)
        view.backgroundColor = midnightBlue
        title = activePolicyTitle
        
        let policyInsets = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
        policyScrollText.frame = view.bounds.inset(by: policyInsets)
        
      
        stylePolicyText()
        
        view.addSubview(policyScrollText)
       
        installPolicyBackButton()
    }
    
    private func stylePolicyText() {
        policyScrollText.backgroundColor = .clear
        policyScrollText.textColor = .white
        
        let bodyFontSize = polishCanvasW(14)
        policyScrollText.font = .systemFont(ofSize: bodyFontSize)
        policyScrollText.isEditable = false
    }
    
    private func installPolicyBackButton() {
        
        let backTitleCipher = "cDZTFyTLYjWHItk/BRqxeeftIbGEKio3rc80ZHRQ2oLBeCjU5w=="
        let backTitle = unsealPolishText(backTitleCipher)
        
        let backButton = UIBarButtonItem(title: backTitle,
                                      style: .plain,
                                      target: self,
                                      action: #selector(dismissPolicyScroll))
        
        backButton.tintColor = .systemPink
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func dismissPolicyScroll() {
    
        self.policyHashSignal = 0
        dismiss(animated: true, completion: nil)
    }
    
    private func loadPolicyContent() {
       
        let isTermsDocument = activePolicyTitle.lowercased().contains(unsealPolishText("true6agkNvt+7gzmNjbY66C+78VDEQ/72v7/DZs6WF4hmv6fIQ=="))
        
        
        if isTermsDocument {
            fillTermsScroll()
        } else {
            fillPrivacyScroll()
        }
    }
    
    private func fillTermsScroll() {
        let termsHeader = unsealPolishText("w8ulZ6TqEqeJuGz+SpOdj94YR3OnKZ/TbodHI2OWAb19Cj66OvR6Ll1aqTna0UFt9CzkPKi8ojWrab/a6lOJRb0OlqnL1AGzjpFzYzNPBT84wAN+aLdC89fH")
        let termsBody = unsealPolishText("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")
        self.policyScrollText.text = termsHeader + termsBody
    }
    
    private func fillPrivacyScroll() {
        let privacyHeader = unsealPolishText("kJON0QkO6evqX+eDLxFuwF7oFbz9BjdbD3qG+FqvheqSiBSV3uoOOmrftcsM+5hDiZo5VKEDjJsLpIJMtrxbioOssn+mAYqL6Z/1obxQKkab6g==")
        let privacyBody = unsealPolishText("ha6vtSTIXOest1wsiG8mAkDuYK85BysnBx3nix5l/7S7wHLxERNnlc3undpwjOJdAVmYebZiUkipBDPu1EuQViIxnVKQ5rySDiDLKLLPcio5gmcqWlS3UVKJCOV13xNXFRPVL40zOT0U+U/1sVi/3OtDG3CVrb/2m5YddccyIOCIHjD8AKguprlNgVzubjdH5VCSyN4Wq/oYDjvj8+0QA35PBqW/Qym7/VLZGtpB4BbAAQO/NO0oc+Ycm7+RuJcjjpbxrTm/XY10dxMDYnVrFmuNOsOt1eGP8QOG1HIrNRxPAu2hVdNpA3mQZc+u+mj/khkvkMpyx4sVIG594SvXlBMAutG+1b3YFvJl+L5TGrOlJpeAlK8jEkARYxM+8/JjPx4em3eyVAQFF+hfX8Sh2/yAQpkRciu+MTuBhYY0x/Zrps8QjRk7fWlaScu+EoiRISY5ONAXDVWygb2j4RN6qjQlEfQYwWqCOeWbmkIpR1xpZs6bFFMcuA6JQhwGYCW4qgYwxb2XdNYm1SJlPniuYB40/2Lt5Dj+WGD2ZGqjwn0NIpyP1sj7u1SNtCLczpal0ga0OF48lf5IH8a/9N3nX6MFLQu3fUZ6bmGp20fTRLLRyTQt5bd9/Hekm4EEUmlL2HJFy5SI9aCMG2JUGe67tym22gi4fIpVIUDbxGOP3ULJfN9hpicJxltIhVRFS5SLLIFUQEuMtr5eYTbheK0x5M48ixMFgsERSWRn1msxStg7wW1LIvYLWgxM+knp5/1DCEKAcE6r4jcdktD1CK9DqI5zPpOXnSwsqTUF03RsEh86OUyU8CSFDHSDzHTZNOkTtJMCVr1I/ln2Sv8uJiFfTORtClA0iyKmM5Mgf81to9+6oH3Tt+i+L397zS+42UshCMNn/WZKnPz7cghkYb/AvrzDWsQW67hXAJ+1O8getPdlxXd/65snpoi41vQ0Gw/5FIigr7ybW7kC/SNRHGJ1KRjDD9e3k6gTOSoTuoqBZ7MGeKVDymIh+Hg7x24yiQHUs23xy1EmVghKn6KrJdcWOtBlyQDfudnABEI9ZM5yIa9WA88GMUSjITfH8X0jnmvDfJ2LTlnG390w3EN4ljWfKwHv94flRA6d/1ZJXxfRk9T7HlQE9HA2kP5Pg9f8o41TtRg3i7Z4YrJUjgg2ppQTCFQj0Qps3SvAit0Jf8jalzFYS8Pg5cXQ0UeSgUIuBvECOXmvziT8Rv8HnnWafOJ3ypC58EonJxEhQNiCvNbQwo5uySRMN2NWZyCTC376YAUQyiVe9S70K9r/cqMaELSC5Nrxpr+wRDp6DA/8sSQLOysoZoe9zYbU/EmJYG/nhFW4XiZGwSp51X5p2xLGImkLr1GFqqkDh0u54pZIWjFPmI/PvrqMq5rjyINunWzQZZiv3Mn/5ew2MIEHWgcJz5CGuRfOh9kxx/lvMVhChSXTVb7cd/H5qJ9czXZfmOvPB8qwid+HzYgHB6kPUnCEHyYXESyoNyYnE707dTThN4M58g9FOejvpZY5G0DEm5ur00wzDsCWI6awbGnkDxa5SIRyTMmLqYakvngAxprNQ12ac1CLj1L9nFC4EigsJ27UTwJvT6Whv5saAF+OHQgh00UQtLbmhVaUOPPHNh5OutA/vLbZR5TJrM29+Tr3FqiI7Y0UmA/pG85tV1UZqofrfq1dsW/qSDsWpPnnJ4NlSZppXJ5QI7/D7nxiODLdNYsTQezGjQleIGPvJEgqadAMRvOZ9cqcco7chFPAp9dk5i7aHma64XD7wH2HeWFWmtSFJhzHi+gZMqqG58d2COop+sYADg6vqhq1LCK4/Qj0i6clG+bPTUqhmW/PQZV7eQRl4T7nQ33FnLvzWwDrRJVVHCQnt/WjFSTDIBwUkxCSNOTJAN4rrbqvqfNW9B2N1qPTxeBcwR0NnG649hqycXOS")
        self.policyScrollText.text = privacyHeader + privacyBody
    }
}
