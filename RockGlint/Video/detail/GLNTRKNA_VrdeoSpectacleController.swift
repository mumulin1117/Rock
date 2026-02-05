//
//  GLNTRKNA_VrdeoSpectacleController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/29.
//

import UIKit
import AVFoundation

class GLNTRKNA_VideoSpectacleController: UIViewController {
    
    private var GLNTRKNA_DataManifest: GLNTRKNA_MomentEntry
    
    init(gln_data: GLNTRKNA_MomentEntry) {
        self.GLNTRKNA_DataManifest = gln_data
        super.init(nibName: nil, bundle: nil)
        
        gln_data.glnt_comments.forEach { item in
            GLNTRKNA_MockResponses.append(GLNTRKNA_FeedbackEntity(GLNTRKNA_VoxName: ["Veyra","Elara","Galen Jax","Jone Mark","Me"].randomElement()!, GLNTRKNA_VoxAvatar: "GTRKnauserIId\(Int.random(in: 0...15))", GLNTRKNA_VoxProse: item))
        }
    }
    
    required init?(coder: NSCoder) { fatalError("GLNTRKNA_Init_Err") }
    
   
   
    // MARK: - GLNTRKNA: Playback Engine
        private var GLNTRKNA_PlayerTube: AVPlayer?
        private var GLNTRKNA_MonitorLayer: AVPlayerLayer?
        private let GLNTRKNA_VideoContainer = UIView()
    
  
    private let GLNTRKNA_CanvasWidth = UIScreen.main.bounds.width
    private let GLNTRKNA_CanvasHeight = UIScreen.main.bounds.height
    
    private let GLNTRKNA_VesselScroll = UIScrollView()
    private let GLNTRKNA_VisualPlate = UIImageView()
    private let GLNTRKNA_PlayFreezeIcon = UIImageView()
    private let GLNTRKNA_UserAvatar = UIButton()
    private let GLNTRKNA_UserNameLabel = UILabel()
    private let GLNTRKNA_MetricsLabel = UILabel()
    private let GLNTRKNA_ProseBody = UILabel()
    private let GLNTRKNA_CommentStack = UIStackView()
    private let GLNTRKNA_InputHarbor = UIView()
    private let GLNTRKNA_CommentField = UITextField()
    
    private var GLNTRKNA_IsPlaybackActive = false
//    private var GLNTRKNA_Payload: GLNTRKNA_MomentEntry?
    
    private var GLNTRKNA_MockResponses:[GLNTRKNA_FeedbackEntity] = []

//    func GLNTRKNA_SynchronizeData(gln_data: GLNTRKNA_MomentEntry) {
//        self.GLNTRKNA_Payload = gln_data
//    }
    lazy var gln_heart:UIButton = {
        return UIButton(frame: CGRect(x: GLNTRKNA_CanvasWidth - 75, y: GLNTRKNA_MetricH(385), width: 55, height: 55))
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_PlayFreezeIcon.isHidden = true
        GLNTRKNA_AssembleScenery()
        GLNTRKNA_PopulateMockIntel()
        GLNTRKNA_InitializeSecureTheater()
        
        if GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_TogglecheckLikeMoment(momentID: self.GLNTRKNA_DataManifest.glnt_userId) {
            self.gln_heart.isSelected = true
        }else{
            self.gln_heart.isSelected = false
        }
        GLNTRKNA_SetupObservers()
    }
    private func GLNTRKNA_SetupObservers() {
            // 注册黑名单变更监听
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(GLNTRKNA_DismissScene),
                name: .GLNTRKNA_ObsidianListChanged,
                object: nil
            )
       
    }
    @objc private func GLNTRKNA_HandleBlacklistUpdate() {
        
        
    }
    private func GLNTRKNA_InitializeSecureTheater() {
        GLNTRKNA_VideoContainer.frame = GLNTRKNA_VisualPlate.bounds
        GLNTRKNA_VideoContainer.backgroundColor = .black
        GLNTRKNA_VisualPlate.addSubview(GLNTRKNA_VideoContainer)
        
        // 修复点 1: 确保文件名正确。从你的 plist  来看，
        // 视频标识符可能是 "SPPuuuRRll10" 这种格式。
        guard let gln_path = Bundle.main.path(forResource: GLNTRKNA_DataManifest.SPPuuuRRll, ofType: "mp4") else {
            print("GLNTRKNA Error: Video asset not found in bundle")
            return
        }
        
        // 修复点 2: 必须使用 fileURLWithPath
        let gln_url = URL(fileURLWithPath: gln_path)
        
        let gln_asset = AVURLAsset(url: gln_url)
        let gln_item = AVPlayerItem(asset: gln_asset)
        GLNTRKNA_PlayerTube = AVPlayer(playerItem: gln_item)
        
        GLNTRKNA_MonitorLayer = AVPlayerLayer(player: GLNTRKNA_PlayerTube)
        GLNTRKNA_MonitorLayer?.frame = GLNTRKNA_VideoContainer.bounds
        GLNTRKNA_MonitorLayer?.videoGravity = .resizeAspectFill
        
        if let layer = GLNTRKNA_MonitorLayer {
            GLNTRKNA_VideoContainer.layer.addSublayer(layer)
        }
        
        // 修复点 3: 显式调用 play()，且处理音频会话
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback)
        GLNTRKNA_PlayerTube?.play()
        
        // 循环播放监听
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: gln_item, queue: .main) { [weak self] _ in
            self?.GLNTRKNA_PlayerTube?.seek(to: .zero)
            self?.GLNTRKNA_PlayerTube?.play()
        }
        
        GLNTRKNA_VisualPlate.addSubview(GLNTRKNA_PlayFreezeIcon)
       
    }
   @objc func GLNTRKNAToaogScenery() {
       
        self.navigationController?.pushViewController(GLNTRKNA_GuestOrbitController.init(GLNTRKNACelestialData: GLNTRKNA_DataManifest), animated: true)
    }
    private func GLNTRKNA_AssembleScenery() {
        
        GLNTRKNA_UserAvatar.addTarget(self, action: #selector(GLNTRKNAToaogScenery), for: .touchUpInside)
       
        
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
        GLNTRKNA_PlayFreezeIcon.image = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNAplauid")
        GLNTRKNA_PlayFreezeIcon.tintColor = .white
        GLNTRKNA_PlayFreezeIcon.alpha = 0.8
//         
//        let gln_back = UIButton(frame: CGRect(x: 20, y: 50, width: 40, height: 40))
//        gln_back.setImage(UIImage(systemName: "arrow.left"), for: .normal)
//        gln_back.tintColor = .white
//        gln_back.addTarget(self, action: #selector(GLNTRKNA_DismissScene), for: .touchUpInside)
//        view.addSubview(gln_back)
//        
//        let gln_more = UIButton(frame: CGRect(x: GLNTRKNA_CanvasWidth - 60, y: 50, width: 40, height: 40))
//        gln_more.setImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_report"), for: .normal)
//        gln_more.addTarget(self, action: #selector(gln_reportTraiiler), for: .touchUpInside)
        let gln_options_btn = UIButton()
        gln_options_btn.setImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_report"), for: .normal)
        gln_options_btn.addTarget(self, action: #selector(gln_reportTraiiler), for: .touchUpInside)
        gln_options_btn.tintColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: gln_options_btn)
     
        
       
//        view.addSubview(gln_more)
        
        GLNTRKNA_UserAvatar.frame = CGRect(x: 20, y: GLNTRKNA_MetricH(380), width: 60, height: 60)
        GLNTRKNA_UserAvatar.layer.cornerRadius = 30
        GLNTRKNA_UserAvatar.layer.borderWidth = 2
        GLNTRKNA_UserAvatar.layer.borderColor = UIColor.systemPink.cgColor
        GLNTRKNA_UserAvatar.clipsToBounds = true
        GLNTRKNA_UserAvatar.setImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: GLNTRKNA_DataManifest.glnt_userId), for: .normal)
        
        
        
        GLNTRKNA_VesselScroll.addSubview(GLNTRKNA_UserAvatar)
        GLNTRKNA_UserNameLabel.text =  GLNTRKNA_DataManifest.glnt_userName
        GLNTRKNA_UserNameLabel.frame = CGRect(x: 90, y: GLNTRKNA_MetricH(385), width: 200, height: 25)
        GLNTRKNA_UserNameLabel.textColor = .white
        GLNTRKNA_UserNameLabel.font = .boldSystemFont(ofSize: 18)
        GLNTRKNA_VesselScroll.addSubview(GLNTRKNA_UserNameLabel)
        GLNTRKNA_MetricsLabel.text = "\(GLNTRKNA_DataManifest.glnt_content.count) comment"
        GLNTRKNA_MetricsLabel.frame = CGRect(x: 90, y: GLNTRKNA_MetricH(410), width: 200, height: 20)
        GLNTRKNA_MetricsLabel.textColor = .lightGray
        GLNTRKNA_MetricsLabel.font = .systemFont(ofSize: 14)
        GLNTRKNA_VesselScroll.addSubview(GLNTRKNA_MetricsLabel)
        
        
     
        gln_heart.setImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_heart"), for: .normal)
        gln_heart.setImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_heart_fill"), for: .selected)
        gln_heart.addTarget(self, action: #selector(GLNTRKNA_Triggeractionlike(heiaufi: )), for: .touchUpInside)
      
        GLNTRKNA_VesselScroll.addSubview(gln_heart)
        
        let gln_content_y = GLNTRKNA_MetricH(480)
        GLNTRKNA_ProseBody.frame = CGRect(x: 20, y: gln_content_y, width: GLNTRKNA_CanvasWidth - 40, height: 60)
        GLNTRKNA_ProseBody.textColor = .white
        GLNTRKNA_ProseBody.numberOfLines = 3
        GLNTRKNA_ProseBody.font = .systemFont(ofSize: 15)
        GLNTRKNA_ProseBody.text = GLNTRKNA_DataManifest.glnt_content
        GLNTRKNA_VesselScroll.addSubview(GLNTRKNA_ProseBody)
        
        let gln_line = UIView(frame: CGRect(x: 20, y: gln_content_y + 75, width: GLNTRKNA_CanvasWidth - 40, height: 0.5))
        gln_line.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        GLNTRKNA_VesselScroll.addSubview(gln_line)
        
        let gln_title = UIImageView(frame: CGRect(x: 20, y: gln_content_y + 90, width: 160, height: 25))
        gln_title.image = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "commententsection")
        GLNTRKNA_VesselScroll.addSubview(gln_title)
        
        GLNTRKNA_CommentStack.axis = .vertical
        GLNTRKNA_CommentStack.spacing = 15
        GLNTRKNA_CommentStack.frame = CGRect(x: 20, y: gln_content_y + 130, width: GLNTRKNA_CanvasWidth - 40, height:CGFloat(GLNTRKNA_DataManifest.glnt_comments.count)*40)
        GLNTRKNA_VesselScroll.addSubview(GLNTRKNA_CommentStack)
        
        GLNTRKNA_SetupInputHarbor()
    }
    @objc private func GLNTRKNA_Triggeractionlike(heiaufi:UIButton) {
        GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_ToggleMomentLiking(momentID: self.GLNTRKNA_DataManifest.glnt_userId)
        
        if GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_TogglecheckLikeMoment(momentID: self.GLNTRKNA_DataManifest.glnt_userId) {
            self.gln_heart.isSelected = true
        }else{
            self.gln_heart.isSelected = false
        }
       
        
        self.GLNTRKNA_DataManifest.glntifFollowed = self.gln_heart.isSelected
    }
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
        GLNTRKNA_CommentField.placeholder = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"zupmnLsuw+lU6IIK58TypkVxjkzHhYJ69kcytW4/iYBMMIx8fmoaqPIOX8/v1w==")
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
                GLNTRKNA_PlayFreezeIcon.isHidden = true
                GLNTRKNA_PlayerTube?.play()
            } else {
                GLNTRKNA_PlayFreezeIcon.isHidden = false
                GLNTRKNA_PlayerTube?.pause()
            }
            
            UIView.animate(withDuration: 0.2) {
                self.GLNTRKNA_PlayFreezeIcon.alpha = self.GLNTRKNA_IsPlaybackActive ? 0 : 0.8
            }
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }
    
    private func GLNTRKNA_PopulateMockIntel() {
      
        GLNTRKNA_UserNameLabel.text = GLNTRKNA_DataManifest.glnt_userName
        GLNTRKNA_MetricsLabel.text = "\(GLNTRKNA_DataManifest.glnt_comments.count) comments"
        GLNTRKNA_ProseBody.text = GLNTRKNA_DataManifest.glnt_content
        
        for gln_item in GLNTRKNA_MockResponses {
            GLNTRKNA_AppendCommentRow(gln_img: gln_item.GLNTRKNA_VoxAvatar, gln_name: gln_item.GLNTRKNA_VoxName, gln_text: gln_item.GLNTRKNA_VoxProse)
        }
    }
    
    @objc private func GLNTRKNA_InjectComment() {
        guard let gln_txt = GLNTRKNA_CommentField.text, !gln_txt.isEmpty else {
            GLNTRKNA_ToastVisuals(gln_msg: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"8dAi6LKt+o8Vm46wAQIjMO6A5aa6X0+CGtG5b0yeH5D6VB8akRLXVCc4qpWpjdHP9bVjTffJwz0ARLDkIg=="))
            return
            
        }
        view.endEditing(true)
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { [weak self] in
            guard let self = self else { return }
            GLNTRKNA_DataManifest.glnt_comments.insert(gln_txt, at: 0)
            GLNTRKNA_CommentStack.frame.size.height = CGFloat(GLNTRKNA_DataManifest.glnt_comments.count + 1)*40
            
            
            GLNTRKNA_AppendCommentRow(gln_img: "", gln_name: "Me", gln_text: gln_txt, gln_top: true)
            GLNTRKNA_CommentField.text = ""
            GLNTRKNA_CommentField.resignFirstResponder()
            
            let gln_success = UINotificationFeedbackGenerator()
            gln_success.notificationOccurred(.success)
            
            // 5. GLNTRKNA: 清空输入并提示成功
            self.GLNTRKNA_CommentField.text = ""
            self.GLNTRKNA_ToastVisuals(gln_msg: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"m9MalJ5WEA6UROTg/edTSksfXkr3EQ9u4H5GOvV+ydXm0VAflqxLu6yMFbbgmWWMmBdJyGLStaCsrhJSxr7X"))
            
        }
            
        
        
    }
    
    private func GLNTRKNA_AppendCommentRow(gln_img:String,gln_name: String, gln_text: String, gln_top: Bool = false) {
        let gln_row = UIView()
        let gln_ava = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        gln_ava.backgroundColor = .gray
        gln_ava.layer.cornerRadius = 22.5
        gln_ava.clipsToBounds = true
        gln_ava.image = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: gln_img)
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
