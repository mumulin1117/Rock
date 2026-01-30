//
//  GLNTRKNA_DialogNexus.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/30.
//

import UIKit

class GLNTRKNA_DialogNexus: UIViewController {
    
    private let GLNTRKNA_RatioX = UIScreen.main.bounds.width / 393.0
    private let GLNTRKNA_RatioY = UIScreen.main.bounds.height / 852.0
    
    private var GLNTRKNA_Heading: String
    private var GLNTRKNA_Prose: String
    private var GLNTRKNA_CommitText: String
    
    init(title: String, message: String, actionTitle: String) {
        self.GLNTRKNA_Heading = title
        self.GLNTRKNA_Prose = message
        self.GLNTRKNA_CommitText = actionTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        let glnt_panel = UIView(frame: CGRect(x: 35 * GLNTRKNA_RatioX, y: (UIScreen.main.bounds.height - 320 * GLNTRKNA_RatioY) / 2, width: UIScreen.main.bounds.width - 70 * GLNTRKNA_RatioX, height: 320 * GLNTRKNA_RatioY))
        glnt_panel.backgroundColor = UIColor(red: 0.12, green: 0.08, blue: 0.22, alpha: 1.0)
        glnt_panel.layer.cornerRadius = 24 * GLNTRKNA_RatioY
        view.addSubview(glnt_panel)
        
        let glnt_title_l = UILabel(frame: CGRect(x: 20, y: 30 * GLNTRKNA_RatioY, width: glnt_panel.frame.width - 40, height: 30))
        glnt_title_l.text = GLNTRKNA_Heading
        glnt_title_l.textColor = .white
        glnt_title_l.textAlignment = .center
        glnt_title_l.font = .boldSystemFont(ofSize: 22)
        glnt_panel.addSubview(glnt_title_l)
        
        let glnt_msg_l = UILabel(frame: CGRect(x: 30, y: 75 * GLNTRKNA_RatioY, width: glnt_panel.frame.width - 60, height: 80))
        glnt_msg_l.text = GLNTRKNA_Prose
        glnt_msg_l.textColor = UIColor(white: 1, alpha: 0.7)
        glnt_msg_l.textAlignment = .center
        glnt_msg_l.numberOfLines = 0
        glnt_msg_l.font = .systemFont(ofSize: 15)
        glnt_panel.addSubview(glnt_msg_l)
        
        let glnt_cancel = UIButton(frame: CGRect(x: 25 * GLNTRKNA_RatioX, y: 180 * GLNTRKNA_RatioY, width: glnt_panel.frame.width - 50 * GLNTRKNA_RatioX, height: 50 * GLNTRKNA_RatioY))
        glnt_cancel.backgroundColor = UIColor(white: 1, alpha: 0.05)
        glnt_cancel.layer.cornerRadius = 25 * GLNTRKNA_RatioY
        glnt_cancel.setTitle("Cancel", for: .normal)
        glnt_cancel.setTitleColor(UIColor(red: 0.96, green: 0.64, blue: 0.82, alpha: 1.0), for: .normal)
        glnt_cancel.titleLabel?.font = .boldSystemFont(ofSize: 16)
        glnt_cancel.addTarget(self, action: #selector(GLNTRKNA_Silence), for: .touchUpInside)
        glnt_panel.addSubview(glnt_cancel)
        
        let glnt_confirm = UIButton(frame: CGRect(x: 25 * GLNTRKNA_RatioX, y: 245 * GLNTRKNA_RatioY, width: glnt_panel.frame.width - 50 * GLNTRKNA_RatioX, height: 50 * GLNTRKNA_RatioY))
        glnt_confirm.backgroundColor = UIColor(red: 0.96, green: 0.64, blue: 0.82, alpha: 1.0)
        glnt_confirm.layer.cornerRadius = 25 * GLNTRKNA_RatioY
        glnt_confirm.setTitle(GLNTRKNA_CommitText, for: .normal)
        glnt_confirm.setTitleColor(.white, for: .normal)
        glnt_confirm.layer.masksToBounds = true
        glnt_confirm.titleLabel?.font = .boldSystemFont(ofSize: 16)
        glnt_confirm.addTarget(self, action: #selector(GLNTRKNA_Execute), for: .touchUpInside)
        glnt_panel.addSubview(glnt_confirm)
        
        let glnt_Layer1 = CAGradientLayer()
        glnt_Layer1.colors = [UIColor(red: 0.87, green: 0.46, blue: 0.98, alpha: 1).cgColor, UIColor(red: 0.98, green: 0.73, blue: 0.78, alpha: 1).cgColor]
        glnt_Layer1.locations = [0, 1]
        glnt_Layer1.frame = glnt_confirm.bounds
        glnt_Layer1.startPoint = CGPoint(x: 1, y: 0.5)
        glnt_Layer1.endPoint = CGPoint(x: 0.5, y: 0.5)
        glnt_confirm.layer.insertSublayer(glnt_Layer1, at:0)
    }
    
    @objc private func GLNTRKNA_Silence() {
        self.dismiss(animated: false)
    }
    
    @objc private func GLNTRKNA_Execute() {
        // Mock logic
        self.dismiss(animated: false)
    }
}
