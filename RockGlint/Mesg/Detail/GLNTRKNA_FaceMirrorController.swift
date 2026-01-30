//
//  GLNTRKNA_FaceMirrorController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/29.
//

import UIKit
import AVFoundation

class GLNTRKNA_FaceMirrorController: UIViewController {

    var GLNTRKNA_RemoteIdentity: String = "Faelan"
    
    private let GLNTRKNA_HorizonW = UIScreen.main.bounds.width
    private let GLNTRKNA_VerticalH = UIScreen.main.bounds.height
    private let GLNTRKNA_ScaleX = UIScreen.main.bounds.width / 393.0
    private let GLNTRKNA_ScaleY = UIScreen.main.bounds.height / 852.0

    private let GLNTRKNA_RemoteStage = UIImageView()
    private let GLNTRKNA_SelfPortal = UIView()
    private let GLNTRKNA_CommandHub = UIView()
    private let GLNTRKNA_IdentityLabel = UILabel()
    private let GLNTRKNA_SessionTimer = UILabel()
    
    private var GLNTRKNA_TickCounter: Int = 0
    private var GLNTRKNA_PulseTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_IgniteScenery()
        GLNTRKNA_StartMetricPulse()
    }
    //report
   @objc func gln_reportTraiiler()  {
       let safetyvc =  GLNTRKNA_SafetyHubController.init(GLNTRKNA_ActiveMode: .GLNTRKNA_PrimarySelection)
       self.present(safetyvc, animated: true)
    }
    private func GLNTRKNA_IgniteScenery() {
        view.backgroundColor = .black
        
        GLNTRKNA_RemoteStage.frame = view.bounds
        GLNTRKNA_RemoteStage.contentMode = .scaleAspectFill
        GLNTRKNA_RemoteStage.image = UIImage(named: "gln_remote_preview")
        GLNTRKNA_RemoteStage.backgroundColor = .darkGray
        view.addSubview(GLNTRKNA_RemoteStage)
        
        let gln_top_shadow = UIView(frame: CGRect(x: 0, y: 0, width: GLNTRKNA_HorizonW, height: 150 * GLNTRKNA_ScaleY))
        gln_top_shadow.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.addSubview(gln_top_shadow)

        let gln_exit_btn = UIButton(frame: CGRect(x: 20 * GLNTRKNA_ScaleX, y: 60 * GLNTRKNA_ScaleY, width: 30 * GLNTRKNA_ScaleX, height: 30 * GLNTRKNA_ScaleX))
        gln_exit_btn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        gln_exit_btn.tintColor = .white
        gln_exit_btn.addTarget(self, action: #selector(GLNTRKNA_TerminateStream), for: .touchUpInside)
        view.addSubview(gln_exit_btn)
        
        let gln_options_btn = UIButton(frame: CGRect(x: GLNTRKNA_HorizonW - 50 * GLNTRKNA_ScaleX, y: 60 * GLNTRKNA_ScaleY, width: 40 * GLNTRKNA_ScaleX, height: 30 * GLNTRKNA_ScaleX))
        gln_options_btn.setImage(UIImage(named: "gln_report"), for: .normal)
        gln_options_btn.addTarget(self, action: #selector(gln_reportTraiiler), for: .touchUpInside)
        view.addSubview(gln_options_btn)

        GLNTRKNA_IdentityLabel.frame = CGRect(x: 0, y: 60 * GLNTRKNA_ScaleY, width: GLNTRKNA_HorizonW, height: 30 * GLNTRKNA_ScaleY)
        GLNTRKNA_IdentityLabel.text = GLNTRKNA_RemoteIdentity
        GLNTRKNA_IdentityLabel.textColor = .white
        GLNTRKNA_IdentityLabel.textAlignment = .center
        GLNTRKNA_IdentityLabel.font = .boldSystemFont(ofSize: 18)
        view.addSubview(GLNTRKNA_IdentityLabel)

        GLNTRKNA_SelfPortal.frame = CGRect(x: GLNTRKNA_HorizonW - 130 * GLNTRKNA_ScaleX, y: 120 * GLNTRKNA_ScaleY, width: 110 * GLNTRKNA_ScaleX, height: 160 * GLNTRKNA_ScaleY)
        GLNTRKNA_SelfPortal.backgroundColor = .black
        GLNTRKNA_SelfPortal.layer.cornerRadius = 12
        GLNTRKNA_SelfPortal.clipsToBounds = true
        GLNTRKNA_SelfPortal.layer.borderWidth = 1
        GLNTRKNA_SelfPortal.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        view.addSubview(GLNTRKNA_SelfPortal)
        
        GLNTRKNA_AssembleCommandHub()
    }

    private func GLNTRKNA_AssembleCommandHub() {
        GLNTRKNA_CommandHub.frame = CGRect(x: 0, y: GLNTRKNA_VerticalH - 220 * GLNTRKNA_ScaleY, width: GLNTRKNA_HorizonW, height: 220 * GLNTRKNA_ScaleY)
        view.addSubview(GLNTRKNA_CommandHub)
        
        let gln_hang_btn = UIButton(frame: CGRect(x: (GLNTRKNA_HorizonW - 80 * GLNTRKNA_ScaleX) / 2, y: 20 * GLNTRKNA_ScaleY, width: 80 * GLNTRKNA_ScaleX, height: 80 * GLNTRKNA_ScaleX))
        gln_hang_btn.backgroundColor = .systemRed
        gln_hang_btn.layer.cornerRadius = 40 * GLNTRKNA_ScaleX
        gln_hang_btn.setImage(UIImage(systemName: "phone.down.fill"), for: .normal)
        gln_hang_btn.tintColor = .white
        gln_hang_btn.addTarget(self, action: #selector(GLNTRKNA_TerminateStream), for: .touchUpInside)
        GLNTRKNA_CommandHub.addSubview(gln_hang_btn)
        
        let gln_ctrl_y = 130 * GLNTRKNA_ScaleY
        let gln_ctrl_spacing = GLNTRKNA_HorizonW / 5
        let gln_symbols = ["video.fill", "mic.fill", "drop.fill", "camera.rotate.fill"]
        
        for (index, symbol) in gln_symbols.enumerated() {
            let gln_btn = UIButton(frame: CGRect(x: CGFloat(index + 1) * gln_ctrl_spacing - 25 * GLNTRKNA_ScaleX, y: gln_ctrl_y, width: 50 * GLNTRKNA_ScaleX, height: 50 * GLNTRKNA_ScaleX))
            gln_btn.backgroundColor = UIColor.white.withAlphaComponent(0.15)
            gln_btn.layer.cornerRadius = 25 * GLNTRKNA_ScaleX
            gln_btn.setImage(UIImage(systemName: symbol), for: .normal)
            gln_btn.tintColor = .white
            if index == 2 { gln_btn.tintColor = .white } // Representing the 'beauty' or 'filter' drop icon
            GLNTRKNA_CommandHub.addSubview(gln_btn)
        }
    }

    private func GLNTRKNA_StartMetricPulse() {
        GLNTRKNA_PulseTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let gln_s = self else { return }
            gln_s.GLNTRKNA_TickCounter += 1
            // Optional: Update a timer label if needed
        }
    }

    @objc private func GLNTRKNA_TerminateStream() {
        GLNTRKNA_PulseTimer?.invalidate()
        GLNTRKNA_PulseTimer = nil
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        self.dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
