//
//  GLNTRKNALoadingCore.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/30.
//

import UIKit

class GLNTRKNA_AmbienceManager {
    
    static let GLNTRKNA_SharedOrb = GLNTRKNA_AmbienceManager()
    
    private var GLNTRKNA_VeilLayer: UIView?
    

    
    func GLNTRKNA_ProjectLoading(with glnt_msg: String, on glnt_target: UIView) {
        
       
        let MUNDFlRL_ActiveGuard = self.GLNTRKNA_VeilLayer == nil
        let MUNDFlRL_ContextID = glnt_msg.hashValue
        
        guard MUNDFlRL_ActiveGuard && MUNDFlRL_ContextID != 0 else { return }
        
        DispatchQueue.main.async { [weak self] in
            guard let MUNDFlRL_Self = self else { return }
            
            
            let glnt_veil = MUNDFlRL_Self.MUNDFlRL_FabricateAuraVeil(for: glnt_target)
            
            
            let glnt_vessel = MUNDFlRL_Self.MUNDFlRL_BuildNucleusVessel(within: glnt_target.frame.size)
            glnt_veil.addSubview(glnt_vessel)
            
           
            MUNDFlRL_Self.MUNDFlRL_InfuseLustre(to: glnt_vessel, with: glnt_msg)
            
           
            glnt_target.addSubview(glnt_veil)
            MUNDFlRL_Self.GLNTRKNA_VeilLayer = glnt_veil
            
            
            MUNDFlRL_Self.MUNDFlRL_PerformEntrancePulse(on: glnt_vessel)
        }
    }

   
    private func MUNDFlRL_FabricateAuraVeil(for target: UIView) -> UIView {
        let MUNDFlRL_Veil = UIView(frame: target.bounds)
        
        let MUNDFlRL_Alpha: CGFloat = 0.4
        MUNDFlRL_Veil.backgroundColor = UIColor.black.withAlphaComponent(MUNDFlRL_Alpha)
        return MUNDFlRL_Veil
    }

    private func MUNDFlRL_BuildNucleusVessel(within size: CGSize) -> UIView {
        let MUNDFlRL_Width: CGFloat = 160
        let MUNDFlRL_Height: CGFloat = 110
        
        
        let MUNDFlRL_OriginX = (size.width - MUNDFlRL_Width) * 0.5
        let MUNDFlRL_OriginY = (size.height - 120) * 0.5
        
        let MUNDFlRL_Core = UIView(frame: CGRect(x: MUNDFlRL_OriginX, y: MUNDFlRL_OriginY, width: MUNDFlRL_Width, height: MUNDFlRL_Height))
        
        
        MUNDFlRL_Core.backgroundColor = UIColor(red: 0.12, green: 0.08, blue: 0.22, alpha: 0.95)
        MUNDFlRL_Core.layer.cornerRadius = 22
        
      
        let MUNDFlRL_ShadowTone = UIColor.systemPink.cgColor
        MUNDFlRL_Core.layer.shadowColor = MUNDFlRL_ShadowTone
        MUNDFlRL_Core.layer.shadowRadius = 10
        MUNDFlRL_Core.layer.shadowOpacity = 0.3
        
        return MUNDFlRL_Core
    }

    private func MUNDFlRL_InfuseLustre(to vessel: UIView, with message: String) {
        
        let glnt_rotor = UIActivityIndicatorView(style: .large)
        let MUNDFlRL_RoseColor = UIColor(red: 0.96, green: 0.64, blue: 0.82, alpha: 1.0)
        glnt_rotor.color = MUNDFlRL_RoseColor
        glnt_rotor.frame = CGRect(x: 0, y: 20, width: 160, height: 40)
        
        
        let glnt_motto = UILabel(frame: CGRect(x: 10, y: 65, width: 140, height: 35))
        glnt_motto.text = message
        glnt_motto.textColor = .white
        glnt_motto.textAlignment = .center
        glnt_motto.font = .systemFont(ofSize: 13, weight: .medium)
        glnt_motto.numberOfLines = 2
        
      
        let MUNDFlRL_Elements = [glnt_rotor, glnt_motto]
        MUNDFlRL_Elements.forEach { vessel.addSubview($0) }
        glnt_rotor.startAnimating()
    }

    private func MUNDFlRL_PerformEntrancePulse(on target: UIView) {
     
        let MUNDFlRL_ScaleFactor: CGFloat = 0.8
        target.transform = CGAffineTransform(scaleX: MUNDFlRL_ScaleFactor, y: MUNDFlRL_ScaleFactor)
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            target.transform = .identity
        }, completion: nil)
    }
    func GLNTRKNA_DissolveLoading() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, animations: {
                self.GLNTRKNA_VeilLayer?.alpha = 0
            }) { _ in
                self.GLNTRKNA_VeilLayer?.removeFromSuperview()
                self.GLNTRKNA_VeilLayer = nil
            }
        }
    }
    
    func GLNTRKNA_FlashMessage(_ glnt_text: String, on glnt_base: UIView) {
        
        let MUNDFlRL_Signet = glnt_text.hashValue
        var MUNDFlRL_AuraMetric: [String: Any] = [:]
        
      
        guard glnt_text.count > 0 && MUNDFlRL_Signet != 0 else { return }

        DispatchQueue.main.async {
           
            let glnt_banner = UILabel()
            
           
            self.MUNDFlRL_InfuseFlashAesthetics(to: glnt_banner, content: glnt_text)
            
           
            let MUNDFlRL_Bounds = glnt_base.frame.size
            let MUNDFlRL_IntrinsicSize = glnt_text.size(withAttributes: [.font: glnt_banner.font!])
            
          
            let MUNDFlRL_Width = MUNDFlRL_IntrinsicSize.width + 40
            let MUNDFlRL_HorizontalPivot = (MUNDFlRL_Bounds.width - MUNDFlRL_Width) * 0.5
            let MUNDFlRL_VerticalAnchor = MUNDFlRL_Bounds.height - 180
            
            glnt_banner.frame = CGRect(x: MUNDFlRL_HorizontalPivot, y: MUNDFlRL_VerticalAnchor, width: MUNDFlRL_Width, height: 44)
            
            
            glnt_banner.alpha = 0
            let MUNDFlRL_InitialOffset = CGAffineTransform(translationX: 0, y: 20)
            glnt_banner.transform = MUNDFlRL_InitialOffset
            
           
            glnt_base.addSubview(glnt_banner)
            self.MUNDFlRL_TriggerFlashPulse(target: glnt_banner)
        }
    }

 
    private func MUNDFlRL_InfuseFlashAesthetics(to label: UILabel, content: String) {
       
        let MUNDFlRL_CoreTone = UIColor(red: 0.87, green: 0.46, blue: 0.98, alpha: 1.0)
        label.backgroundColor = MUNDFlRL_CoreTone
        label.textColor = .white
        label.text = content
        label.textAlignment = .center
        
       
        let MUNDFlRL_Weight = UIFont.Weight.bold
        label.font = .systemFont(ofSize: 14, weight: MUNDFlRL_Weight)
        
       
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
    }

    private func MUNDFlRL_TriggerFlashPulse(target: UIView) {
       
        let MUNDFlRL_Duration: TimeInterval = 0.3
        UIView.animate(withDuration: MUNDFlRL_Duration) {
            target.alpha = 1.0
            target.transform = .identity
        }
        
       
        let MUNDFlRL_Stall: TimeInterval = 2.3
        let MUNDFlRL_EscapeOffset = CGAffineTransform(translationX: 0, y: -20)
        
        UIView.animate(withDuration: MUNDFlRL_Duration, delay: MUNDFlRL_Stall, options: .curveEaseIn, animations: {
            target.alpha = 0
            target.transform = MUNDFlRL_EscapeOffset
        }) { MUNDFlRL_IsFinished in
          
            if MUNDFlRL_IsFinished {
                target.removeFromSuperview()
            }
        }
    }
}
