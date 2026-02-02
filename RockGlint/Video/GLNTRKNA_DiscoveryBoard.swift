//
//  GLNTRKNA_DiscoveryBoard.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/27.
//

import UIKit

class GLNTRKNA_DiscoveryBoardController: GLNTRKNA_BasicController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private let GLNTRKNA_BaseWidth: CGFloat = 393.0
    private let GLNTRKNA_BaseHeight: CGFloat = 852.0
    
   
    private let GLNTRKNA_HeaderTags = ["Hot", "For you", "New", "Followed"]
    private var GLNTRKNA_SelectedIndex = 400
    private let backGroundImagPickin:UIImageView = UIImageView.init(image: UIImage.init(named: "gln_ringball"))
   
    private lazy var GLNTRKNA_MainGallery: UICollectionView = {
        let gln_layout = UICollectionViewFlowLayout()
        gln_layout.scrollDirection = .vertical
        gln_layout.minimumLineSpacing = GLNTRKNA_RatioH(20)
        let gln_cv = UICollectionView(frame: .zero, collectionViewLayout: gln_layout)
        gln_cv.backgroundColor = .clear
        gln_cv.delegate = self
        gln_cv.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 80, right: 0)
        gln_cv.dataSource = self
        gln_cv.register(GLNTRKNA_VideoVesselCell.self, forCellWithReuseIdentifier: "GLNTRKNA_VideoVesselCell")
        return gln_cv
    }()
    
    private let GLNTRKNA_NavPlate = UIView()
 
  
    private var GLNTRKNAfeedItems: [GLNTRKNA_MomentEntry] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_InitializeCanvas()
      
        GLNTRKNA_HandleBlacklistUpdate()
        GLNTRKNA_SetupObservers()
    }
    private func GLNTRKNA_SetupObservers() {
            // 注册黑名单变更监听
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(GLNTRKNA_HandleBlacklistUpdate),
                name: .GLNTRKNA_ObsidianListChanged,
                object: nil
            )
       
    }
    @objc private func GLNTRKNA_HandleBlacklistUpdate() {
     
        let logicEngine = GLNTRKNA_HomeLogicEngine()
        self.GLNTRKNAfeedItems = logicEngine.GLNTRKNA_FilterVadio(by: GLNTRKNA_SelectedIndex - 400)
        
        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_ProjectLoading(with: "Loading....", on: self.view)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
            self.GLNTRKNA_MainGallery.reloadData()
            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_DissolveLoading()
        }))
        
    }
        
       
    deinit {
       
        NotificationCenter.default.removeObserver(self)
    }
    
    
    private func GLNTRKNA_InitializeCanvas() {
        view.backgroundColor = UIColor(red: 0.04, green: 0.04, blue: 0.16, alpha: 1.0)
        
        let gln_title = UILabel(frame: CGRect(x: GLNTRKNA_RatioW(20), y: GLNTRKNA_RatioH(60), width: GLNTRKNA_RatioW(200), height: GLNTRKNA_RatioH(40)))
        gln_title.text = "Video"
        gln_title.textColor = .white
        gln_title.font = .systemFont(ofSize: 32, weight: .bold)
        view.addSubview(gln_title)
        
        let gln_add = UIButton(frame: CGRect(x: GLNTRKNA_RatioW(333), y: GLNTRKNA_RatioH(60), width: GLNTRKNA_RatioW(40), height: GLNTRKNA_RatioW(40)))
        gln_add.setImage(UIImage(named: "gln_plus"), for: .normal)
        gln_add.addTarget(self, action: #selector(GLNTRKNA_RenderPostNodes), for: .touchUpInside)
        view.addSubview(gln_add)
        
        backGroundImagPickin.frame.size = CGSize(width: 30, height: 22)
        view.addSubview(backGroundImagPickin)
       
        GLNTRKNA_ConstructSegmentedInterface()
        
        GLNTRKNA_MainGallery.frame = CGRect(x: 0, y: GLNTRKNA_RatioH(127 + 40 + 20) , width: view.bounds.width, height: view.bounds.height - GLNTRKNA_RatioH(187))
        view.addSubview(GLNTRKNA_MainGallery)
     
    }
    @objc private func GLNTRKNA_RenderPostNodes() {
        self.navigationController?.pushViewController(GLNTRKNA_CreativeStudioController.init(gln_mode: .gln_artisan_video), animated: true)
    }

    private func GLNTRKNA_ConstructSegmentedInterface() {

        var gln_offset_x: CGFloat = GLNTRKNA_RatioW(20)
        
        for (index, title) in GLNTRKNA_HeaderTags.enumerated() {
            let gln_btn = UIButton()
            let gln_font = index == GLNTRKNA_SelectedIndex ? UIFont.boldSystemFont(ofSize: 18) : UIFont.systemFont(ofSize: 18)
            let gln_tw = title.size(withAttributes: [.font: gln_font]).width + 30
            
            gln_btn.frame = CGRect(x: gln_offset_x, y: GLNTRKNA_RatioH(127) , width: gln_tw, height: GLNTRKNA_RatioH(40))
            gln_btn.setTitle(title, for: .normal)
            gln_btn.setTitleColor(.white, for: .normal)
            gln_btn.titleLabel?.font = gln_font
            gln_btn.tag = index + 400
            gln_btn.addTarget(self, action: #selector(GLNTRKNA_SwitchCategory(_:)), for: .touchUpInside)
            
            if index == 0 {
             
                backGroundImagPickin.center = gln_btn.center
                
              
            }
           
            view.addSubview(gln_btn)
            gln_offset_x += gln_tw + 10
        }
      
    }
    
    @objc private func GLNTRKNA_SwitchCategory(_ sender: UIButton) {
        if GLNTRKNA_SelectedIndex == sender.tag { return }
        GLNTRKNA_SelectedIndex = sender.tag
//        GLNTRKNA_ConstructSegmentedInterface()
        GLNTRKNA_HandleBlacklistUpdate()
        backGroundImagPickin.center = sender.center
        let gln_impact = UISelectionFeedbackGenerator()
        gln_impact.selectionChanged()
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GLNTRKNAfeedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let gln_cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GLNTRKNA_VideoVesselCell", for: indexPath) as! GLNTRKNA_VideoVesselCell
        gln_cell.GLNTRKNA_ConfigureProtocol(gln_data: GLNTRKNAfeedItems[indexPath.item])
        gln_cell.GLNTRKNA_ReportBox.addTarget(self, action: #selector(gln_reportTraiiler), for: .touchUpInside)
        return gln_cell
    }
    @objc func gln_reportTraiiler()  {
        let safetyvc =  GLNTRKNA_SafetyHubController.init(GLNTRKNA_ActiveMode: .GLNTRKNA_ReasonCategorization)
        self.present(safetyvc, animated: true)
     }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - GLNTRKNA_RatioW(40), height: GLNTRKNA_RatioH(500))
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vcLNTRKNA = GLNTRKNA_VideoSpectacleController.init(gln_data: GLNTRKNAfeedItems[indexPath.row])
        self.navigationController?.pushViewController(vcLNTRKNA, animated: true)
        
    }
    
  
    private func GLNTRKNA_RatioW(_ val: CGFloat) -> CGFloat { return (UIScreen.main.bounds.width / GLNTRKNA_BaseWidth) * val }
    private func GLNTRKNA_RatioH(_ val: CGFloat) -> CGFloat { return (UIScreen.main.bounds.height / GLNTRKNA_BaseHeight) * val }
}

class GLNTRKNA_VideoVesselCell: UICollectionViewCell {
    
    private let GLNTRKNA_CoverArt = UIImageView()
    private let GLNTRKNA_Avatar = UIImageView()
    private let GLNTRKNA_BriefLabel = UILabel()
    private let GLNTRKNA_PlayIndicator = UIImageView()
    private let GLNTRKNA_LikeBox = UIButton()
    private let GLNTRKNA_CommentBox = UIButton()
     let GLNTRKNA_ReportBox = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        GLNTRKNA_BuildVesselUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func GLNTRKNA_BuildVesselUI() {
        contentView.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
        contentView.layer.cornerRadius = 24
        contentView.clipsToBounds = true
        
        GLNTRKNA_CoverArt.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height - 80)
        GLNTRKNA_CoverArt.layer.masksToBounds = true
        GLNTRKNA_CoverArt.contentMode = .scaleAspectFill
        GLNTRKNA_CoverArt.backgroundColor = .darkGray
        contentView.addSubview(GLNTRKNA_CoverArt)
        GLNTRKNA_CommentBox.isUserInteractionEnabled = false
        let gln_grad = CAGradientLayer()
        gln_grad.frame = GLNTRKNA_CoverArt.bounds
        gln_grad.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.6).cgColor]
        GLNTRKNA_CoverArt.layer.addSublayer(gln_grad)
        
        GLNTRKNA_PlayIndicator.frame = CGRect(x: contentView.bounds.width - 60, y: 20, width: 40, height: 40)
        GLNTRKNA_PlayIndicator.image = UIImage(systemName: "play.circle.fill")
        GLNTRKNA_PlayIndicator.tintColor = .white.withAlphaComponent(0.8)
        contentView.addSubview(GLNTRKNA_PlayIndicator)
        
        GLNTRKNA_Avatar.frame = CGRect(x: 15, y: GLNTRKNA_CoverArt.frame.height - 65, width: 50, height: 50)
        GLNTRKNA_Avatar.layer.cornerRadius = 25
        GLNTRKNA_Avatar.layer.borderWidth = 2
        GLNTRKNA_Avatar.layer.borderColor = UIColor.systemPink.cgColor
        GLNTRKNA_Avatar.clipsToBounds = true
        GLNTRKNA_Avatar.backgroundColor = .gray
        contentView.addSubview(GLNTRKNA_Avatar)
        
        GLNTRKNA_BriefLabel.frame = CGRect(x: 75, y: GLNTRKNA_CoverArt.frame.height - 65, width: contentView.bounds.width - 90, height: 50)
        GLNTRKNA_BriefLabel.textColor = .white
        GLNTRKNA_BriefLabel.numberOfLines = 2
        GLNTRKNA_BriefLabel.font = .systemFont(ofSize: 14)
        contentView.addSubview(GLNTRKNA_BriefLabel)
        
        let gln_btn_y = contentView.bounds.height - 65
        GLNTRKNA_LikeBox.frame = CGRect(x: 15, y: gln_btn_y, width: 100, height: 45)
        GLNTRKNA_CommentBox.frame = CGRect(x: 125, y: gln_btn_y, width: 100, height: 45)
        GLNTRKNA_ReportBox.frame = CGRect(x: contentView.bounds.width - 64 - 12, y: gln_btn_y, width: 64, height: 40)
        GLNTRKNA_LikeBox.isUserInteractionEnabled = false
        [GLNTRKNA_LikeBox, GLNTRKNA_CommentBox, GLNTRKNA_ReportBox].forEach {
            $0.backgroundColor = UIColor(red: 0.03, green: 0.04, blue: 0.16, alpha: 1)
            $0.layer.cornerRadius = 12
            $0.tintColor = .white
            contentView.addSubview($0)
        }
        
        GLNTRKNA_LikeBox.setImage(UIImage(systemName: "heart"), for: .normal)
        GLNTRKNA_CommentBox.setImage(UIImage(systemName: "message"), for: .normal)
        GLNTRKNA_ReportBox.setImage(UIImage(named: "reporeintgg"), for: .normal)
    }
    
    func GLNTRKNA_ConfigureProtocol(gln_data: GLNTRKNA_MomentEntry) {
        GLNTRKNA_BriefLabel.text = gln_data.glnt_content
        GLNTRKNA_LikeBox.setTitle(" 0", for: .normal)
        GLNTRKNA_CommentBox.setTitle(" \(gln_data.glnt_comments.count)", for: .normal)
        GLNTRKNA_ConfigureVideoCell(with: gln_data.SPPuuuRRll)
        
        GLNTRKNA_Avatar.image = UIImage(named: gln_data.glnt_userId)
        
    }
    
    // 在你的 Cell 子类中
    func GLNTRKNA_ConfigureVideoCell(with glnt_videoName: String) {
        // 1. 构造本地路径
        guard let glnt_path = Bundle.main.path(forResource: glnt_videoName, ofType: "mp4") else { return }
        let glnt_url = URL(fileURLWithPath: glnt_path)
        
        // 2. 检查是否有内存缓存（可选逻辑）
        // if let cached = MyCache.get(glnt_videoName) { self.imgView.image = cached; return }

        // 3. 提取截图
        GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_CaptureFrame(from: glnt_url) { [weak self] glnt_image in
            self?.GLNTRKNA_CoverArt.image = glnt_image
        }
    }
}


