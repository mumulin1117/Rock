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
       
        GLNTRKNA_DisplayMasterpiece()
    }
    
    private func GLNTRKNA_DisplayMasterpiece() {
        GLNTRKNA_MainCanvas.contentSize = CGSize(width: view.frame.width, height: 600)
        GLNTRKNA_CanvasResult.frame = CGRect(x: 20, y: GLNTRKNA_ScaleH(20), width: view.frame.width - 40, height: GLNTRKNA_ScaleH(450))
        GLNTRKNA_CanvasResult.backgroundColor = .darkGray
        GLNTRKNA_CanvasResult.layer.cornerRadius = 20
        GLNTRKNA_CanvasResult.contentMode = .scaleAspectFill
        GLNTRKNA_CanvasResult.clipsToBounds = true
        GLNTRKNA_CanvasResult.image = UIImage(named: "GLNTRKNA_mock_nail_result")
        GLNTRKNA_MainCanvas.addSubview(GLNTRKNA_CanvasResult)
        
        let gln_save = UIButton(frame: CGRect(x: view.frame.width/2 + 10, y: view.frame.height - 100, width: view.frame.width/2 - 30, height: 60))
        gln_save.backgroundColor = .white
        gln_save.setTitle("Save", for: .normal)
        gln_save.setTitleColor(.black, for: .normal)
        gln_save.layer.cornerRadius = 30
        gln_save.addTarget(self, action: #selector(GLNTRKNA_ArchiveToLocal), for: .touchUpInside)
        view.addSubview(gln_save)
        
        let gln_eval = UIButton(frame: CGRect(x: 20, y: view.frame.height - 100, width: view.frame.width/2 - 30, height: 60))
        gln_eval.backgroundColor = GLNTRKNA_ActionPink
        gln_eval.setTitle("Evaluate", for: .normal)
        gln_eval.layer.cornerRadius = 30
        view.addSubview(gln_eval)
    }
    
    @objc private func GLNTRKNA_ArchiveToLocal() {
        guard let gln_img = GLNTRKNA_CanvasResult.image else { return }
        UIImageWriteToSavedPhotosAlbum(gln_img, nil, nil, nil)
        let gln_toast = UIAlertController(title: "Success", message: "Artisan design saved to gallery", preferredStyle: .alert)
        gln_toast.addAction(UIAlertAction(title: "OK", style: .default))
        present(gln_toast, animated: true)
    }
}
