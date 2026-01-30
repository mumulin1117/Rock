//
//  GLNTRKNA_GuestOrbitController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/29.
//

import UIKit
//他人主页
class GLNTRKNA_GuestOrbitController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var GLNTRKNACelestialData: GLNTRKNA_ConvergeModel?
    
    private let GLNTRKNACanvasW = UIScreen.main.bounds.width
    private let GLNTRKNACanvasH = UIScreen.main.bounds.height
    private let GLNTRKNARatioX = UIScreen.main.bounds.width / 393.0
    private let GLNTRKNARatioY = UIScreen.main.bounds.height / 852.0

    private let GLNTRKNASceneryScroll = UIScrollView()
    private let GLNTRKNAMirrorBack = UIImageView()
    private let GLNTRKNAAuraAvatar = UIImageView()
    private let GLNTRKNANomadLabel = UILabel()
    private let GLNTRKNAMantraLabel = UILabel()
    
    private let GLNTRKNALinkBtn = UIButton()
    private let GLNTRKNAPulseBtn = UIButton()
    private let GLNTRKNACallDeck = UIButton()
    
    private var GLNTRKNAVibeCollection: UICollectionView!
    private var GLNTRKNAMomentStream = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNAIgniteAesthetics()
        GLNTRKNASyncPortalData()
    }
    //report
   @objc func gln_reportTraiiler()  {
       let safetyvc =  GLNTRKNA_SafetyHubController.init(GLNTRKNA_ActiveMode: .GLNTRKNA_PrimarySelection)
       self.present(safetyvc, animated: true)
    }
    private func GLNTRKNAIgniteAesthetics() {
       
        
        GLNTRKNASceneryScroll.frame = view.bounds
        GLNTRKNASceneryScroll.contentInsetAdjustmentBehavior = .never
        view.addSubview(GLNTRKNASceneryScroll)
        
        GLNTRKNAMirrorBack.frame = CGRect(x: 0, y: 0, width: GLNTRKNACanvasW, height: 380 * GLNTRKNARatioY)
        GLNTRKNAMirrorBack.contentMode = .scaleAspectFill
        GLNTRKNAMirrorBack.clipsToBounds = true
        GLNTRKNASceneryScroll.addSubview(GLNTRKNAMirrorBack)
        
        view.backgroundColor = UIColor(red: 0.05, green: 0.04, blue: 0.16, alpha: 1.0)
        let gln_options_btn = UIButton(frame: CGRect(x: GLNTRKNACanvasW - 50 * GLNTRKNARatioX, y: 60 * GLNTRKNARatioY, width: 40 * GLNTRKNARatioX, height: 30 * GLNTRKNARatioX))
        gln_options_btn.setImage(UIImage(named: "gln_report"), for: .normal)
        gln_options_btn.addTarget(self, action: #selector(gln_reportTraiiler), for: .touchUpInside)
        view.addSubview(gln_options_btn)
        
        
        let yac_back_btn = UIButton(frame: CGRect(x: 20 * GLNTRKNARatioX, y: 60 * GLNTRKNARatioY, width: 40, height: 40))
        yac_back_btn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        yac_back_btn.tintColor = .white
        yac_back_btn.addTarget(self, action: #selector(GLNTRKNAExitOrbit), for: .touchUpInside)
        view.addSubview(yac_back_btn)

        GLNTRKNAAuraAvatar.frame = CGRect(x: 20 * GLNTRKNARatioX, y: 320 * GLNTRKNARatioY, width: 80 * GLNTRKNARatioX, height: 80 * GLNTRKNARatioX)
        GLNTRKNAAuraAvatar.layer.cornerRadius = 40 * GLNTRKNARatioX
        GLNTRKNAAuraAvatar.layer.borderWidth = 2
        GLNTRKNAAuraAvatar.layer.borderColor = UIColor.white.cgColor
        GLNTRKNAAuraAvatar.clipsToBounds = true
        GLNTRKNASceneryScroll.addSubview(GLNTRKNAAuraAvatar)

        GLNTRKNANomadLabel.frame = CGRect(x: 115 * GLNTRKNARatioX, y: 325 * GLNTRKNARatioY, width: 200, height: 30)
        GLNTRKNANomadLabel.textColor = .white
        GLNTRKNANomadLabel.font = .boldSystemFont(ofSize: 22)
        GLNTRKNASceneryScroll.addSubview(GLNTRKNANomadLabel)

        GLNTRKNAMantraLabel.frame = CGRect(x: 115 * GLNTRKNARatioX, y: 355 * GLNTRKNARatioY, width: GLNTRKNACanvasW - 180, height: 40)
        GLNTRKNAMantraLabel.textColor = .lightGray
        GLNTRKNAMantraLabel.numberOfLines = 2
        GLNTRKNAMantraLabel.font = .systemFont(ofSize: 13)
        GLNTRKNASceneryScroll.addSubview(GLNTRKNAMantraLabel)
        
        GLNTRKNALinkBtn.frame = CGRect(x: GLNTRKNACanvasW - 75 * GLNTRKNARatioX, y: 330 * GLNTRKNARatioY, width: 55 * GLNTRKNARatioX, height: 55 * GLNTRKNARatioX)
        GLNTRKNALinkBtn.setImage(UIImage(named: "GLNTRKNALin_n"), for: .normal)
        GLNTRKNALinkBtn.setImage(UIImage(named: "GLNTRKNALin_nnn"), for: .selected)
        GLNTRKNALinkBtn.addTarget(self, action: #selector(GLNTRKNAToggleAlliance), for: .touchUpInside)
        GLNTRKNASceneryScroll.addSubview(GLNTRKNALinkBtn)
        
        GLNTRKNAPulseBtn.frame = CGRect(x: GLNTRKNACanvasW - 145 * GLNTRKNARatioX, y: 330 * GLNTRKNARatioY, width: 55 * GLNTRKNARatioX, height: 55 * GLNTRKNARatioX)
       
        GLNTRKNAPulseBtn.setImage(UIImage(named: "GLNTRKNAPulseBtn"), for: .normal)
       
        GLNTRKNAPulseBtn.addTarget(self, action: #selector(GLNTRKNAEnterDeepChat), for: .touchUpInside)
        GLNTRKNASceneryScroll.addSubview(GLNTRKNAPulseBtn)

        let yac_bar_y = 440 * GLNTRKNARatioY
                let yac_seg_w = (GLNTRKNACanvasW - 50 * GLNTRKNARatioX) / 3
                let yac_seg_h = 70 * GLNTRKNARatioY
                
                // 1. Fans Segment
                let yac_fans = GLNTRKNAStatSegmentView(frame: CGRect(x: 15 * GLNTRKNARatioX, y: yac_bar_y, width: yac_seg_w, height: yac_seg_h), key: "Fans", value: "60")
                GLNTRKNASceneryScroll.addSubview(yac_fans)
                
                // 2. Followers Segment
                let yac_follows = GLNTRKNAStatSegmentView(frame: CGRect(x: 25 * GLNTRKNARatioX + yac_seg_w, y: yac_bar_y, width: yac_seg_w, height: yac_seg_h), key: "Followers", value: "10.2w")
                GLNTRKNASceneryScroll.addSubview(yac_follows)
        
//        let yac_stat_w = (GLNTRKNACanvasW - 45 * GLNTRKNARatioX) / 3
//        let yac_stat_y = 430 * GLNTRKNARatioY
        GLNTRKNACallDeck.setBackgroundImage( UIImage(named: "yac_cahil_icon"), for: .normal)
        GLNTRKNACallDeck.frame = CGRect(x: 35 * GLNTRKNARatioX + yac_seg_w * 2, y: yac_bar_y - 41, width: yac_seg_w , height: 101)
       
        GLNTRKNACallDeck.addTarget(self, action: #selector(GLNTRKNAEstablishVisualLink), for: .touchUpInside)
        GLNTRKNASceneryScroll.addSubview(GLNTRKNACallDeck)
        
        let yac_call_icon = UIImageView(frame: CGRect(x: 15, y: GLNTRKNACallDeck.frame.maxY + 12, width: 80, height: 24))
        yac_call_icon.image = UIImage(named: "monmentTItle")
      
        GLNTRKNASceneryScroll.addSubview(yac_call_icon)
       
        let yac_layout = UICollectionViewFlowLayout()
        yac_layout.minimumLineSpacing = 10
        yac_layout.minimumInteritemSpacing = 10
        GLNTRKNAVibeCollection = UICollectionView(frame: CGRect(x: 15, y: yac_call_icon.frame.maxY + 12, width: GLNTRKNACanvasW - 30, height: 500), collectionViewLayout: yac_layout)
        GLNTRKNAVibeCollection.backgroundColor = .clear
        GLNTRKNAVibeCollection.delegate = self
        GLNTRKNAVibeCollection.dataSource = self
        GLNTRKNAVibeCollection.isScrollEnabled = false
        GLNTRKNAVibeCollection.register(GLNTRKNA_VibeMatrixCell.self, forCellWithReuseIdentifier: "GLNTRKNA_VibeMatrixCell")
        GLNTRKNASceneryScroll.addSubview(GLNTRKNAVibeCollection)
        
        GLNTRKNASceneryScroll.contentSize = CGSize(width: GLNTRKNACanvasW, height: 1100 * GLNTRKNARatioY)
    }

    private func GLNTRKNASyncPortalData() {
        guard let yac_data = GLNTRKNACelestialData else { return }
        GLNTRKNANomadLabel.text = yac_data.gln_name
        GLNTRKNAMantraLabel.text = "Nail artist, creating little masterpieces one finger at a time."
        // Fake Network Placeholder
        GLNTRKNAMirrorBack.image = UIImage(named: "gln_bg_placeholder")
        GLNTRKNAAuraAvatar.image = UIImage(named: "gln_avatar_placeholder")
    }

    // MARK: - Logic Interaction
    @objc private func GLNTRKNAToggleAlliance() {
        GLNTRKNALinkBtn.isSelected.toggle()
//        let yac_isFollowed = GLNTRKNALinkBtn.isSelected
//        GLNTRKNALinkBtn.backgroundColor = yac_isFollowed ? .systemPink : UIColor(white: 1, alpha: 0.1)
//        GLNTRKNALinkBtn.setImage(UIImage(systemName: yac_isFollowed ? "person.fill.checkmark" : "person.badge.plus"), for: .normal)
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

    @objc private func GLNTRKNAEnterDeepChat() {
        let yac_chat_vc = GLNTRKNA_SoloDialogueController()
        yac_chat_vc.GLNTRKNA_ContextCarrier = GLNTRKNACelestialData
        self.navigationController?.pushViewController(yac_chat_vc, animated: true)
    }

    @objc private func GLNTRKNAEstablishVisualLink() {
        let yac_face_vc = GLNTRKNA_FaceMirrorController()
        yac_face_vc.GLNTRKNA_RemoteIdentity = GLNTRKNACelestialData?.gln_name ?? "User"
        yac_face_vc.modalPresentationStyle = .fullScreen
        self.present(yac_face_vc, animated: true)
    }

    @objc private func GLNTRKNAExitOrbit() {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GLNTRKNA_VibeMatrixCell", for: indexPath) as! GLNTRKNA_VibeMatrixCell
        cell.gln_report.addTarget(self, action: #selector(gln_reportTraiiler), for: .touchUpInside)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (GLNTRKNACanvasW - 40) / 2
        return CGSize(width: w, height: w * 1.4)
    }
}
