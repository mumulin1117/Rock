//
//  GLNTRKNA_IdentityRefiner.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/30.
//

import UIKit
//edit

class GLNTRKNA_IdentityRefiner: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var GLNTRKNA_SyncCallback: ((String, String, String, UIImage?) -> Void)?
    
    private let GLNTRKNA_ScaleW = UIScreen.main.bounds.width / 393.0
    private let GLNTRKNA_ScaleH = UIScreen.main.bounds.height / 852.0
    
    private let GLNTRKNA_BaseCanvas = UIView()
    private let GLNTRKNA_AuraPreview = UIImageView()
    private let GLNTRKNA_AliasField = UITextField()
    private let GLNTRKNA_SolarDateLab = UILabel()
    private let GLNTRKNA_BioEditor = UITextView()
    private var GLNTRKNA_IsAuraChanged: Bool = false
    
    let info = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_GetCurrentProfile()
    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_InitializeScenery()
        
        
         
        
    }

    private func GLNTRKNA_InitializeScenery() {
        view.backgroundColor = UIColor(red: 0.05, green: 0.04, blue: 0.16, alpha: 1.0)
        
        let glnt_top_bar = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100 * GLNTRKNA_ScaleH))
        view.addSubview(glnt_top_bar)
        self.title = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"kAxUI7Akt8G1RgHIQyUbmQNNMiXypN0lqBrCmRKrYc0IOH5IW+2L0vMsElk=")
//        let glnt_retreat = UIButton(frame: CGRect(x: 20 * GLNTRKNA_ScaleW, y: 60 * GLNTRKNA_ScaleH, width: 30, height: 30))
//        glnt_retreat.setImage(UIImage(systemName: "arrow.left"), for: .normal)
//        glnt_retreat.tintColor = .white
//        glnt_retreat.addTarget(self, action: #selector(GLNTRKNA_AbortMission), for: .touchUpInside)
//        glnt_top_bar.addSubview(glnt_retreat)
        
//        let glnt_header = UILabel(frame: CGRect(x: 0, y: 60 * GLNTRKNA_ScaleH, width: UIScreen.main.bounds.width, height: 30))
//        glnt_header.text = "Edit Profile"
//        glnt_header.textColor = .white
//        glnt_header.textAlignment = .center
//        glnt_header.font = .boldSystemFont(ofSize: 18)
//        glnt_top_bar.addSubview(glnt_header)
//        GLNTRKNA_AuraPreview.frame = CGRect(x: (UIScreen.main.bounds.width - 110 * GLNTRKNA_ScaleW)/2, y: 140 * GLNTRKNA_ScaleH, width: 110 * GLNTRKNA_ScaleW, height: 110 * GLNTRKNA_ScaleW)
//               
        GLNTRKNA_AuraPreview.layer.cornerRadius = 55 * GLNTRKNA_ScaleW
        GLNTRKNA_AuraPreview.backgroundColor = .darkGray
        GLNTRKNA_AuraPreview.clipsToBounds = true
        GLNTRKNA_AuraPreview.isUserInteractionEnabled = true
        GLNTRKNA_AuraPreview.contentMode = .scaleAspectFill
        GLNTRKNA_AuraPreview.image = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_DefaultAvatar")
        view.addSubview(GLNTRKNA_AuraPreview)
        
        let glnt_aura_mask = UIView(frame: GLNTRKNA_AuraPreview.bounds)
                glnt_aura_mask.backgroundColor = UIColor.black.withAlphaComponent(0.2)
                GLNTRKNA_AuraPreview.addSubview(glnt_aura_mask)
                
                let glnt_cam_icon = UIImageView(frame: CGRect(x: 35 * GLNTRKNA_ScaleW, y: 35 * GLNTRKNA_ScaleW, width: 40 * GLNTRKNA_ScaleW, height: 40 * GLNTRKNA_ScaleW))
                glnt_cam_icon.image = UIImage(systemName: "camera.fill")
                glnt_cam_icon.tintColor = .white
                glnt_cam_icon.contentMode = .scaleAspectFit
                GLNTRKNA_AuraPreview.addSubview(glnt_cam_icon)
                
                let glnt_tap_aura = UITapGestureRecognizer(target: self, action: #selector(GLNTRKNA_TriggerOptics))
                GLNTRKNA_AuraPreview.addGestureRecognizer(glnt_tap_aura)
        
        GLNTRKNA_AuraPreview.frame = CGRect(x: (UIScreen.main.bounds.width - 110 * GLNTRKNA_ScaleW)/2, y: 140 * GLNTRKNA_ScaleH, width: 110 * GLNTRKNA_ScaleW, height: 110 * GLNTRKNA_ScaleW)
        GLNTRKNA_AuraPreview.layer.cornerRadius = 55 * GLNTRKNA_ScaleW
        GLNTRKNA_AuraPreview.backgroundColor = .darkGray
        GLNTRKNA_AuraPreview.clipsToBounds = true
        GLNTRKNA_AuraPreview.isUserInteractionEnabled = true
        GLNTRKNA_AuraPreview.contentMode = .scaleAspectFill
        GLNTRKNA_AuraPreview.image = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_DefaultAvatar")
        view.addSubview(GLNTRKNA_AuraPreview)
//        
//        let glnt_cam_icon = UIButton(frame: CGRect(x: 35 * GLNTRKNA_ScaleW, y: 35 * GLNTRKNA_ScaleW, width: 40 * GLNTRKNA_ScaleW, height: 40 * GLNTRKNA_ScaleW))
//        glnt_cam_icon.setImage(UIImage(systemName: "camera.fill"), for: .normal)
//        glnt_cam_icon.tintColor = .white
//        GLNTRKNA_AuraPreview.addSubview(glnt_cam_icon)
//        
//        let glnt_tap_aura = UITapGestureRecognizer(target: self, action: #selector(GLNTRKNA_TriggerOptics))
//        GLNTRKNA_AuraPreview.addGestureRecognizer(glnt_tap_aura)

        GLNTRKNA_ComposeEntry(y: 300, title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"Y9J2SvcghDUt8+ReWXAiLeG7MbXzBaZXzr5vqyoO0gf1y1PnJ3k1BQ=="), val: info?.glnt_alias ?? GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"c3YJobG+2r3RghzPHKCaQXcXtZaPqQz/6YXNizeWrsT8+Pzf5XIA"), isField: true)
        GLNTRKNA_ComposeEntry(y: 400, title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"BsFpEqclPf+lGbsW7pnCdNOsT5+qRzNUlCBo5I0eLfmqZs+mF9pmhg=="), val: info?.glnt_date ?? GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"6Edi3hz1ymdEZHOkEQAtAf9FAJqbz2O+paBh18kGnXOVQFCUqRfWl9P2El4Z3g=="), isField: false)
        
        let glnt_bio_box = UIView(frame: CGRect(x: 15 * GLNTRKNA_ScaleW, y: 500 * GLNTRKNA_ScaleH, width: UIScreen.main.bounds.width - 30 * GLNTRKNA_ScaleW, height: 280 * GLNTRKNA_ScaleH))
        glnt_bio_box.backgroundColor = UIColor(white: 1, alpha: 0.08)
        glnt_bio_box.layer.cornerRadius = 20 * GLNTRKNA_ScaleH
        view.addSubview(glnt_bio_box)
        
        let glnt_bio_title = UILabel(frame: CGRect(x: 15, y: 20, width: 100, height: 20))
        glnt_bio_title.text = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"qhd1yCz9sm9lZIdTR2Ftq3869GjJqq4Bic3e+Fff8ASLg1cK0U2T8w==")
        glnt_bio_title.textColor = .white
        glnt_bio_title.font = .boldSystemFont(ofSize: 18)
        glnt_bio_box.addSubview(glnt_bio_title)
        
        GLNTRKNA_BioEditor.frame = CGRect(x: 12, y: 50, width: glnt_bio_box.frame.width - 24, height: 150)
        GLNTRKNA_BioEditor.backgroundColor = .clear
        GLNTRKNA_BioEditor.textColor = .lightGray
        GLNTRKNA_BioEditor.font = .systemFont(ofSize: 15)
        GLNTRKNA_BioEditor.text = info?.glnt_bio ?? GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"EEbtvWopvv1eZORFYu+2USarJ2x4lYbpmbKQjsZjzXOQXvUa1cJuIBJHMt4mXH6kJPZs+vd9BLYc6gis7tCQw7vcJtw9BaPkfg==")
        glnt_bio_box.addSubview(GLNTRKNA_BioEditor)

        let glnt_submit = UIButton(frame: CGRect(x: 15 * GLNTRKNA_ScaleW, y: UIScreen.main.bounds.height - 100 * GLNTRKNA_ScaleH, width: UIScreen.main.bounds.width - 30 * GLNTRKNA_ScaleW, height: 65 * GLNTRKNA_ScaleH))
        glnt_submit.layer.masksToBounds = true
        glnt_submit.layer.cornerRadius = 32.5 * GLNTRKNA_ScaleH
        glnt_submit.setTitle(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"HjBG9vk/UiXBtY6PauBGitPl1WmkF+a3gcVXt1JdO57B4/7toraj"), for: .normal)
        glnt_submit.setTitleColor(.white, for: .normal)
        glnt_submit.titleLabel?.font = .boldSystemFont(ofSize: 18)
        glnt_submit.addTarget(self, action: #selector(GLNTRKNA_CommitIdentity), for: .touchUpInside)
        view.addSubview(glnt_submit)
        
        
        let glnt_Layer1 = CAGradientLayer()
        glnt_Layer1.colors = [UIColor(red: 0.87, green: 0.46, blue: 0.98, alpha: 1).cgColor, UIColor(red: 0.98, green: 0.73, blue: 0.78, alpha: 1).cgColor]
        glnt_Layer1.locations = [0, 1]
        glnt_Layer1.frame = glnt_submit.bounds
        glnt_Layer1.startPoint = CGPoint(x: 1, y: 0.5)
        glnt_Layer1.endPoint = CGPoint(x: 0.5, y: 0.5)
        glnt_submit.layer.insertSublayer(glnt_Layer1, at:0)
    }
    @objc private func GLNTRKNA_TriggerOptics() {
            let glnt_sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let glnt_album = UIAlertAction(title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"2dFc9DoazOmFDDbyuSYtzbRNe1gGm8XLdeHaW5Qc8Vm0Kd1PNdYJF8Ndvoruv0JkAadG"), style: .default) { _ in
                self.GLNTRKNA_InvokeSystemGallery()
            }
            
            let glnt_cancel = UIAlertAction(title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"3+x9ke4fmzRG3lWGUfwkE58ZMLh5+4PJGcFkxt2LGdwilzKfvx4="), style: .cancel, handler: nil)
            
            glnt_sheet.addAction(glnt_album)
            glnt_sheet.addAction(glnt_cancel)
            
            self.present(glnt_sheet, animated: true)
        }
    
    private func GLNTRKNA_InvokeSystemGallery() {
            let glnt_picker = UIImagePickerController()
            glnt_picker.delegate = self
            glnt_picker.allowsEditing = true // 允许裁剪为正方形
            glnt_picker.sourceType = .photoLibrary
            self.present(glnt_picker, animated: true)
        }

        // UIImagePickerControllerDelegate 代理实现
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let glnt_selectedImg = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                self.GLNTRKNA_AuraPreview.image = glnt_selectedImg
                self.GLNTRKNA_IsAuraChanged = true
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    
    private func GLNTRKNA_ComposeEntry(y: CGFloat, title: String, val: String, isField: Bool) {
        let glnt_wrap = UIView(frame: CGRect(x: 15 * GLNTRKNA_ScaleW, y: y * GLNTRKNA_ScaleH, width: UIScreen.main.bounds.width - 30 * GLNTRKNA_ScaleW, height: 85 * GLNTRKNA_ScaleH))
        glnt_wrap.backgroundColor = UIColor(white: 1, alpha: 0.08)
        glnt_wrap.layer.cornerRadius = 20 * GLNTRKNA_ScaleH
        view.addSubview(glnt_wrap)
        
        let glnt_tl = UILabel(frame: CGRect(x: 15, y: 0, width: 100, height: 85 * GLNTRKNA_ScaleH))
        glnt_tl.text = title
        glnt_tl.textColor = .white
        glnt_tl.font = .boldSystemFont(ofSize: 18)
        glnt_wrap.addSubview(glnt_tl)
        
        if isField {
            GLNTRKNA_AliasField.frame = CGRect(x: glnt_wrap.frame.width - 180, y: 0, width: 150, height: 85 * GLNTRKNA_ScaleH)
            GLNTRKNA_AliasField.text = val
            GLNTRKNA_AliasField.textColor = .lightGray
            GLNTRKNA_AliasField.textAlignment = .right
            GLNTRKNA_AliasField.font = .systemFont(ofSize: 15)
            glnt_wrap.addSubview(GLNTRKNA_AliasField)
        } else {
            GLNTRKNA_SolarDateLab.frame = CGRect(x: glnt_wrap.frame.width - 180, y: 0, width: 150, height: 85 * GLNTRKNA_ScaleH)
            GLNTRKNA_SolarDateLab.text = val
            GLNTRKNA_SolarDateLab.textColor = .lightGray
            GLNTRKNA_SolarDateLab.textAlignment = .right
            GLNTRKNA_SolarDateLab.font = .systemFont(ofSize: 15)
            glnt_wrap.addSubview(GLNTRKNA_SolarDateLab)
            
            let glnt_gesture = UITapGestureRecognizer(target: self, action: #selector(GLNTRKNA_PickChronos))
            glnt_wrap.addGestureRecognizer(glnt_gesture)
        }
        
        let glnt_arrow = UIImageView(frame: CGRect(x: glnt_wrap.frame.width - 25, y: 35 * GLNTRKNA_ScaleH, width: 10, height: 15))
        glnt_arrow.image = UIImage(systemName: "chevron.right")
        glnt_arrow.tintColor = .gray
        glnt_wrap.addSubview(glnt_arrow)
    }

  
    @objc private func GLNTRKNA_PickChronos() {
        // Mock Date Selection
        GLNTRKNA_SolarDateLab.text = "January 01, 2000"
    }

    @objc private func GLNTRKNA_CommitIdentity() {
        let glnt_newName = GLNTRKNA_AliasField.text ?? ""
        let glnt_newBio = GLNTRKNA_BioEditor.text ?? ""
        let glnt_newDate = GLNTRKNA_SolarDateLab.text ?? ""
        let glnt_newImg = GLNTRKNA_IsAuraChanged ? GLNTRKNA_AuraPreview.image : nil
        
        // 调用回调，将新头像一并传回
        GLNTRKNA_SyncCallback?(glnt_newName, glnt_newBio, glnt_newDate, glnt_newImg)
        
        GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_ReviseProfile(alias: glnt_newName,bio: glnt_newBio,birthday: glnt_newDate)
        self.navigationController?.popViewController(animated: true)
        
    }

//    @objc private func GLNTRKNA_AbortMission() {
//        self.navigationController?.popViewController(animated: true)
//    }
}
