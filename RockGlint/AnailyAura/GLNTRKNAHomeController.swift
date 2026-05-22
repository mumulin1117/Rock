//
//  GLNTRKNAHomeController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/27.
//

import UIKit

class GLNTRKNA_MainDiscoveryHub: GLNTRKNA_BasicController {
    private let logicEngine = GLNTRKNA_HomeLogicEngine()
        
    private var GLNTRKNAtopUsers: [GLNTRKNA_MomentEntry] = []
    private var GLNTRKNAfeedItems: [GLNTRKNA_MomentEntry] = []
    private var GLNTRKNA_ActiveCategoryIndex: Int = 0
    
    private let GLNTRKNA_MasterScroller = UIScrollView()
    private let GLNTRKNA_RefreshPulse = UIRefreshControl()
    
    private let GLNTRKNA_HeaderPanel = UIView()
    private let GLNTRKNA_AiCanvasTrigger = UIButton()
    private let GLNTRKNA_ArtisanHorizonStrip = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let GLNTRKNA_CategoryBridge = UIView()
    private let GLNTRKNA_FeedMatrix = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    private let GLNTRKNA_CategoryTags = [GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"f8VktUgK/kbytnBvlyOXpRswV7XexLtR4lJwBxIW8Jzxg/w="), GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"4bjPHpA7KzWNon/f4kJATCMS/KNkCTUUCYT0V06dvJ/00CnP6UHf"), GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"RL+MLmj/VG7xSTn9zTDypvE39rIlGKflsAGth+uxcmrKu8s="), GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"9cZqKqUkR25O6tUbPAJDhgRAO9XQuZ6yybQp0hKnLrktUSVMO5jFkw==")]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_ConstructBaseCanvas()
        GLNTRKNA_AssembleModules()
    
        GLNTRKNA_HandleBlacklistUpdate()
        GLNTRKNA_MasterScroller.contentInsetAdjustmentBehavior = .never
        GLNTRKNA_SetupObservers()
    }
    private func GLNTRKNA_SetupObservers() {
            
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(GLNTRKNA_HandleBlacklistUpdate),
                name: .GLNTRKNA_ObsidianListChanged,
                object: nil
            )
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(GLNTRKNA_RefreshAllianceDust),
                name: .GLNTRKNA_AdoredListChanged,
                object: nil
            )
       
    }
    
    @objc private func GLNTRKNA_RefreshAllianceDust() {
        GLNTRKNAfeedItems = logicEngine.GLNTRKNA_FilterFeed(by: GLNTRKNA_ActiveCategoryIndex)
        GLNTRKNA_ArtisanHorizonStrip.reloadData()
        GLNTRKNA_FeedMatrix.reloadData()
    }
    
    @objc private func GLNTRKNA_HandleBlacklistUpdate() {
       
        self.GLNTRKNAtopUsers = logicEngine.GLNTRKNA_FetchRandomArtisans()
        
       
        self.GLNTRKNAfeedItems = logicEngine.GLNTRKNA_FilterFeed(by: GLNTRKNA_ActiveCategoryIndex)
        
        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_ProjectLoading(with: "Loading...", on: self.view)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
            self.GLNTRKNA_RefreshPulse.endRefreshing()
            self.GLNTRKNA_ArtisanHorizonStrip.reloadData()
            self.GLNTRKNA_FeedMatrix.reloadData()
            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_DissolveLoading()
        }))
    }
        
       
    deinit {
       
        NotificationCenter.default.removeObserver(self)
    }
    
    private func GLNTRKNA_ConstructBaseCanvas() {
        view.backgroundColor = UIColor(red: 0.02, green: 0.02, blue: 0.1, alpha: 1.0)
        
        GLNTRKNA_MasterScroller.frame = view.bounds
        GLNTRKNA_MasterScroller.showsVerticalScrollIndicator = false
        GLNTRKNA_MasterScroller.alwaysBounceVertical = true
        view.addSubview(GLNTRKNA_MasterScroller)
        
        GLNTRKNA_RefreshPulse.tintColor = .systemPink
        GLNTRKNA_RefreshPulse.addTarget(self, action: #selector(GLNTRKNA_HandleBlacklistUpdate), for: .valueChanged)
        GLNTRKNA_MasterScroller.refreshControl = GLNTRKNA_RefreshPulse
    }
    
    private func GLNTRKNA_AssembleModules() {
        let gln_sw = view.frame.width
        let gln_gap = polishCanvasW(20)
        
        let gln_title = UILabel(frame: CGRect(x: gln_gap, y: polishCanvasH(50), width: 200, height: 40))
        gln_title.text = "Hi ~ Rock"
        gln_title.textColor = .white
        gln_title.font = .systemFont(ofSize: polishCanvasW(28), weight: .bold)
        GLNTRKNA_MasterScroller.addSubview(gln_title)
        
        let gln_plus = UIButton(frame: CGRect(x: gln_sw - polishCanvasW(60), y: polishCanvasH(50), width: polishCanvasW(40), height: polishCanvasW(40)))
        gln_plus.setImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_plus"), for: .normal)
        gln_plus.addTarget(self, action: #selector(GLNTRKNA_RenderPostNodes), for: .touchUpInside)
        GLNTRKNA_MasterScroller.addSubview(gln_plus)
        
        GLNTRKNA_AiCanvasTrigger.frame = CGRect(x: gln_gap, y: polishCanvasH(110), width: gln_sw - (gln_gap * 2), height: polishCanvasH(130))
        GLNTRKNA_AiCanvasTrigger.setBackgroundImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_AI_Entry_Banner"), for: .normal)
        GLNTRKNA_AiCanvasTrigger.imageView?.contentMode = .scaleAspectFill
        GLNTRKNA_AiCanvasTrigger.layer.cornerRadius = 16
        GLNTRKNA_AiCanvasTrigger.clipsToBounds = true
        GLNTRKNA_AiCanvasTrigger.addTarget(self, action: #selector(GLNTRKNA_JumpToAiStudio), for: .touchUpInside)
        GLNTRKNA_MasterScroller.addSubview(GLNTRKNA_AiCanvasTrigger)
        
        let gln_layout_h = UICollectionViewFlowLayout()
        gln_layout_h.scrollDirection = .horizontal
        gln_layout_h.itemSize = CGSize(width: polishCanvasW(100), height: polishCanvasH(130))
        gln_layout_h.minimumInteritemSpacing = 10
        
        GLNTRKNA_ArtisanHorizonStrip.frame = CGRect(x: 0, y: polishCanvasH(260), width: gln_sw, height: polishCanvasH(150))
        GLNTRKNA_ArtisanHorizonStrip.backgroundColor = .clear
        GLNTRKNA_ArtisanHorizonStrip.collectionViewLayout = gln_layout_h
        GLNTRKNA_ArtisanHorizonStrip.delegate = self
        GLNTRKNA_ArtisanHorizonStrip.dataSource = self
        GLNTRKNA_ArtisanHorizonStrip.showsHorizontalScrollIndicator = false
        GLNTRKNA_ArtisanHorizonStrip.register(GLNTRKNA_ArtisanCell.self, forCellWithReuseIdentifier: "Artisan")
        GLNTRKNA_MasterScroller.addSubview(GLNTRKNA_ArtisanHorizonStrip)
        
        GLNTRKNA_CategoryBridge.frame = CGRect(x: 0, y: polishCanvasH(420), width: gln_sw, height: polishCanvasH(40))
         
        GLNTRKNA_MasterScroller.addSubview(GLNTRKNA_CategoryBridge)
        GLNTRKNA_RenderCategoryNodes()
        
        backGroundImagPickin.frame = CGRect(x: 0, y: 0, width: 30, height: 22)
        let gln_w = view.frame.width / CGFloat(GLNTRKNA_CategoryTags.count)
        backGroundImagPickin.center.x = gln_w/2
        
      
        GLNTRKNA_CategoryBridge.addSubview(backGroundImagPickin)
        let gln_layout_v = UICollectionViewFlowLayout()
        gln_layout_v.itemSize = CGSize(width: (gln_sw - (gln_gap * 3)) / 2, height: polishCanvasH(240))
        gln_layout_v.minimumLineSpacing = gln_gap
        gln_layout_v.sectionInset = UIEdgeInsets(top: 0, left: gln_gap, bottom: 20, right: gln_gap)
        
        GLNTRKNA_FeedMatrix.frame = CGRect(x: 0, y: polishCanvasH(470), width: gln_sw, height: polishCanvasH(600))
        GLNTRKNA_FeedMatrix.backgroundColor = .clear
        GLNTRKNA_FeedMatrix.collectionViewLayout = gln_layout_v
        GLNTRKNA_FeedMatrix.delegate = self
        GLNTRKNA_FeedMatrix.dataSource = self
        GLNTRKNA_FeedMatrix.isScrollEnabled = true
        GLNTRKNA_FeedMatrix.register(GLNTRKNA_VibeMatrixCell.self, forCellWithReuseIdentifier: "Matrix")
        GLNTRKNA_MasterScroller.addSubview(GLNTRKNA_FeedMatrix)
        
        GLNTRKNA_MasterScroller.contentSize = CGSize(width: gln_sw, height: polishCanvasH(1100))
    }
    private let backGroundImagPickin:UIImageView = UIImageView.init(image: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_ringball"))
    
    @objc private func GLNTRKNA_RenderPostNodes() {
        self.navigationController?.pushViewController(GLNTRKNA_CreativeStudioController.init(gln_mode: .gln_artisan_image), animated: true)
    }
    private func GLNTRKNA_RenderCategoryNodes() {
        GLNTRKNA_CategoryBridge.subviews.forEach {
            if $0.isMember(of: UIButton.self) {
                $0.removeFromSuperview()
            }
              }
        let gln_w = view.frame.width / CGFloat(GLNTRKNA_CategoryTags.count)
        
        for (index, title) in GLNTRKNA_CategoryTags.enumerated() {
            let gln_btn = UIButton(frame: CGRect(x: CGFloat(index) * gln_w, y: 0, width: gln_w, height: 22))
            
            gln_btn.setTitle(title, for: .normal)
            gln_btn.setTitleColor(index == GLNTRKNA_ActiveCategoryIndex ? .white : .gray, for: .normal)
        

            gln_btn.titleLabel?.font = .systemFont(ofSize: 16, weight: index == GLNTRKNA_ActiveCategoryIndex ? .bold : .regular)
            gln_btn.tag = index
            gln_btn.addTarget(self, action: #selector(GLNTRKNA_SwitchCategory(_:)), for: .touchUpInside)
            if index == GLNTRKNA_ActiveCategoryIndex {
                backGroundImagPickin.center = gln_btn.center
            }
            
            GLNTRKNA_CategoryBridge.addSubview(gln_btn)
        }
    }
  
    @objc private func GLNTRKNA_SwitchCategory(_ sender: UIButton) {
        GLNTRKNA_ActiveCategoryIndex = sender.tag
        GLNTRKNA_RenderCategoryNodes()
        GLNTRKNA_HandleBlacklistUpdate()
    }
    
    @objc private func GLNTRKNA_JumpToAiStudio() {
        let gln_ai_vc = GLNTRKNA_AiManifestoController()
     
        self.navigationController?.pushViewController(gln_ai_vc, animated: true)
    }
}

extension GLNTRKNA_MainDiscoveryHub: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == GLNTRKNA_ArtisanHorizonStrip ? GLNTRKNAtopUsers.count : GLNTRKNAfeedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == GLNTRKNA_ArtisanHorizonStrip {
            let ArtisanCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Artisan", for: indexPath) as! GLNTRKNA_ArtisanCell
            let ArtisanCelldata = GLNTRKNAtopUsers[indexPath.row]
            ArtisanCell.gln_avatar.image = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: ArtisanCelldata.glnt_userId)
            ArtisanCell.gln_name.text = ArtisanCelldata.glnt_userName
            ArtisanCell.gln_action.tag = indexPath.row
            ArtisanCell.gln_action.isSelected = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_IsAdoring(targetEmail: ArtisanCelldata.glnt_userId)
            ArtisanCell.gln_action.addTarget(self, action: #selector(GLNTRKNAToggleHorizonAlliance(Ubuaton:)), for: .touchUpInside)
            ArtisanCell.gln_vidus.tag = indexPath.row
            ArtisanCell.gln_vidus.addTarget(self, action: #selector(GLNTRKNAEnterHorizonChat(Ubuaton:)), for: .touchUpInside)
            return ArtisanCell
        } else {
            let VibeMatrixCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Matrix", for: indexPath) as! GLNTRKNA_VibeMatrixCell
            let VibeMatrixCelldata = GLNTRKNAfeedItems[indexPath.row]
            VibeMatrixCell.gln_cover.image = GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: VibeMatrixCelldata.momentPics.first ?? "")
            VibeMatrixCell.gln_uname.text =  VibeMatrixCelldata.glnt_content
            VibeMatrixCell.gln_meta.text = "\(VibeMatrixCelldata.glnt_comments.count) comments"
            
            VibeMatrixCell.gln_report.addTarget(self, action: #selector(gln_reportTraiiler), for: .touchUpInside)
            return VibeMatrixCell
        }
    }
    @objc private func GLNTRKNAToggleHorizonAlliance(Ubuaton:UIButton) {
        guard GLNTRKNAtopUsers.indices.contains(Ubuaton.tag) else { return }
        let ArtisanCelldata = GLNTRKNAtopUsers[Ubuaton.tag]
        GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_ToggleAdoration(targetEmail: ArtisanCelldata.glnt_userId)
        Ubuaton.isSelected = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_IsAdoring(targetEmail: ArtisanCelldata.glnt_userId)
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    @objc private func GLNTRKNAEnterHorizonChat(Ubuaton:UIButton) {
        guard GLNTRKNAtopUsers.indices.contains(Ubuaton.tag) else { return }
        let ArtisanCelldata = GLNTRKNAtopUsers[Ubuaton.tag]
        GLNTRKNA_MutualGlintGate.GLNTRKNA_RequestPassage(from: self, toward: ArtisanCelldata, intent: .GLNTRKNA_PrivateChat) { [weak self] in
            self?.GLNTRKNAPushHorizonChat(GLNTRKNACelestialData: ArtisanCelldata)
        }
    }
    
    private func GLNTRKNAPushHorizonChat(GLNTRKNACelestialData: GLNTRKNA_MomentEntry) {
        if let gln_index = GLNTRKNA_CentralAuthority.GLNTRKNA_MesageData.firstIndex(where: {
            $0.userModel.glnt_userId == GLNTRKNACelestialData.glnt_userId
        }) {
            let yac_chat_vc = GLNTRKNA_SoloDialogueController(GLNTRKNA_ContextCarrier: GLNTRKNA_CentralAuthority.GLNTRKNA_MesageData[gln_index])
            self.navigationController?.pushViewController(yac_chat_vc, animated: true)
            return
        }
        
        let yac_chat_vc = GLNTRKNA_SoloDialogueController(GLNTRKNA_ContextCarrier: GLNTRKNA_ConvergeModel(userModel: GLNTRKNACelestialData, convert: []))
        self.navigationController?.pushViewController(yac_chat_vc, animated: true)
    }
   @objc func gln_reportTraiiler()  {
       let safetyvc =  GLNTRKNA_SafetyHubController.init(GLNTRKNA_ActiveMode: .GLNTRKNA_ReasonCategorization)
       self.present(safetyvc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == GLNTRKNA_ArtisanHorizonStrip {
            let ArtisanCelldata = GLNTRKNAtopUsers[indexPath.row]
            self.navigationController?.pushViewController(GLNTRKNA_GuestOrbitController.init(GLNTRKNACelestialData: ArtisanCelldata), animated: true)
            return
        }
        let VibeMatrixCelldata = GLNTRKNAfeedItems[indexPath.row]
        let momentController = GLNTRKNA_DymDetailController.init(gln_data: VibeMatrixCelldata)
        
        self.navigationController?.pushViewController(momentController, animated: true)
    }
}

class GLNTRKNA_ArtisanCell: UICollectionViewCell {
    let gln_avatar = UIImageView()
    var gln_name = UILabel()
    let gln_action = UIButton()
    let gln_vidus = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
        contentView.layer.cornerRadius = 12
        
        gln_avatar.frame = CGRect(x: 20, y: 10, width: 50, height: 50)
        gln_avatar.layer.cornerRadius = 25
        gln_avatar.backgroundColor = .gray
        gln_avatar.clipsToBounds = true
        contentView.addSubview(gln_avatar)
        
        gln_name.frame = CGRect(x: 5, y: 65, width: 80, height: 20)
       
        gln_name.textAlignment = .center
        gln_name.font = .systemFont(ofSize: 12)
        gln_name.textColor = .white
        contentView.addSubview(gln_name)
        
        gln_action.frame = CGRect(x: 10, y: 90, width: 61, height: 24)
        gln_action.setImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_actioning"), for: .normal)
        gln_action.setImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_action_ed"), for: .selected)
        gln_action.isUserInteractionEnabled = true
        gln_vidus.frame = CGRect(x:77, y: 90, width: 24, height: 24)
        let gln_message_icon = UIImage(named: unsealPolishText("aOC2AlF7Qq4ySzBwL2AGQ2+/K/NbtEzPTB1UV4EDv/hR9f93u7yDJBOuCqeZ6VRxe5hk2A==")) ?? GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: unsealPolishText("H8azEY2Ya5SkYjDCD6ND4re2LdtPc9XXw5gKOSA0urIFcm+2ogC3H33LxDv5+Zkq"))
        gln_vidus.setImage(gln_message_icon?.withRenderingMode(.alwaysTemplate), for: .normal)
        gln_vidus.tintColor = UIColor(red: 0.42, green: 0.96, blue: 1, alpha: 1)
        gln_vidus.imageView?.contentMode = .scaleAspectFit
        
        contentView.addSubview(gln_action)
        contentView.addSubview(gln_vidus)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        gln_action.removeTarget(nil, action: nil, for: .touchUpInside)
        gln_vidus.removeTarget(nil, action: nil, for: .touchUpInside)
        gln_action.isSelected = false
        gln_avatar.image = nil
        gln_name.text = nil
    }
    
    required init?(coder: NSCoder) { fatalError() }
}

class GLNTRKNA_VibeMatrixCell: UICollectionViewCell {
    let gln_cover = UIImageView()
    let gln_uname = UILabel()
    let gln_meta = UILabel()
    let gln_report = UIButton()
    let gln_heart = UIImageView.init(image: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_heart"))
    override init(frame: CGRect) {
        super.init(frame: frame)
        gln_cover.frame = self.bounds
        gln_cover.backgroundColor = .darkGray
        gln_cover.layer.cornerRadius = 12
        gln_cover.clipsToBounds = true
        contentView.addSubview(gln_cover)
        
        gln_uname.textColor = .white
        gln_uname.font = UIFont(name: "Alimama FangYuanTi VF-Bold", size: 16)
        gln_uname.frame = CGRect(x: 10, y: frame.height - 30 - 30, width: 76, height: 20)
        
        contentView.addSubview(gln_uname)
        gln_meta.frame = CGRect(x: 10, y: frame.height - 30, width: frame.width - 60, height: 20)
        
        gln_meta.textColor = .white
        gln_meta.font = .systemFont(ofSize: 14, weight: .medium)
        contentView.addSubview(gln_meta)
        
        
        
        gln_report.frame = CGRect(x: frame.width - 15 - 24, y: 12, width: 24, height: 15)
        gln_report.setImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_report"), for: .normal)
        contentView.addSubview(gln_report)
        
        gln_heart.frame = CGRect(x: frame.width - 10 - 40, y: frame.height - 30 - 40, width: 40, height: 40)

        contentView.addSubview(gln_heart)
        
        
    }
    required init?(coder: NSCoder) { fatalError() }
}
