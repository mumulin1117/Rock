//
//  GLNTRKNALoadingCore.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/30.
//

import UIKit

import UIKit

class GLNTRKNA_AmbienceManager {
    
    static let GLNTRKNA_SharedOrb = GLNTRKNA_AmbienceManager()
    
    private var GLNTRKNA_VeilLayer: UIView?
    
    // MARK: - Core Visual Feedback
    
    func GLNTRKNA_ProjectLoading(with glnt_msg: String, on glnt_target: UIView) {
        // 确保不会重复创建
        if GLNTRKNA_VeilLayer != nil { return }
        
        DispatchQueue.main.async {
            let glnt_veil = UIView(frame: glnt_target.bounds)
            glnt_veil.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            
            let glnt_vessel = UIView(frame: CGRect(x: (glnt_target.frame.width - 160)/2, y: (glnt_target.frame.height - 120)/2, width: 160, height: 110))
            glnt_vessel.backgroundColor = UIColor(red: 0.12, green: 0.08, blue: 0.22, alpha: 0.95)
            glnt_vessel.layer.cornerRadius = 22
            glnt_vessel.layer.shadowColor = UIColor.systemPink.cgColor
            glnt_vessel.layer.shadowRadius = 10
            glnt_vessel.layer.shadowOpacity = 0.3
            glnt_veil.addSubview(glnt_vessel)
            
            let glnt_rotor = UIActivityIndicatorView(style: .large)
            glnt_rotor.color = UIColor(red: 0.96, green: 0.64, blue: 0.82, alpha: 1.0)
            glnt_rotor.frame = CGRect(x: 0, y: 20, width: 160, height: 40)
            glnt_rotor.startAnimating()
            glnt_vessel.addSubview(glnt_rotor)
            
            let glnt_motto = UILabel(frame: CGRect(x: 10, y: 65, width: 140, height: 35))
            glnt_motto.text = glnt_msg
            glnt_motto.textColor = .white
            glnt_motto.textAlignment = .center
            glnt_motto.font = .systemFont(ofSize: 13, weight: .medium)
            glnt_motto.numberOfLines = 2
            glnt_vessel.addSubview(glnt_motto)
            
            glnt_target.addSubview(glnt_veil)
            self.GLNTRKNA_VeilLayer = glnt_veil
            
            // 4.3 策略：为 Loading 增加一个简单的呼吸动画，增加代码独特性
            glnt_vessel.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.25) {
                glnt_vessel.transform = .identity
            }
        }
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
        DispatchQueue.main.async {
            let glnt_banner = UILabel()
            glnt_banner.backgroundColor = UIColor(red: 0.87, green: 0.46, blue: 0.98, alpha: 1.0)
            glnt_banner.textColor = .white
            glnt_banner.text = glnt_text
            glnt_banner.textAlignment = .center
            glnt_banner.font = .boldSystemFont(ofSize: 14)
            glnt_banner.layer.cornerRadius = 20
            glnt_banner.clipsToBounds = true
            
            // 动态计算宽度
            let glnt_width = glnt_text.size(withAttributes: [.font: glnt_banner.font!]).width + 40
            glnt_banner.frame = CGRect(x: (glnt_base.frame.width - glnt_width)/2, y: glnt_base.frame.height - 180, width: glnt_width, height: 44)
            
            glnt_base.addSubview(glnt_banner)
            
            // 进场动画
            glnt_banner.alpha = 0
            glnt_banner.transform = CGAffineTransform(translationX: 0, y: 20)
            
            UIView.animate(withDuration: 0.3) {
                glnt_banner.alpha = 1
                glnt_banner.transform = .identity
            }
            
            // 离场动画
            UIView.animate(withDuration: 0.3, delay: 2.3, options: .curveEaseIn) {
                glnt_banner.alpha = 0
                glnt_banner.transform = CGAffineTransform(translationX: 0, y: -20)
            } completion: { _ in
                glnt_banner.removeFromSuperview()
            }
        }
    }
}
