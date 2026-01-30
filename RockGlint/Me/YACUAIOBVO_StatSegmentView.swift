//
//  GLNTRKNAStatSegmentView.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/29.
//

import UIKit

class GLNTRKNAStatSegmentView: UIView {
    
    private let GLNTRKNAValueLab = UILabel()
    private let GLNTRKNAKeyLab = UILabel()
    private let GLNTRKNATopIcon = UIImageView()
    
    // 初始化方法
    init(frame: CGRect, key: String, value: String, isCall: Bool = false) {
        super.init(frame: frame)
        GLNTRKNAArchitect(key: key, value: value, isCall: isCall)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func GLNTRKNAArchitect(key: String, value: String, isCall: Bool) {
        self.backgroundColor = .clear
        
        // 1. 绘制梯形背景
        let yac_shape = CAShapeLayer()
        let yac_path = UIBezierPath()
        // 这里的倾斜逻辑：左边往右斜，右边也往右斜
        yac_path.move(to: CGPoint(x: 15, y: 0))
        yac_path.addLine(to: CGPoint(x: self.bounds.width, y: 0))
        yac_path.addLine(to: CGPoint(x: self.bounds.width - 15, y: self.bounds.height))
        yac_path.addLine(to: CGPoint(x: 0, y: self.bounds.height))
        yac_path.close()
        
        yac_shape.path = yac_path.cgPath
        yac_shape.fillColor = UIColor(white: 1, alpha: 0.1).cgColor
        if isCall {
            yac_shape.fillColor = UIColor(red: 0.22, green: 0.15, blue: 0.45, alpha: 1.0).cgColor
        }
        self.layer.addSublayer(yac_shape)
        
        // 2. 配置文字
        GLNTRKNAValueLab.frame = CGRect(x: 0, y: isCall ? 35 : 30, width: self.bounds.width, height: 25)
        GLNTRKNAValueLab.text = value
        GLNTRKNAValueLab.textAlignment = .center
        GLNTRKNAValueLab.textColor = isCall ? UIColor(red: 0.96, green: 0.64, blue: 0.82, alpha: 1.0) : .white
        GLNTRKNAValueLab.font = .italicSystemFont(ofSize: 18)
        self.addSubview(GLNTRKNAValueLab)
        
        GLNTRKNAKeyLab.frame = CGRect(x: 0, y: isCall ? 12 : 10, width: self.bounds.width, height: 15)
        GLNTRKNAKeyLab.text = key
        GLNTRKNAKeyLab.textAlignment = .center
        GLNTRKNAKeyLab.textColor = .gray
        GLNTRKNAKeyLab.font = .systemFont(ofSize: 12)
        self.addSubview(GLNTRKNAKeyLab)
        
        // 3. 特殊处理：Call 按钮上方的气泡
        if isCall {
            GLNTRKNATopIcon.frame = CGRect(x: (self.bounds.width - 40)/2, y: -25, width: 45, height: 40)
            GLNTRKNATopIcon.image = UIImage(named: "GLNTRKNACallBubble") // 这里对应设计图粉色气泡
            GLNTRKNATopIcon.contentMode = .scaleAspectFit
            self.addSubview(GLNTRKNATopIcon)
            
            // 添加闪烁动画，防止4.3
            GLNTRKNAIgnitePulseEffect()
        }
    }
    
    private func GLNTRKNAIgnitePulseEffect() {
        let yac_anim = CABasicAnimation(keyPath: "opacity")
        yac_anim.fromValue = 1.0
        yac_anim.toValue = 0.6
        yac_anim.duration = 0.8
        yac_anim.autoreverses = true
        yac_anim.repeatCount = .infinity
        GLNTRKNATopIcon.layer.add(yac_anim, forKey: "pulse")
    }
}
