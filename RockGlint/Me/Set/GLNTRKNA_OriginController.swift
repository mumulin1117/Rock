//
//  GLNTRKNA_OriginController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/30.
//

import UIKit

class GLNTRKNA_OriginController: UIViewController {
    
    private let GLNTRKNA_RatioX = UIScreen.main.bounds.width / 393.0
    private let GLNTRKNA_RatioY = UIScreen.main.bounds.height / 852.0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.05, green: 0.04, blue: 0.16, alpha: 1.0)
        

        self.title =  GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"sACDMHlBS83sqVc4wAE7wmuCgMx+4N/qlCJRHI9yZeCkGAlJnlq71Q==")
        let glnt_logo = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width - 120 * GLNTRKNA_RatioX) / 2, y: 220 * GLNTRKNA_RatioY, width: 120 * GLNTRKNA_RatioX, height: 120 * GLNTRKNA_RatioX))
        glnt_logo.backgroundColor = .systemPink
        glnt_logo.layer.cornerRadius = 24 * GLNTRKNA_RatioX
        glnt_logo.image = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "RocklogWithus") // Placeholder for 'R' logo
        glnt_logo.contentMode = .scaleAspectFill
        glnt_logo.clipsToBounds = true
        view.addSubview(glnt_logo)
        
        let glnt_name = UILabel(frame: CGRect(x: 0, y: 360 * GLNTRKNA_RatioY, width: UIScreen.main.bounds.width, height: 40))
        glnt_name.text = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"GIG2N6d0xPBI3ESTy9EPtJ2Dcu9OssKtb7rNNpp26JWpbJ9w")
        glnt_name.textColor = .white
        glnt_name.textAlignment = .center
        glnt_name.font = .boldSystemFont(ofSize: 28)
        view.addSubview(glnt_name)
        
        let glnt_version = UILabel(frame: CGRect(x: 0, y: 400 * GLNTRKNA_RatioY, width: UIScreen.main.bounds.width, height: 20))
        glnt_version.text = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"DDg9ecjgi741H1rHtfGN5U1JSyMp2q2aG+IGCmrc3Zb5m6oItyb67xiqpw==")
        glnt_version.textColor = .gray
        glnt_version.textAlignment = .center
        glnt_version.font = .systemFont(ofSize: 14)
        view.addSubview(glnt_version)
    }
    

}
