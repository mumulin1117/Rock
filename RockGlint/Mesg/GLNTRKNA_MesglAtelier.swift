//
//  GLNTRKNA_MesglAtelier.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/27.
//

import UIKit

class GLNTRKNA_ChatNexusController: GLNTRKNA_BasicController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var GLNTRKNAtopUsers: [GLNTRKNA_MomentEntry] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  GLNTRKNAtopUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ArtisanCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Artisan", for: indexPath) as! GLNTRKNA_ArtisanCell
        let ArtisanCelldata = GLNTRKNAtopUsers[indexPath.row]
        ArtisanCell.gln_avatar.image = UIImage(named: ArtisanCelldata.glnt_userId)
        ArtisanCell.gln_name.text = ArtisanCelldata.glnt_userName
        ArtisanCell.gln_vidus.tag = indexPath.row
        ArtisanCell.gln_vidus.addTarget(self, action: #selector(GLNTRKNAEstablishVisualLink(Ubuaton:)), for: .touchUpInside)
        return ArtisanCell
        
    }
    @objc private func GLNTRKNAEstablishVisualLink(Ubuaton:UIButton) {
        let ArtisanCelldata = GLNTRKNAtopUsers[Ubuaton.tag]
        let yac_face_vc = GLNTRKNA_FaceMirrorController.init(GLNTRKNACelestialData: ArtisanCelldata)
       
        yac_face_vc.modalPresentationStyle = .fullScreen
        self.present(yac_face_vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ArtisanCelldata = GLNTRKNAtopUsers[indexPath.row]
        self.navigationController?.pushViewController(GLNTRKNA_GuestOrbitController.init(GLNTRKNACelestialData: ArtisanCelldata), animated: true)
        
    }

    private lazy var gln_planet: UIImageView = {
        let gln_planet = UIImageView(frame: CGRect(x: 0, y: GLNTRKNA_RatioH(370), width: 168, height: 134))
               
        gln_planet.isHidden = true
        gln_planet.image = UIImage(named: "rokyholder")
        gln_planet.contentMode = .scaleAspectFit
        return gln_planet
    }()
    private let GLNTRKNA_ScrW = UIScreen.main.bounds.width
    private let GLNTRKNA_ScrH = UIScreen.main.bounds.height
    
    private let GLNTRKNA_BaseTable = UITableView()
//    private let GLNTRKNA_SpotlightScroll = UIScrollView()
  
    private let GLNTRKNA_Refresher = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_SetupAesthetics()
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
        // 当用户被拉黑时，执行静默刷新
        // 1. 重新随机顶部用户（确保被拉黑的用户消失）
       let logicEngine = GLNTRKNA_HomeLogicEngine()
        self.GLNTRKNAtopUsers = logicEngine.GLNTRKNA_FetchRandomArtisans()
      

        
        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_ProjectLoading(with: "Loading....", on: self.view)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
            self.GLNTRKNA_BaseTable.reloadData()
            self.GLNTRKNA_ArtisanHorizonStrip.reloadData()
            GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_DissolveLoading()
        }))
        
        
    }
        
       
    deinit {
       
        NotificationCenter.default.removeObserver(self)
    }
 
    private func GLNTRKNA_SetupAesthetics() {
        view.backgroundColor = UIColor(red: 0.05, green: 0.04, blue: 0.16, alpha: 1.0)
        
        let gln_header = UILabel(frame: CGRect(x: 20, y: GLNTRKNA_RatioH(40), width: 200, height: 40))
        gln_header.text = "Message"
        gln_header.textColor = .white
        gln_header.font = .systemFont(ofSize: 32, weight: .bold)
        view.addSubview(gln_header)
        let gln_layout_h = UICollectionViewFlowLayout()
        gln_layout_h.scrollDirection = .horizontal
        gln_layout_h.itemSize = CGSize(width: GLNTRKNA_ScaleW(100), height: GLNTRKNA_ScaleH(145))
        gln_layout_h.minimumInteritemSpacing = 10
        GLNTRKNA_ArtisanHorizonStrip.frame = CGRect(x: 0, y: GLNTRKNA_RatioH(110), width: GLNTRKNA_ScrW, height: GLNTRKNA_RatioH(150))
        GLNTRKNA_ArtisanHorizonStrip.backgroundColor = .clear
        GLNTRKNA_ArtisanHorizonStrip.collectionViewLayout = gln_layout_h
        GLNTRKNA_ArtisanHorizonStrip.delegate = self
        GLNTRKNA_ArtisanHorizonStrip.dataSource = self
        GLNTRKNA_ArtisanHorizonStrip.showsHorizontalScrollIndicator = false
        GLNTRKNA_ArtisanHorizonStrip.register(GLNTRKNA_ArtisanCell.self, forCellWithReuseIdentifier: "Artisan")
        view.addSubview(GLNTRKNA_ArtisanHorizonStrip)
        
       
//        GLNTRKNA_RenderFollowerRow()
        
        let gln_label = UILabel(frame: CGRect(x: 20, y: GLNTRKNA_RatioH(280), width: 100, height: 30))
        gln_label.text = "Recent"
        gln_label.textColor = .white
        gln_label.font = .boldSystemFont(ofSize: 20)
        view.addSubview(gln_label)
        
        GLNTRKNA_BaseTable.frame = CGRect(x: 0, y: GLNTRKNA_RatioH(320), width: GLNTRKNA_ScrW, height: GLNTRKNA_ScrH - GLNTRKNA_RatioH(380))
        GLNTRKNA_BaseTable.backgroundColor = .clear
        GLNTRKNA_BaseTable.delegate = self
        GLNTRKNA_BaseTable.dataSource = self
        GLNTRKNA_BaseTable.separatorStyle = .none
        GLNTRKNA_BaseTable.register(GLNTRKNA_NexusCell.self, forCellReuseIdentifier: "GLNTRKNA_NexusCell")
        GLNTRKNA_BaseTable.refreshControl = GLNTRKNA_Refresher
        GLNTRKNA_Refresher.addTarget(self, action: #selector(GLNTRKNA_HandleBlacklistUpdate), for: .valueChanged)
        view.addSubview(GLNTRKNA_BaseTable)
        
        view.addSubview(gln_planet)
    }
    
    
    private let GLNTRKNA_ArtisanHorizonStrip = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return GLNTRKNA_CentralAuthority.GLNTRKNA_MesageData.count }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gln_cell = tableView.dequeueReusableCell(withIdentifier: "GLNTRKNA_NexusCell", for: indexPath) as! GLNTRKNA_NexusCell
        gln_cell.selectionStyle = .none
        gln_cell.GLNTRKNA_Apply(gln_m: GLNTRKNA_CentralAuthority.GLNTRKNA_MesageData[indexPath.row])
        return gln_cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 90 }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gln_chat = GLNTRKNA_SoloDialogueController(GLNTRKNA_ContextCarrier: GLNTRKNA_CentralAuthority.GLNTRKNA_MesageData[indexPath.row])
        
//        gln_chat.GLNTRKNA_PartnerName = GLNTRKNA_NexusData[indexPath.row].gln_name
        self.navigationController?.pushViewController(gln_chat, animated: true)
    }
    
    private func GLNTRKNA_RatioH(_ v: CGFloat) -> CGFloat { return (GLNTRKNA_ScrH / 852) * v }
}

class GLNTRKNA_NexusCell: UITableViewCell {
    private let gln_ava = UIImageView()
    private let gln_name = UILabel()
    private let gln_sub = UILabel()
    private let gln_time = UILabel()
    private let gln_badge = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        gln_ava.frame = CGRect(x: 20, y: 15, width: 60, height: 60)
        gln_ava.layer.cornerRadius = 30
        gln_ava.backgroundColor = .gray
        contentView.addSubview(gln_ava)
        
        gln_name.frame = CGRect(x: 95, y: 20, width: 200, height: 25)
        gln_name.textColor = .white
        gln_name.font = .boldSystemFont(ofSize: 17)
        contentView.addSubview(gln_name)
        
        gln_sub.frame = CGRect(x: 95, y: 48, width: 200, height: 20)
        gln_sub.textColor = .lightGray
        gln_sub.font = .systemFont(ofSize: 14)
        contentView.addSubview(gln_sub)
        
        gln_time.frame = CGRect(x: UIScreen.main.bounds.width - 70, y: 20, width: 50, height: 20)
        gln_time.textColor = .darkGray
        gln_time.font = .systemFont(ofSize: 12)
        contentView.addSubview(gln_time)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func GLNTRKNA_Apply(gln_m: GLNTRKNA_ConvergeModel) {
        gln_name.text = gln_m.userModel.glnt_userName
        gln_ava.image = UIImage(named: gln_m.userModel.glnt_userId)
        gln_sub.text = gln_m.convert.last?.gln_txt
        gln_time.text = gln_m.convert.last?.gln_time
    }
}
