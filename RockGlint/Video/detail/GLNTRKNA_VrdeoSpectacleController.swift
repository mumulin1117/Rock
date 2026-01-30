//
//  GLNTRKNA_VrdeoSpectacleController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/29.
//

import UIKit
import AVFoundation

class GLNTRKNA_VideoSpectacleController: UIViewController {
    // MARK: - GLNTRKNA: Playback Engine
        private var GLNTRKNA_PlayerTube: AVPlayer?
        private var GLNTRKNA_MonitorLayer: AVPlayerLayer?
        private let GLNTRKNA_VideoContainer = UIView()
    
    private let GLNTRKNA_CipherKey = "GLNTRKNA_KEY_888" // Your AES Key
        private let GLNTRKNA_LocalScheme = "gln-secure"
    
    private let GLNTRKNA_CanvasWidth = UIScreen.main.bounds.width
    private let GLNTRKNA_CanvasHeight = UIScreen.main.bounds.height
    
    private let GLNTRKNA_VesselScroll = UIScrollView()
    private let GLNTRKNA_VisualPlate = UIImageView()
    private let GLNTRKNA_PlayFreezeIcon = UIImageView()
    private let GLNTRKNA_UserAvatar = UIImageView()
    private let GLNTRKNA_UserNameLabel = UILabel()
    private let GLNTRKNA_MetricsLabel = UILabel()
    private let GLNTRKNA_ProseBody = UILabel()
    private let GLNTRKNA_CommentStack = UIStackView()
    private let GLNTRKNA_InputHarbor = UIView()
    private let GLNTRKNA_CommentField = UITextField()
    
    private var GLNTRKNA_IsPlaybackActive = false
    private var GLNTRKNA_Payload: GLNTRKNA_NailVideoModel?
    
    private let GLNTRKNA_MockResponses = [
        ("Joren Veyra", "Nails > words!", "gln_ava_1"),
        ("Cerys Elara", "Haha, YES! Who needs words when your nails are this fabulous? 🙌", "gln_ava_2"),
        ("Galen Jax", "I'm here for nails that speak louder than my thoughts", "gln_ava_3")
    ]

    func GLNTRKNA_SynchronizeData(gln_data: GLNTRKNA_NailVideoModel) {
        self.GLNTRKNA_Payload = gln_data
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_AssembleScenery()
        GLNTRKNA_PopulateMockIntel()
    }
    private func GLNTRKNA_InitializeSecureTheater() {
            // GLNTRKNA: Setup Video Container inside the VisualPlate
            GLNTRKNA_VideoContainer.frame = GLNTRKNA_VisualPlate.bounds
            GLNTRKNA_VideoContainer.backgroundColor = .black
            GLNTRKNA_VisualPlate.addSubview(GLNTRKNA_VideoContainer)
            
            // GLNTRKNA: Locate Encrypted Asset
            guard let gln_path = Bundle.main.path(forResource: "gln_promo_vid", ofType: "aes"),
                  var gln_url = URL(string: gln_path) else { return }
            
            // GLNTRKNA: Redirect URL to our custom loader
            var gln_components = URLComponents(url: gln_url, resolvingAgainstBaseURL: false)
            gln_components?.scheme = GLNTRKNA_LocalScheme
            guard let gln_redirect_url = gln_components?.url else { return }

            let gln_asset = AVURLAsset(url: gln_redirect_url)
            // Important: Set the delegate to handle decryption
//            gln_asset.resourceLoader.setDelegate(self, queue: DispatchQueue.main)
            
            let gln_item = AVPlayerItem(asset: gln_asset)
            GLNTRKNA_PlayerTube = AVPlayer(playerItem: gln_item)
            
            GLNTRKNA_MonitorLayer = AVPlayerLayer(player: GLNTRKNA_PlayerTube)
            GLNTRKNA_MonitorLayer?.frame = GLNTRKNA_VideoContainer.bounds
        GLNTRKNA_MonitorLayer?.videoGravity = .resizeAspectFill
            GLNTRKNA_VideoContainer.layer.addSublayer(GLNTRKNA_MonitorLayer!)
            
            // Loop Playback
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: gln_item, queue: .main) { _ in
                self.GLNTRKNA_PlayerTube?.seek(to: .zero)
                self.GLNTRKNA_PlayerTube?.play()
            }
        }

    private func GLNTRKNA_AssembleScenery() {
        view.backgroundColor = UIColor(red: 0.05, green: 0.04, blue: 0.15, alpha: 1.0)
        
        GLNTRKNA_VesselScroll.frame = CGRect(x: 0, y: 0, width: GLNTRKNA_CanvasWidth, height: GLNTRKNA_CanvasHeight - GLNTRKNA_MetricH(100))
        GLNTRKNA_VesselScroll.contentSize = CGSize(width: GLNTRKNA_CanvasWidth, height: GLNTRKNA_CanvasHeight * 1.2)
        GLNTRKNA_VesselScroll.contentInsetAdjustmentBehavior = .never
        view.addSubview(GLNTRKNA_VesselScroll)
        
        GLNTRKNA_VisualPlate.frame = CGRect(x: 0, y: 0, width: GLNTRKNA_CanvasWidth, height: GLNTRKNA_MetricH(460))
        GLNTRKNA_VisualPlate.contentMode = .scaleAspectFill
        GLNTRKNA_VisualPlate.clipsToBounds = true
        GLNTRKNA_VisualPlate.isUserInteractionEnabled = true
        GLNTRKNA_VisualPlate.backgroundColor = .black
        GLNTRKNA_VesselScroll.addSubview(GLNTRKNA_VisualPlate)
        
        let gln_tap = UITapGestureRecognizer(target: self, action: #selector(GLNTRKNA_ToggleMotionState))
        GLNTRKNA_VisualPlate.addGestureRecognizer(gln_tap)
        
        GLNTRKNA_PlayFreezeIcon.frame = CGRect(x: (GLNTRKNA_CanvasWidth - 70)/2, y: (GLNTRKNA_MetricH(460) - 70)/2, width: 70, height: 70)
        GLNTRKNA_PlayFreezeIcon.image = UIImage(named: "GLNTRKNAplauid")
        GLNTRKNA_PlayFreezeIcon.tintColor = .white
        GLNTRKNA_PlayFreezeIcon.alpha = 0.8
        GLNTRKNA_VisualPlate.addSubview(GLNTRKNA_PlayFreezeIcon)
        
        let gln_back = UIButton(frame: CGRect(x: 20, y: 50, width: 40, height: 40))
        gln_back.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        gln_back.tintColor = .white
        gln_back.addTarget(self, action: #selector(GLNTRKNA_DismissScene), for: .touchUpInside)
        view.addSubview(gln_back)
        
        let gln_more = UIButton(frame: CGRect(x: GLNTRKNA_CanvasWidth - 60, y: 50, width: 40, height: 40))
        gln_more.setImage(UIImage(named: "gln_report"), for: .normal)
        gln_more.addTarget(self, action: #selector(gln_reportTraiiler), for: .touchUpInside)
        gln_more.tintColor = .white
        view.addSubview(gln_more)
        
        GLNTRKNA_UserAvatar.frame = CGRect(x: 20, y: GLNTRKNA_MetricH(380), width: 60, height: 60)
        GLNTRKNA_UserAvatar.layer.cornerRadius = 30
        GLNTRKNA_UserAvatar.layer.borderWidth = 2
        GLNTRKNA_UserAvatar.layer.borderColor = UIColor.systemPink.cgColor
        GLNTRKNA_UserAvatar.clipsToBounds = true
        GLNTRKNA_VesselScroll.addSubview(GLNTRKNA_UserAvatar)
        
        GLNTRKNA_UserNameLabel.frame = CGRect(x: 90, y: GLNTRKNA_MetricH(385), width: 200, height: 25)
        GLNTRKNA_UserNameLabel.textColor = .white
        GLNTRKNA_UserNameLabel.font = .boldSystemFont(ofSize: 18)
        GLNTRKNA_VesselScroll.addSubview(GLNTRKNA_UserNameLabel)
        
        GLNTRKNA_MetricsLabel.frame = CGRect(x: 90, y: GLNTRKNA_MetricH(410), width: 200, height: 20)
        GLNTRKNA_MetricsLabel.textColor = .lightGray
        GLNTRKNA_MetricsLabel.font = .systemFont(ofSize: 14)
        GLNTRKNA_VesselScroll.addSubview(GLNTRKNA_MetricsLabel)
        
        let gln_heart = UIButton(frame: CGRect(x: GLNTRKNA_CanvasWidth - 75, y: GLNTRKNA_MetricH(385), width: 55, height: 55))
     
        gln_heart.setImage(UIImage(named: "gln_heart"), for: .normal)
        gln_heart.setImage(UIImage(named: "gln_heart_fill"), for: .selected)
       
        GLNTRKNA_VesselScroll.addSubview(gln_heart)
        
        let gln_content_y = GLNTRKNA_MetricH(480)
        GLNTRKNA_ProseBody.frame = CGRect(x: 20, y: gln_content_y, width: GLNTRKNA_CanvasWidth - 40, height: 60)
        GLNTRKNA_ProseBody.textColor = .white
        GLNTRKNA_ProseBody.numberOfLines = 3
        GLNTRKNA_ProseBody.font = .systemFont(ofSize: 15)
        GLNTRKNA_VesselScroll.addSubview(GLNTRKNA_ProseBody)
        
        let gln_line = UIView(frame: CGRect(x: 20, y: gln_content_y + 75, width: GLNTRKNA_CanvasWidth - 40, height: 0.5))
        gln_line.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        GLNTRKNA_VesselScroll.addSubview(gln_line)
        
        let gln_title = UIImageView(frame: CGRect(x: 20, y: gln_content_y + 90, width: 160, height: 25))
        gln_title.image = UIImage(named: "commententsection")
        GLNTRKNA_VesselScroll.addSubview(gln_title)
        
        GLNTRKNA_CommentStack.axis = .vertical
        GLNTRKNA_CommentStack.spacing = 15
        GLNTRKNA_CommentStack.frame = CGRect(x: 20, y: gln_content_y + 130, width: GLNTRKNA_CanvasWidth - 40, height: 0)
        GLNTRKNA_VesselScroll.addSubview(GLNTRKNA_CommentStack)
        
        GLNTRKNA_SetupInputHarbor()
    }
    //report
   @objc func gln_reportTraiiler()  {
       let safetyvc =  GLNTRKNA_SafetyHubController.init(GLNTRKNA_ActiveMode: .GLNTRKNA_ReasonCategorization)
       self.present(safetyvc, animated: true)
    }
    private func GLNTRKNA_SetupInputHarbor() {
        GLNTRKNA_InputHarbor.frame = CGRect(x: 0, y: GLNTRKNA_CanvasHeight - 100, width: GLNTRKNA_CanvasWidth, height: 100)
        GLNTRKNA_InputHarbor.backgroundColor = UIColor(red: 0.08, green: 0.06, blue: 0.18, alpha: 1.0)
        view.addSubview(GLNTRKNA_InputHarbor)
        
        GLNTRKNA_CommentField.frame = CGRect(x: 20, y: 15, width: GLNTRKNA_CanvasWidth - 90, height: 45)
        GLNTRKNA_CommentField.backgroundColor = UIColor(white: 1, alpha: 0.08)
        GLNTRKNA_CommentField.layer.cornerRadius = 22.5
        GLNTRKNA_CommentField.placeholder = "Add Comment..."
        GLNTRKNA_CommentField.textColor = .white
        GLNTRKNA_CommentField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 1))
        GLNTRKNA_CommentField.leftViewMode = .always
        GLNTRKNA_InputHarbor.addSubview(GLNTRKNA_CommentField)
        
        let gln_send = UIButton(frame: CGRect(x: GLNTRKNA_CanvasWidth - 60, y: 15, width: 45, height: 45))
        gln_send.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        gln_send.tintColor = .white
        gln_send.backgroundColor = .systemPink
        gln_send.layer.cornerRadius = 22.5
        gln_send.addTarget(self, action: #selector(GLNTRKNA_InjectComment), for: .touchUpInside)
        GLNTRKNA_InputHarbor.addSubview(gln_send)
    }
    
    @objc private func GLNTRKNA_ToggleMotionState() {
            GLNTRKNA_IsPlaybackActive.toggle()
            
            if GLNTRKNA_IsPlaybackActive {
                GLNTRKNA_PlayerTube?.play()
            } else {
                GLNTRKNA_PlayerTube?.pause()
            }
            
            UIView.animate(withDuration: 0.2) {
                self.GLNTRKNA_PlayFreezeIcon.alpha = self.GLNTRKNA_IsPlaybackActive ? 0 : 0.8
            }
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }
    
    private func GLNTRKNA_PopulateMockIntel() {
        guard let gln_data = GLNTRKNA_Payload else { return }
        GLNTRKNA_UserNameLabel.text = gln_data.gln_user
        GLNTRKNA_MetricsLabel.text = "\(gln_data.gln_comments) comments"
        GLNTRKNA_ProseBody.text = gln_data.gln_desc
        
        for gln_item in GLNTRKNA_MockResponses {
            GLNTRKNA_AppendCommentRow(gln_name: gln_item.0, gln_text: gln_item.1)
        }
    }
    
    @objc private func GLNTRKNA_InjectComment() {
        guard let gln_txt = GLNTRKNA_CommentField.text, !gln_txt.isEmpty else {
            GLNTRKNA_ToastVisuals(gln_msg: "Please enter your thoughts...")
            return
            
        }
        view.endEditing(true)
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { [weak self] in
            guard let self = self else { return }
          
            GLNTRKNA_AppendCommentRow(gln_name: "Me", gln_text: gln_txt, gln_top: true)
            GLNTRKNA_CommentField.text = ""
            GLNTRKNA_CommentField.resignFirstResponder()
            
            let gln_success = UINotificationFeedbackGenerator()
            gln_success.notificationOccurred(.success)
            
            // 5. GLNTRKNA: 清空输入并提示成功
            self.GLNTRKNA_CommentField.text = ""
            self.GLNTRKNA_ToastVisuals(gln_msg: "Comment published successfully!")
            
        }
            
        
        
    }
    
    private func GLNTRKNA_AppendCommentRow(gln_name: String, gln_text: String, gln_top: Bool = false) {
        let gln_row = UIView()
        let gln_ava = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        gln_ava.backgroundColor = .gray
        gln_ava.layer.cornerRadius = 22.5
        gln_ava.clipsToBounds = true
        
        let gln_user = UILabel(frame: CGRect(x: 55, y: 0, width: 200, height: 20))
        gln_user.text = gln_name
        gln_user.textColor = .systemPurple
        gln_user.font = .boldSystemFont(ofSize: 14)
        
        let gln_body = UILabel(frame: CGRect(x: 55, y: 22, width: GLNTRKNA_CanvasWidth - 120, height: 0))
        gln_body.text = gln_text
        gln_body.textColor = .white
        gln_body.font = .systemFont(ofSize: 14)
        gln_body.numberOfLines = 0
        gln_body.sizeToFit()
        
        let gln_h = max(45, gln_body.frame.maxY)
        gln_row.addSubview(gln_ava)
        gln_row.addSubview(gln_user)
        gln_row.addSubview(gln_body)
        
        gln_row.heightAnchor.constraint(equalToConstant: gln_h).isActive = true
        
        if gln_top {
            GLNTRKNA_CommentStack.insertArrangedSubview(gln_row, at: 0)
        } else {
            GLNTRKNA_CommentStack.addArrangedSubview(gln_row)
        }
    }


    // MARK: - GLNTRKNA 虚假提示 UI 组件
    private func GLNTRKNA_ToastVisuals(gln_msg: String) {
        let gln_toast = UILabel()
        gln_toast.text = gln_msg
        gln_toast.textColor = .white
        gln_toast.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        gln_toast.textAlignment = .center
        gln_toast.font = .systemFont(ofSize: 14, weight: .medium)
        gln_toast.layer.cornerRadius = 10
        gln_toast.clipsToBounds = true
        
        let gln_tw = gln_msg.size(withAttributes: [.font: gln_toast.font!]).width + 40
        gln_toast.frame = CGRect(x: (view.frame.width - gln_tw) / 2, y: view.frame.height / 2, width: gln_tw, height: 40)
        gln_toast.alpha = 0
        view.addSubview(gln_toast)
        
        UIView.animate(withDuration: 0.3, animations: {
            gln_toast.alpha = 1
            gln_toast.frame.origin.y -= 20
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 1.5, options: .curveEaseIn, animations: {
                gln_toast.alpha = 0
            }) { _ in
                gln_toast.removeFromSuperview()
            }
        }
    }
    @objc private func GLNTRKNA_DismissScene() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func GLNTRKNA_MetricW(_ v: CGFloat) -> CGFloat { return (GLNTRKNA_CanvasWidth / 393.0) * v }
    private func GLNTRKNA_MetricH(_ v: CGFloat) -> CGFloat { return (GLNTRKNA_CanvasHeight / 852.0) * v }
}

typealias CGAura = CGAffineTransform
