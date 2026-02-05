//
//  GLNTRKNA_SettlementController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/30.
//

import UIKit
//setting
class GLNTRKNA_SettlementController: UIViewController {

    private let GLNTRKNA_RatioX = UIScreen.main.bounds.width / 393.0
    private let GLNTRKNA_RatioY = UIScreen.main.bounds.height / 852.0
    private let GLNTRKNA_VoidColor = UIColor(red: 0.05, green: 0.04, blue: 0.16, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_BuildCoreScenery()
    }

    private func GLNTRKNA_BuildCoreScenery() {
        view.backgroundColor = GLNTRKNA_VoidColor
        
        let glnt_nav_bar = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100 * GLNTRKNA_RatioY))
        view.addSubview(glnt_nav_bar)
        
//        let glnt_back = UIButton(frame: CGRect(x: 20 * GLNTRKNA_RatioX, y: 60 * GLNTRKNA_RatioY, width: 30, height: 30))
//        glnt_back.setImage(UIImage(systemName: "arrow.left"), for: .normal)
//        glnt_back.tintColor = .white
//        glnt_back.addTarget(self, action: #selector(GLNTRKNA_DepartOrbit), for: .touchUpInside)
//        glnt_nav_bar.addSubview(glnt_back)
        self.title =  GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"HZQ66HYno3KVogTb1pSp6NZofEUnvG5wE94plf6lVvDFOemJrtD1GQ==")
//        let glnt_title = UILabel(frame: CGRect(x: 0, y: 60 * GLNTRKNA_RatioY, width: UIScreen.main.bounds.width, height: 30))
//        glnt_title.text = "Settings"
//        glnt_title.textColor = .white
//        glnt_title.textAlignment = .center
//        glnt_title.font = .boldSystemFont(ofSize: 18)
//        glnt_nav_bar.addSubview(glnt_title)

        let glnt_options = [GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"JxaO+II5mmTpE8EXzU88XAQ5EiBISVbdJsy/qnuSbiwHnmoaLqjIMpmuuaHIag=="),GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"d5KDG4NtB8fPUGTvUf6c/LzZNNeWbqNdFi8DYEAgifybli6T80sRe6EguIcEEF6PvA=="),  GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"Sp/7uPzUyyMRx6fXvgMY46sY/NHD9ZFfn8FzmIgg9XccHZEJ0ty8yQ==")]
        let glnt_icons = ["doc.text.fill", "shield.lefthalf.filled", "person.slash.fill", "info.circle.fill"]
        
        for i in 0..<glnt_options.count {
            let glnt_row = UIButton(frame: CGRect(x: 15 * GLNTRKNA_RatioX, y: 130 * GLNTRKNA_RatioY + CGFloat(i) * 75 * GLNTRKNA_RatioY, width: UIScreen.main.bounds.width - 30 * GLNTRKNA_RatioX, height: 65 * GLNTRKNA_RatioY))
            glnt_row.backgroundColor = UIColor(white: 1, alpha: 0.08)
            glnt_row.layer.cornerRadius = 16 * GLNTRKNA_RatioY
            glnt_row.tag = i
            glnt_row.addTarget(self, action: #selector(GLNTRKNA_OptionTriggered(_:)), for: .touchUpInside)
            view.addSubview(glnt_row)
            
            let glnt_icon_v = UIImageView(frame: CGRect(x: 15 * GLNTRKNA_RatioX, y: 20 * GLNTRKNA_RatioY, width: 25 * GLNTRKNA_RatioY, height: 25 * GLNTRKNA_RatioY))
            glnt_icon_v.image = UIImage(systemName: glnt_icons[i])
            glnt_icon_v.tintColor = .white
            glnt_icon_v.contentMode = .scaleAspectFit
            glnt_row.addSubview(glnt_icon_v)
            
            let glnt_label = UILabel(frame: CGRect(x: 55 * GLNTRKNA_RatioX, y: 0, width: 200, height: 65 * GLNTRKNA_RatioY))
            glnt_label.text = glnt_options[i]
            glnt_label.textColor = .white
            glnt_label.font = .systemFont(ofSize: 16, weight: .medium)
            glnt_row.addSubview(glnt_label)
            
            let glnt_arrow = UIImageView(frame: CGRect(x: glnt_row.frame.width - 30 * GLNTRKNA_RatioX, y: 24 * GLNTRKNA_RatioY, width: 12 * GLNTRKNA_RatioY, height: 16 * GLNTRKNA_RatioY))
            glnt_arrow.image = UIImage(systemName: "chevron.right")
            glnt_arrow.tintColor = .gray
            glnt_row.addSubview(glnt_arrow)
        }
        
        let glnt_logout = UIButton(frame: CGRect(x: 15 * GLNTRKNA_RatioX, y: UIScreen.main.bounds.height - 180 * GLNTRKNA_RatioY, width: UIScreen.main.bounds.width - 30 * GLNTRKNA_RatioX, height: 65 * GLNTRKNA_RatioY))
        glnt_logout.backgroundColor = UIColor(white: 1, alpha: 0.08)
        glnt_logout.layer.cornerRadius = 32 * GLNTRKNA_RatioY
        glnt_logout.setTitle(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"9bEIlBA9culPdgzhfmrrkWFXQjUEnW+e2AP4vWoJPO7iARHYpEwl"), for: .normal)
        glnt_logout.setTitleColor(UIColor(red: 0.96, green: 0.64, blue: 0.82, alpha: 1.0), for: .normal)
        glnt_logout.titleLabel?.font = .boldSystemFont(ofSize: 18)
        glnt_logout.addTarget(self, action: #selector(GLNTRKNA_ExposeLogoutDialog), for: .touchUpInside)
        view.addSubview(glnt_logout)
        
        let glnt_delete = UIButton(frame: CGRect(x: 15 * GLNTRKNA_RatioX, y: UIScreen.main.bounds.height - 100 * GLNTRKNA_RatioY, width: UIScreen.main.bounds.width - 30 * GLNTRKNA_RatioX, height: 65 * GLNTRKNA_RatioY))
       
        glnt_delete.layer.cornerRadius = 32 * GLNTRKNA_RatioY
        glnt_delete.layer.masksToBounds = true
        glnt_delete.setTitle(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"MsSUx6XiA2ltSo3qRL+nWCTcgbklkoU78BkZ+OKB3/IeamgXGriSddmwslR+7Q=="), for: .normal)
        glnt_delete.setTitleColor(.white, for: .normal)
        glnt_delete.titleLabel?.font = .boldSystemFont(ofSize: 18)
        glnt_delete.addTarget(self, action: #selector(GLNTRKNA_ExposeDeleteDialog), for: .touchUpInside)
        view.addSubview(glnt_delete)
        
        let glnt_Layer1 = CAGradientLayer()
        glnt_Layer1.colors = [UIColor(red: 0.87, green: 0.46, blue: 0.98, alpha: 1).cgColor, UIColor(red: 0.98, green: 0.73, blue: 0.78, alpha: 1).cgColor]
        glnt_Layer1.locations = [0, 1]
        glnt_Layer1.frame = glnt_delete.bounds
        glnt_Layer1.startPoint = CGPoint(x: 1, y: 0.5)
        glnt_Layer1.endPoint = CGPoint(x: 0.5, y: 0.5)
        glnt_delete.layer.insertSublayer(glnt_Layer1, at:0)
    }

    @objc private func GLNTRKNA_OptionTriggered(_ sender: UIButton) {
        
        if sender.tag == 0 {
            let go = GLNTRKNA_LegalViewer.init(docType:GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"hKgpC2x6vJzZTSyiZPYzrd3c0TgN2bAwK26dlo1r5uq6TIoF"))
            self.present(go, animated: true)
        }
        
        if sender.tag == 1 {
            let go = GLNTRKNA_LegalViewer.init(docType:GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"qeyK9/spVgt4rXLAPijSY/knrkBQDQnNtRodGWk0Yqu7R2l51fgj"))
            self.present(go, animated: true)
        }
        
      
        if sender.tag == 2 {
            let glnt_about = GLNTRKNA_OriginController()
            self.navigationController?.pushViewController(glnt_about, animated: true)
        }
    }

    @objc private func GLNTRKNA_ExposeLogoutDialog() {
        let glnt_alert = GLNTRKNA_DialogNexus(title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"N/DB3VvGgdqdqzeioQCTXjdyb1tyo49udyapkr+UOHgnALbk4xCf"), message: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"lj4GTt6Wq01Rdi3xOSUqNToSqyRtthn78MQ9P6BjqGnXXl4ynKmRcadvFo6oT/BtX8grnTDrX+BOQt2o3SX8I3ssNYbgbdrzaAejd8VbX6fym9klDBX+ZB5bWHAaKiYlyA+WBLlc3v3CP/QMumIMhFQk8WyEtDmGOw4KTBfdWA=="), actionTitle: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"dtBhawfLKjzJrx4bBStppOkrr7dMdW5K9CqGYhVXeuS5a/0p/cAQ"))
        glnt_alert.GLNTRKNA_SyncCallback = {
            if let gln_win = self.view.window {
                GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_EvacuateAura()
                gln_win.rootViewController = GLNTRKNA_AccessGateway()
            }
        
        }
        glnt_alert.modalPresentationStyle = .overFullScreen
        self.present(glnt_alert, animated: false)
    }

    @objc private func GLNTRKNA_ExposeDeleteDialog() {
        
        let glnt_alert = GLNTRKNA_DialogNexus(title:GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"FnUz8dGRTWcT/VuAkW9UKQxiFkcCPPHHcXtZxJWF+YzAX4Ge5j9eS1Ud5btKGg=="), message: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"vfnmMCYWseLTuluYSak1IvTtzoV7tpLJIgMNIPM5uGNdxLe0hh26FeBna7TKxttLlSuGoK5PGyezsTzxGT7GSWJQXYRNhS5w0WUvMeJHfdz/ZVLXqlMRHYwaHG2NSeRze/cAFvgGIGGl"), actionTitle: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"ueX+gLTeqY/fNM+2RuioVJuXH47jVOR3WkF8HjPR7vy61FsAy2Y="))
        glnt_alert.GLNTRKNA_SyncCallback = {
            if let gln_win = self.view.window {
                GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_TerminateAccount()
                gln_win.rootViewController = GLNTRKNA_AccessGateway()
            }
        
        }
        glnt_alert.modalPresentationStyle = .overFullScreen
        self.present(glnt_alert, animated: false)
    }

//    @objc private func GLNTRKNA_DepartOrbit() {
//        self.navigationController?.popViewController(animated: true)
//    }
}
