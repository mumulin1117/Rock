
//  GLNTRKNA_LegalViewer.swift
//  RockGlint
//

import UIKit

class GLNTRKNA_LegalViewer: UIViewController {

    private var GLNTRKNA_ActiveDocType: String = ""
    private let GLNTRKNA_DocTerminal = UITextView()
    
    init(docType: String) {
        self.GLNTRKNA_ActiveDocType = docType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("GLNTRKNA_Init_Error")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_SetupAesthetics()
        GLNTRKNA_DeployContent()
    }
    
    private func GLNTRKNA_SetupAesthetics() {
        view.backgroundColor = UIColor(red: 0.02, green: 0.02, blue: 0.1, alpha: 1.0)
        title = GLNTRKNA_ActiveDocType
        
        GLNTRKNA_DocTerminal.frame = view.bounds.inset(by: UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15))
        GLNTRKNA_DocTerminal.backgroundColor = .clear
        GLNTRKNA_DocTerminal.textColor = .white
        GLNTRKNA_DocTerminal.font = .systemFont(ofSize: GLNTRKNA_ScaleW(14))
        GLNTRKNA_DocTerminal.isEditable = false
        view.addSubview(GLNTRKNA_DocTerminal)
        
        // Custom Back Button to match Rock style
        let gln_back = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(GLNTRKNA_DismissVault))
        gln_back.tintColor = .systemPink
        navigationItem.leftBarButtonItem = gln_back
    }
    
    @objc private func GLNTRKNA_DismissVault() {
        dismiss(animated: true, completion: nil)
    }
    
    private func GLNTRKNA_DeployContent() {
        // In a real app, these strings would be loaded from a local .txt or .json
        if GLNTRKNA_ActiveDocType.contains("terms") {
            GLNTRKNA_DocTerminal.text = """
Terms of Service (ToS)
Effective Date: February 01, 2026

Welcome to Rock, the digital hangout for nail art enthusiasts. By entering our studio, you acknowledge your acceptance of these Terms of Service.

1. The Rock Experience: Rock provides a social and creative platform integrating Naily AI for trend forecasting and style recreation. We facilitate interaction through messages and video synchronization.

2. Intellectual Property: All "Rock" branding, the Naily AI engine, and the GLNTRKNA architecture are the exclusive property of the Company. Users retain ownership of their original manicure photos but grant Rock a perpetual, royalty-free license to display such content within the community gallery.

3. AI Disclaimer: Naily AI is a generative tool intended for creative inspiration. Rock does not guarantee that AI-generated designs are achievable in real-life applications or that they meet specific safety standards for chemical use in nail salons.

4. Local Data & Account Security: Since Rock utilizes a local artisan vault for session management, you are responsible for maintaining the integrity of your device. Rock does not store your "Secret Symbol" (password) on its own servers; loss of local data may result in loss of access to your curated inspiration boards.

5. Community Interactions: While we encourage casual video chats and style swapping, Rock is not responsible for the conduct of any user. Users must remain respectful; any harassment reported through the "Rock Alert" system will be investigated.

End User License Agreement (EULA)
Effective Date: February 01, 2026

This End User License Agreement ("Agreement") is a binding legal contract between you ("Artisan") and Rock ("Company"). By accessing the Rock Studio, you agree to be bound by the terms herein.

1. Grant of License: Rock grants you a personal, non-exclusive, non-transferable license to use the application for the curation and sharing of nail art inspirations. This license is strictly for your personal, non-commercial aesthetic expression.

2. User Conduct Restrictions: You agree not to use Rock for any purpose that is unlawful or prohibited by these terms. Restricted actions include, but are not limited to:

Uploading content that is predatory, hateful, or sexually explicit.

Utilizing Naily AI to generate imagery that infringes on third-party intellectual property.

Attempting to reverse-engineer the GLNTRKNA proprietary code or AI algorithms.

Spamming the community gallery with repetitive or non-nail-related media.

Engaging in "jailbreaking" the app environment to bypass security protocols.

3. Termination of Access: Rock reserves the right, in its sole discretion, to terminate your access to the platform without prior notice if:

You violate any conduct restrictions mentioned in Section 2.

Your actions pose a security risk to the Rock community or infrastructure.

You engage in fraudulent activities regarding the local artisan database. Upon termination, your license to use the software is immediately revoked, and you must cease all use of the application.

4. Limitation of Liability: The software is provided "as-is." Rock is not liable for any physical reactions resulting from following nail art trends or for data loss within the local vault.

Contact: master@rocknail.io
""" // Full text here
        } else {
            GLNTRKNA_DocTerminal.text = """
Privacy Policy
Effective Date: February 01, 2026

At Rock, we respect the privacy of every Artisan. This policy outlines how we handle your aesthetic data and personal identifiers.

1. Information Collection: We collect minimal data to facilitate the Rock experience:

Artisan Identifiers: Email and encrypted password for local session access.

Creative Content: Photos of manicures you choose to post to the public gallery.

Device Permissions: Access to the camera, microphone, and photo library, used strictly as described in our system prompts.

2. Data Usage: Your information is used to personalize the Naily AI experience, facilitate social connections, and maintain the functionality of the GLNTRKNA vault. We do not sell your personal data to third-party advertisers.

3. Local Storage Advantage: Rock prioritizes local processing. Much of your interaction with Naily AI and your private style boards is stored directly on your device via the GLNTRKNA vault, giving you greater control over your creative footprint.

4. Media Security: When you utilize video chat or message features, data is transmitted securely to ensure your privacy during live interactions. Rock does not record or store these private video sessions on our servers.

5. Your Rights: You may clear your local artisan data at any time via the "Evacuate Session" feature. For requests regarding data stored in our public gallery, contact our privacy officer.

Contact: master@rocknail.io
""" // Full text here
        }
    }
}
