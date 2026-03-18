//
//  GLNTRKNA_CreativeOutputController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/28.
//

import UIKit
// MARK: - Stage 3: Result
class GLNTRKNA_CreativeOutputController: GLNTRKNA_NailAiBaseController {
    
    private let GLNTRKNA_CanvasResult = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"kXYeztFJggCdUASdTa1x49xgsOW0R1xlYdWf4vFrKTNV/M2dVKc=")
        GLNTRKNA_DisplayMasterpiece()
    }
    
    private func GLNTRKNA_DisplayMasterpiece() {
        let aiNamer = "AICreatOn\(Int.random(in: 0...2))"
        
        GLNTRKNA_CanvasResult.image = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias:aiNamer )
        GLNTRKNA_MainCanvas.contentSize = CGSize(width: view.frame.width, height: 600)
        GLNTRKNA_CanvasResult.frame = CGRect(x: 20, y: GLNTRKNA_ScaleH(20), width: view.frame.width - 40, height: GLNTRKNA_ScaleH(450))
        GLNTRKNA_CanvasResult.backgroundColor = .darkGray
        GLNTRKNA_CanvasResult.layer.cornerRadius = 20
        GLNTRKNA_CanvasResult.contentMode = .scaleAspectFill
        GLNTRKNA_CanvasResult.clipsToBounds = true
      
        GLNTRKNA_MainCanvas.addSubview(GLNTRKNA_CanvasResult)
        
        
        let gln_save = UIButton(frame: CGRect(x: view.frame.width/2 + 10, y: view.frame.height - 100, width: view.frame.width/2 - 30, height: 60))
        gln_save.backgroundColor = .white
        gln_save.setTitle(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"niT/S2ocn347qijdcVZzqd5YaQf5Ea+3FCmvTc9p/+IglQiI"), for: .normal)
        gln_save.setTitleColor(.black, for: .normal)
        gln_save.layer.cornerRadius = 30
        gln_save.addTarget(self, action: #selector(GLNTRKNA_ArchiveToLocal), for: .touchUpInside)
        view.addSubview(gln_save)
        
        let gln_eval = UIButton(frame: CGRect(x: 20, y: view.frame.height - 100, width: view.frame.width/2 - 30, height: 60))
        gln_eval.backgroundColor = GLNTRKNA_ActionPink
        gln_eval.setTitle(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"W4LPf9HkzzRY/xHCdQyNjIHt4GLTzKV7V358enpV9+9MkFO1"), for: .normal)
        gln_eval.addTarget(self, action: #selector(GLNTRKNA_ExitPortal), for: .touchUpInside)
        gln_eval.layer.cornerRadius = 30
        view.addSubview(gln_eval)
    }
    @objc private func GLNTRKNA_ExitPortal() {
        navigationController?.popViewController(animated: true)
    }
    @objc private func GLNTRKNA_ArchiveToLocal() {
        guard let gln_img = GLNTRKNA_CanvasResult.image else { return }
        UIImageWriteToSavedPhotosAlbum(gln_img, nil, nil, nil)
        let gln_toast = UIAlertController(title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"VjI9m5TX9iwBr3M7QjbnVvfvk0Y62iBsVhHFfm7etD23XsDHWZvZ"), message: "Artisan design saved to gallery", preferredStyle: .alert)
        gln_toast.addAction(UIAlertAction(title:GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"kiRIvmTRXTmpnjg6Fy51K4eCDIuyctaH4c2/ZOYvwinWwg=="), style: .default))
        present(gln_toast, animated: true)
    }
}
