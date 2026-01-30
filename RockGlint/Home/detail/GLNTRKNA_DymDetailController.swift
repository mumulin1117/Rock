//
//  GLNTRKNA_DymDetailController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/28.
//

import UIKit


struct GLNTRKNA_DynamicModel {
    let GLNTRKNA_UserIdentity: String
    let GLNTRKNA_AvatarResource: String
    let GLNTRKNA_HeroAssets: [String]
    let GLNTRKNA_ProseContent: String
    let GLNTRKNA_FeedbackVolume: String
    let GLNTRKNA_ReprintWorks: [String] // Empty implies the default planet view
}

class GLNTRKNA_DymDetailController: UIViewController, UIScrollViewDelegate {
    
    private let GLNTRKNA_RootContainer = UIScrollView()
    private let GLNTRKNA_AssetSlider = UIScrollView()
    private let GLNTRKNA_AssetIndicator = UILabel()
    private let gln_report = UIButton()
    private  let gln_heart = UIButton.init()
    
    private var GLNTRKNA_DataManifest: GLNTRKNA_DynamicModel
    
    init(gln_data: GLNTRKNA_DynamicModel) {
        self.GLNTRKNA_DataManifest = gln_data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("GLNTRKNA_Init_Err") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_InitializeBase()
       
        GLNTRKNA_AssembleVisuals()
    }
    
    private func GLNTRKNA_InitializeBase() {
        GLNTRKNA_RootContainer.contentInsetAdjustmentBehavior = .never
        GLNTRKNA_AssetSlider.contentInsetAdjustmentBehavior = .never
        
        view.backgroundColor = UIColor(red: 0.02, green: 0.02, blue: 0.1, alpha: 1.0)
        GLNTRKNA_RootContainer.frame = view.bounds
        GLNTRKNA_RootContainer.contentInsetAdjustmentBehavior = .never
        GLNTRKNA_RootContainer.showsVerticalScrollIndicator = false
        // GLNTRKNA: 增加 contentSize 以支持底部卡片展开
               
        GLNTRKNA_RootContainer.contentSize = CGSize(width: view.frame.width, height: GLNTRKNA_ScaleH(1100))
        view.addSubview(GLNTRKNA_RootContainer)
    }
    @objc private func GLNTRKNA_ToggleFavorite(sender: UIButton) {
        sender.isSelected.toggle()
        // GLNTRKNA: 虚假触感反馈
        let gln_impact = UIImpactFeedbackGenerator(style: .medium)
        gln_impact.impactOccurred()
        
    }
    
    //report
   @objc func gln_reportTraiiler()  {
       let safetyvc =  GLNTRKNA_SafetyHubController.init(GLNTRKNA_ActiveMode: .GLNTRKNA_ReasonCategorization)
       self.present(safetyvc, animated: true)
    }
    private func GLNTRKNA_AssembleVisuals() {
        let gln_sw = UIScreen.main.bounds.width
        let gln_hero_h = GLNTRKNA_ScaleH(480)
        
        // 1. Hero Carousel
        GLNTRKNA_AssetSlider.frame = CGRect(x: 0, y: 0, width: gln_sw, height: gln_hero_h)
        GLNTRKNA_AssetSlider.isPagingEnabled = true
        GLNTRKNA_AssetSlider.delegate = self
        GLNTRKNA_AssetSlider.showsHorizontalScrollIndicator = false
        
        for (idx, gln_img_name) in GLNTRKNA_DataManifest.GLNTRKNA_HeroAssets.enumerated() {
            let gln_img_v = UIImageView(frame: CGRect(x: CGFloat(idx) * gln_sw, y: 0, width: gln_sw, height: gln_hero_h))
            gln_img_v.contentMode = .scaleAspectFill
            gln_img_v.clipsToBounds = true
            gln_img_v.image = UIImage(named: gln_img_name)
            GLNTRKNA_AssetSlider.addSubview(gln_img_v)
        }
        GLNTRKNA_AssetSlider.contentSize = CGSize(width: CGFloat(GLNTRKNA_DataManifest.GLNTRKNA_HeroAssets.count) * gln_sw, height: gln_hero_h)
        GLNTRKNA_RootContainer.addSubview(GLNTRKNA_AssetSlider)
        
        // 2. Navigation Overlay
        title = "Dymamic Details"
       
        let gln_text_attr: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = gln_text_attr
        navigationController?.navigationBar.tintColor = .white
        
        
        gln_report.setImage(UIImage.init(named: "gln_report"), for: .normal)
        gln_report.addTarget(self, action: #selector(gln_reportTraiiler), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: gln_report)
        
        
        self.gln_heart.setImage(UIImage.init(named: "gln_heart"), for: .normal)
        
        let gln_info_y = gln_hero_h - GLNTRKNA_ScaleH(100)
        let gln_avatar = UIImageView(frame: CGRect(x: GLNTRKNA_ScaleW(20), y: gln_info_y, width: 60, height: 60))
        gln_avatar.layer.cornerRadius = 30
        gln_avatar.layer.borderWidth = 2
        gln_avatar.layer.borderColor = UIColor.systemPink.cgColor
        gln_avatar.clipsToBounds = true
        gln_avatar.image = UIImage(named: GLNTRKNA_DataManifest.GLNTRKNA_AvatarResource)
        GLNTRKNA_RootContainer.addSubview(gln_avatar)
        
        self.gln_heart.frame =  CGRect(x:view.frame.width -  GLNTRKNA_ScaleW(20), y: gln_info_y, width: 60, height: 60)
        
        let gln_user_lbl = UILabel(frame: CGRect(x: GLNTRKNA_ScaleW(90), y: gln_info_y + 5, width: 200, height: 25))
        gln_user_lbl.text = GLNTRKNA_DataManifest.GLNTRKNA_UserIdentity
        gln_user_lbl.textColor = .white
        gln_user_lbl.font = .boldSystemFont(ofSize: 18)
        GLNTRKNA_RootContainer.addSubview(gln_user_lbl)
        
        let gln_stat_lbl = UILabel(frame: CGRect(x: GLNTRKNA_ScaleW(90), y: gln_info_y + 30, width: 200, height: 20))
        gln_stat_lbl.text = "\(GLNTRKNA_DataManifest.GLNTRKNA_FeedbackVolume) comments"
        gln_stat_lbl.textColor = .lightGray
        gln_stat_lbl.font = .systemFont(ofSize: 14)
        GLNTRKNA_RootContainer.addSubview(gln_stat_lbl)
        
        GLNTRKNA_AssetIndicator.frame = CGRect(x: gln_sw - 60, y: gln_info_y + 10, width: 45, height: 25)
        GLNTRKNA_AssetIndicator.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        GLNTRKNA_AssetIndicator.layer.cornerRadius = 12.5
        GLNTRKNA_AssetIndicator.clipsToBounds = true
        GLNTRKNA_AssetIndicator.textColor = .white
        GLNTRKNA_AssetIndicator.font = .systemFont(ofSize: 12)
        GLNTRKNA_AssetIndicator.textAlignment = .center
        GLNTRKNA_AssetIndicator.text = "1/\(GLNTRKNA_DataManifest.GLNTRKNA_HeroAssets.count)"
        GLNTRKNA_RootContainer.addSubview(GLNTRKNA_AssetIndicator)
        
        // 4. Content Card
        let gln_card_y = gln_hero_h - 20
        let gln_prose_box = UIView(frame: CGRect(x: 0, y: gln_card_y, width: gln_sw, height: 1000))
        gln_prose_box.backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.15, alpha: 1.0)
        gln_prose_box.layer.cornerRadius = 25
        GLNTRKNA_RootContainer.addSubview(gln_prose_box)
        
        let gln_text_v = UITextView(frame: CGRect(x: 20, y: 30, width: gln_sw - 40, height: 80))
        gln_text_v.backgroundColor = .clear
        gln_text_v.textColor = .white
        gln_text_v.font = .systemFont(ofSize: 16)
        gln_text_v.isEditable = false
        gln_text_v.text = GLNTRKNA_DataManifest.GLNTRKNA_ProseContent
        gln_prose_box.addSubview(gln_text_v)
        
        let gln_divider = UILabel(frame: CGRect(x: 20, y: 120, width: 200, height: 30))
        gln_divider.text = "Reprint Nail Art"
        gln_divider.textColor = .white
        gln_divider.font = .boldSystemFont(ofSize: 18)
        gln_prose_box.addSubview(gln_divider)
        
        // 5. Dynamic Section (Empty vs List)
        if GLNTRKNA_DataManifest.GLNTRKNA_ReprintWorks.isEmpty {
            GLNTRKNA_BuildEmptyStage(in: gln_prose_box)
        } else {
            GLNTRKNA_BuildReprintScroll(in: gln_prose_box)
        }
        
        // 6. Interaction Bar
        GLNTRKNA_AttachBar()
    }
    
    private func GLNTRKNA_BuildEmptyStage(in gln_card: UIView) {
        let gln_planet = UIImageView(frame: CGRect(x: gln_card.frame.width/2 - 75, y: 200, width: 150, height: 100))
        gln_planet.image = UIImage(named: "GLNTRKNA_empty_planet")
        gln_planet.contentMode = .scaleAspectFit
        gln_card.addSubview(gln_planet)
        
        let gln_hint = UILabel(frame: CGRect(x: 0, y: 310, width: gln_card.frame.width, height: 50))
        gln_hint.text = "Haven't reproduced the nail art yet,\nnow go publish!"
        gln_hint.textColor = .lightGray
        gln_hint.numberOfLines = 2
        gln_hint.textAlignment = .center
        gln_hint.font = .systemFont(ofSize: 15, weight: .medium)
        gln_card.addSubview(gln_hint)
        
    }
    
    private func GLNTRKNA_BuildReprintScroll(in gln_card: UIView) {
        // GLNTRKNA: 核心横向滚动逻辑
        let gln_scroll_y = 160.0
        let gln_scroll = UIScrollView(frame: CGRect(x: 0, y: gln_scroll_y, width: gln_card.frame.width, height: GLNTRKNA_ScaleH(280)))
        gln_scroll.showsHorizontalScrollIndicator = false
        gln_scroll.alwaysBounceHorizontal = true
        
        let gln_item_w = GLNTRKNA_ScaleW(170)
        let gln_item_h = GLNTRKNA_ScaleH(260)
        
        for (idx, gln_work) in GLNTRKNA_DataManifest.GLNTRKNA_ReprintWorks.enumerated() {
            let gln_x = 20 + CGFloat(idx) * (gln_item_w + 12)
            let gln_container = UIView(frame: CGRect(x: gln_x, y: 0, width: gln_item_w, height: gln_item_h))
            
            let gln_img_v = UIImageView(frame: gln_container.bounds)
            gln_img_v.image = UIImage(named: gln_work)
            gln_img_v.contentMode = .scaleAspectFill
            gln_img_v.clipsToBounds = true
            gln_img_v.layer.cornerRadius = 18
            gln_img_v.backgroundColor = .darkGray
            gln_container.addSubview(gln_img_v)
            
            // 复刻图上的点赞按钮
            let gln_sub_like = UIButton(frame: CGRect(x: 10, y: 10, width: 32, height: 32))
            gln_sub_like.setImage(UIImage(systemName: "heart.circle.fill"), for: .normal)
            gln_sub_like.tintColor = .white.withAlphaComponent(0.8)
            gln_container.addSubview(gln_sub_like)
            
            // 虚假点赞数标签
            let gln_count = UILabel(frame: CGRect(x: 45, y: 10, width: 60, height: 32))
            gln_count.text = "12.4k"
            gln_count.textColor = .white
            gln_count.font = .systemFont(ofSize: 14, weight: .semibold)
            gln_container.addSubview(gln_count)
            
            gln_scroll.addSubview(gln_container)
        }
        
        let gln_total_w = CGFloat(GLNTRKNA_DataManifest.GLNTRKNA_ReprintWorks.count) * (gln_item_w + 12) + 40
        gln_scroll.contentSize = CGSize(width: gln_total_w, height: gln_item_h)
        gln_card.addSubview(gln_scroll)
        
    }
    
    private  var gln_field = UITextField()
    private func GLNTRKNA_AttachBar() {
        let gln_bar = UIView(frame: CGRect(x: 0, y: view.frame.height - 100, width: view.frame.width, height: 100))
        gln_bar.backgroundColor = UIColor(red: 0.02, green: 0.02, blue: 0.12, alpha: 1.0)
        view.addSubview(gln_bar)
        
        let gln_input_bg = UIView(frame: CGRect(x: 15, y: 10, width: view.frame.width - 175, height: 50))
        gln_input_bg.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
        gln_input_bg.layer.cornerRadius = 25
        gln_bar.addSubview(gln_input_bg)
        
        let gln_field = UITextField(frame: gln_input_bg.bounds.insetBy(dx: 20, dy: 0))
        gln_field.placeholder = "Add Comment..."
        gln_field.textColor = .white
        self.gln_field = gln_field
        gln_input_bg.addSubview(gln_field)
        
        let gln_send = UIButton(frame: CGRect(x: view.frame.width - 120 - 35, y: 6, width: 50, height: 50))
      
        gln_send.setImage(UIImage(named: "glnpaperplane.fill"), for: .normal)
       
        gln_send.addTarget(self, action: #selector(GLNTRKNA_CommitFeedback), for: .touchUpInside)
        gln_bar.addSubview(gln_send)
        
        
        let gln_comment = UIButton(frame: CGRect(x:view.frame.width - 36 - 15 - 10 - 36, y: 10, width: 36, height: 36))
        gln_comment.setImage(UIImage(named: "glnpapercomement"), for: .normal)
       
        gln_comment.addTarget(self, action: #selector(GLNTRKNA_TriggerComment), for: .touchUpInside)
        gln_bar.addSubview(gln_comment)
        
        
        let gln_cam = UIButton(frame: CGRect(x: view.frame.width - 36 - 15, y: 10, width: 36, height: 36))
        gln_cam.setImage(UIImage(named: "glnpaperaddpic"), for: .normal)
        
        gln_cam.addTarget(self, action: #selector(GLNTRKNA_TriggerRecreation), for: .touchUpInside)
        gln_bar.addSubview(gln_cam)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == GLNTRKNA_AssetSlider {
            let gln_page = Int(scrollView.contentOffset.x / scrollView.frame.width) + 1
            GLNTRKNA_AssetIndicator.text = "\(gln_page)/\(GLNTRKNA_DataManifest.GLNTRKNA_HeroAssets.count)"
        }
    }
    
    @objc private func GLNTRKNA_ExitPortal() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func GLNTRKNA_CommitFeedback() {
        // 1. GLNTRKNA: 获取输入内容并收起键盘
        guard let gln_prose = gln_field.text, !gln_prose.isEmpty else {
            GLNTRKNA_ToastVisuals(gln_msg: "Please enter your thoughts...")
            return
        }
        view.endEditing(true)
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { [weak self] in
            guard let self = self else { return }
            
          
            let gln_generator = UINotificationFeedbackGenerator()
            gln_generator.notificationOccurred(.success)
            
            // 5. GLNTRKNA: 清空输入并提示成功
            self.gln_field.text = ""
            self.GLNTRKNA_ToastVisuals(gln_msg: "Comment published successfully!")
            
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
    
    @objc private func GLNTRKNA_TriggerRecreation() {
        let commentpicvc = GLNTRKNA_CreativeStudioController(gln_mode: .gln_nail_recreate)
        self.navigationController?.pushViewController(commentpicvc, animated: true)
    }
    
    @objc private func GLNTRKNA_TriggerComment() {
        
        let commentvc = GLNTRKNA_FeedbackStationController()
        self.present(commentvc, animated: true)
        
       
    }
}
