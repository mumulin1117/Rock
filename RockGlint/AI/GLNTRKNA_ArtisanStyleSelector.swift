//
//  GLNTRKNA_ArtisanStyleSelector.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/28.
//

import UIKit
// MARK: - Stage 2: Selection
class GLNTRKNA_ArtisanStyleSelector: GLNTRKNA_NailAiBaseController {
    
    private var GLNTRKNA_CurrentTheme: String?
    private var GLNTRKNA_CurrentShape: String?
    private let GLNTRKNA_ThemePool = ["French", "Minimalist", "Dreamy", "Punk", "Matte", "Japanese", "American", "Y2K"]
    private let GLNTRKNA_ShapePool = ["Square", "Round", "Almond", "Coffin", "Stiletto", "Natural Short"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        GLNTRKNA_ConstructGrid()
    }
    
    private func GLNTRKNA_ConstructGrid() {
        GLNTRKNA_MainCanvas.contentSize = CGSize(width: view.frame.width, height: 1200)
        var gln_offset_y = GLNTRKNA_ScaleH(20)
        
        gln_offset_y = GLNTRKNA_PopulateTags(title: "Choose Your Style", pool: GLNTRKNA_ThemePool, startY: gln_offset_y, isTheme: true)
        gln_offset_y += 20
        gln_offset_y = GLNTRKNA_PopulateTags(title: "Choose Your Shape", pool: GLNTRKNA_ShapePool, startY: gln_offset_y, isTheme: false)
        
        let gln_input = UITextView(frame: CGRect(x: 20, y: gln_offset_y + 20, width: view.frame.width - 40, height: 120))
        gln_input.backgroundColor = UIColor(white: 1.0, alpha: 0.15)
        gln_input.layer.cornerRadius = 12
        gln_input.textColor = .lightGray
        gln_input.text = "Add a detailed description to guide Naily AI..."
        GLNTRKNA_MainCanvas.addSubview(gln_input)
        
        let gln_forge = UIButton(frame: CGRect(x: 40, y: view.frame.height - 100, width: view.frame.width - 80, height: 60))
        gln_forge.backgroundColor = GLNTRKNA_ActionPink
        gln_forge.layer.cornerRadius = 30
        gln_forge.setTitle("🪙 200", for: .normal)
        gln_forge.addTarget(self, action: #selector(GLNTRKNA_TriggerGeneration), for: .touchUpInside)
        view.addSubview(gln_forge)
    }
    
    private func GLNTRKNA_PopulateTags(title: String, pool: [String], startY: CGFloat, isTheme: Bool) -> CGFloat {
        let gln_lbl = UILabel(frame: CGRect(x: 20, y: startY, width: 200, height: 30))
        gln_lbl.text = title
        gln_lbl.textColor = .white
        gln_lbl.font = .boldSystemFont(ofSize: 18)
        GLNTRKNA_MainCanvas.addSubview(gln_lbl)
        
        let gln_item_w = (view.frame.width - 60) / 3
        var gln_row: CGFloat = 0
        var gln_col: CGFloat = 0
        
        for (index, name) in pool.enumerated() {
            let gln_btn = UIButton(frame: CGRect(x: 20 + gln_col * (gln_item_w + 10), y: startY + 40 + gln_row * 45, width: gln_item_w, height: 35))
            gln_btn.setTitle(name, for: .normal)
            gln_btn.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
            gln_btn.layer.cornerRadius = 8
            gln_btn.titleLabel?.font = .systemFont(ofSize: 14)
            gln_btn.tag = index
            gln_btn.addTarget(self, action: isTheme ? #selector(GLNTRKNA_ThemeSelect) : #selector(GLNTRKNA_ShapeSelect), for: .touchUpInside)
            GLNTRKNA_MainCanvas.addSubview(gln_btn)
            
            gln_col += 1
            if gln_col > 2 { gln_col = 0; gln_row += 1 }
        }
        return startY + 40 + (gln_row + 1) * 45
    }
    
    @objc private func GLNTRKNA_ThemeSelect(sender: UIButton) {
        GLNTRKNA_ThemePool.indices.forEach { _ in /* Reset logic */ }
        sender.backgroundColor = .white
        sender.setTitleColor(.black, for: .normal)
    }
    
    @objc private func GLNTRKNA_ShapeSelect(sender: UIButton) {
        sender.backgroundColor = .white
        sender.setTitleColor(.black, for: .normal)
    }

    @objc private func GLNTRKNA_TriggerGeneration() {
        let gln_overlay = UIView(frame: view.bounds)
        gln_overlay.backgroundColor = UIColor(white: 0, alpha: 0.8)
        view.addSubview(gln_overlay)
        
        let gln_loading = UIActivityIndicatorView(style: .large)
        gln_loading.center = view.center
        gln_loading.startAnimating()
        gln_overlay.addSubview(gln_loading)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            gln_overlay.removeFromSuperview()
            let gln_result = GLNTRKNA_CreativeOutputController()
            self.navigationController?.pushViewController(gln_result, animated: true)
        }
    }
}

