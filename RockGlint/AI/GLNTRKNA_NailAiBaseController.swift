//
//  GLNTRKNA_NailAiBaseController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/28.
//

import UIKit
import PhotosUI

class GLNTRKNA_NailAiBaseController: UIViewController {
    
    internal let GLNTRKNA_MainCanvas = UIScrollView()
    internal let GLNTRKNA_NeonPurple = UIColor(red: 0.58, green: 0.38, blue: 1.00, alpha: 1.0)
    internal let GLNTRKNA_ActionPink = UIColor(red: 1.00, green: 0.11, blue: 0.44, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gln_text_attr: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = gln_text_attr
        navigationController?.navigationBar.tintColor = .white
        
        let gln_header = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        gln_header.contentMode = .scaleToFill
        gln_header.image = UIImage(named: "gln_headerbg")
        
        view.addSubview(gln_header)
      
        view.backgroundColor = UIColor(red: 0.02, green: 0.02, blue: 0.1, alpha: 1.0)
        GLNTRKNA_MainCanvas.frame = CGRect(x: 0, y: GLNTRKNA_ScaleH(249), width: view.frame.width, height: view.frame.height - GLNTRKNA_ScaleH(249))
        GLNTRKNA_MainCanvas.showsVerticalScrollIndicator = false
        view.addSubview(GLNTRKNA_MainCanvas)
      
    }
    
   
}

// MARK: - Stage 1: Introduction
class GLNTRKNA_AiManifestoController: GLNTRKNA_NailAiBaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Naily AI"
        
        
        GLNTRKNA_RenderIntro()
    }
    
    private func GLNTRKNA_RenderIntro() {
        GLNTRKNA_MainCanvas.contentSize = CGSize(width: view.frame.width, height: 600)
        let gln_card = UIView(frame: CGRect(x: GLNTRKNA_ScaleW(20), y: GLNTRKNA_ScaleH(20), width: view.frame.width - GLNTRKNA_ScaleW(40), height: GLNTRKNA_ScaleH(480)))
        gln_card.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        gln_card.layer.cornerRadius = 20
        GLNTRKNA_MainCanvas.addSubview(gln_card)
        
        let gln_desc = UITextView(frame: gln_card.bounds.insetBy(dx: 15, dy: 15))
        gln_desc.backgroundColor = .clear
        gln_desc.isEditable = false
        gln_desc.textColor = .white
        gln_desc.font = .systemFont(ofSize: 17, weight: .medium)
        gln_desc.text = "Meet Naily AI ✨\nSimply tell me your nail design vision, and watch it transform into a beautiful visual concept within seconds. Whether you love soft, cute styles or refined, classy looks, Naily AI brings your imagination to life—effortlessly 💅 From everyday inspiration to bold creative ideas, explore endless styles and discover designs that match your mood, personality, and moments. Turn thoughts into visuals, refine your look, and let every manicure start with inspiration made just for you."
        gln_card.addSubview(gln_desc)
        
        let gln_start = UIButton(frame: CGRect(x: GLNTRKNA_ScaleW(40), y: view.frame.height - GLNTRKNA_ScaleH(120), width: view.frame.width - GLNTRKNA_ScaleW(80), height: GLNTRKNA_ScaleH(60)))
        gln_start.setBackgroundImage(UIImage.init(named: "gln_start"), for: .normal)
        gln_start.addTarget(self, action: #selector(GLNTRKNA_LaunchEngine), for: .touchUpInside)
        view.addSubview(gln_start)
        
//        let glnt_back = UIButton(frame: CGRect(x: 15 , y: 55 , width: 30, height: 30))
//        glnt_back.setImage(UIImage(systemName: "arrow.left"), for: .normal)
//        glnt_back.tintColor = .white
//        glnt_back.addTarget(self, action: #selector(GLNTRKNA_ExitPortal), for: .touchUpInside)
//        view.addSubview(glnt_back)
    }
//    @objc private func GLNTRKNA_ExitPortal() {
//        navigationController?.popViewController(animated: true)
//    }
    @objc private func GLNTRKNA_LaunchEngine() {
        let gln_selector = GLNTRKNA_ArtisanStyleSelector()
        navigationController?.pushViewController(gln_selector, animated: true)
    }
}

