//
//  GLNTRKNA_PersonalAtelier.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/27.
//
import UIKit
//个人中心
class GLNTRKNA_PersonalOrbitController: UIViewController {

    private let GLNTRKNA_ScrW = UIScreen.main.bounds.width
    private let GLNTRKNA_ScrH = UIScreen.main.bounds.height
    private let GLNTRKNA_ScaleX = UIScreen.main.bounds.width / 393.0
    private let GLNTRKNA_ScaleY = UIScreen.main.bounds.height / 852.0

    private let GLNTRKNA_MainWrapper = UIScrollView()
    private let GLNTRKNA_PortraitNode = UIImageView()
    private let GLNTRKNA_AliasLabel = UILabel()
    private let GLNTRKNA_BioProse = UILabel()
    
    private let GLNTRKNA_MetricHeart = UILabel()
    private let GLNTRKNA_MetricTribe = UILabel()
    private let GLNTRKNA_MetricPath = UILabel()
    
    private let GLNTRKNA_VoidStation = UIView()
    private let GLNTRKNA_Refresher = UIRefreshControl()

    private var gln_amount = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_ForgeInterface()
        GLNTRKNA_FetchIdentityPulse()
        
        // 注册刷新通知
                NotificationCenter.default.addObserver(self, selector: #selector(GLNTRKNA_SyncWealth), name: NSNotification.Name("GLNTRKNA_COIN_REFRESH"), object: nil)
                GLNTRKNA_SyncWealth()
    }
    @objc private func GLNTRKNA_SyncWealth() {
            let glnt_amount = UserDefaults.standard.integer(forKey: "GLNTRKNA_RESERVE_COINS")
        gln_amount.text = "\(glnt_amount)"
       
    }
    private func GLNTRKNA_ForgeInterface() {
        view.backgroundColor = UIColor(red: 0.05, green: 0.04, blue: 0.16, alpha: 1.0)
        
        GLNTRKNA_MainWrapper.frame = view.bounds
        GLNTRKNA_MainWrapper.alwaysBounceVertical = true
        GLNTRKNA_Refresher.addTarget(self, action: #selector(GLNTRKNA_FetchIdentityPulse), for: .valueChanged)
        GLNTRKNA_MainWrapper.refreshControl = GLNTRKNA_Refresher
        view.addSubview(GLNTRKNA_MainWrapper)

        let gln_title = UILabel(frame: CGRect(x: 20 * GLNTRKNA_ScaleX, y: 30 * GLNTRKNA_ScaleY, width: 200, height: 40))
        gln_title.text = "Personal"
        gln_title.textColor = .white
        gln_title.font = .systemFont(ofSize: 32, weight: .bold)
        GLNTRKNA_MainWrapper.addSubview(gln_title)

        GLNTRKNA_PortraitNode.frame = CGRect(x: 20 * GLNTRKNA_ScaleX, y: 120 * GLNTRKNA_ScaleY, width: 100 * GLNTRKNA_ScaleX, height: 100 * GLNTRKNA_ScaleX)
        GLNTRKNA_PortraitNode.layer.cornerRadius = 50 * GLNTRKNA_ScaleX
        GLNTRKNA_PortraitNode.clipsToBounds = true
        GLNTRKNA_PortraitNode.backgroundColor = .darkGray
        GLNTRKNA_PortraitNode.layer.borderWidth = 2
        GLNTRKNA_PortraitNode.layer.borderColor = UIColor.systemPink.cgColor
        GLNTRKNA_MainWrapper.addSubview(GLNTRKNA_PortraitNode)

        let gln_edit_btn = UIButton(frame: CGRect(x: 143 * GLNTRKNA_ScaleX, y: 185 * GLNTRKNA_ScaleY, width: 86 * GLNTRKNA_ScaleX, height: 30 * GLNTRKNA_ScaleY))
     
        gln_edit_btn.setBackgroundImage(UIImage(named: "gln_edit_btn"), for: .normal)
        
        GLNTRKNA_MainWrapper.addSubview(gln_edit_btn)
        gln_edit_btn.addTarget(self, action:#selector(GLNTRKNAgln_edit) , for: .touchUpInside)
        
        let gln_gear = UIButton(frame: CGRect(x: 143 * GLNTRKNA_ScaleX + 86 * GLNTRKNA_ScaleX + 12, y: 185 * GLNTRKNA_ScaleY, width: 30 * GLNTRKNA_ScaleY, height: 30 * GLNTRKNA_ScaleY))
        gln_gear.backgroundColor = UIColor(white: 1, alpha: 0.1)
        gln_gear.addTarget(self, action: #selector(GLNTRKNAgln_gear), for: .touchUpInside)
        
        gln_gear.setImage(UIImage(named: "gln_gear"), for: .normal)
      
        GLNTRKNA_MainWrapper.addSubview(gln_gear)

        GLNTRKNA_AliasLabel.frame = CGRect(x: 20 * GLNTRKNA_ScaleX, y: 235 * GLNTRKNA_ScaleY, width: 300, height: 35)
        GLNTRKNA_AliasLabel.textColor = .white
        GLNTRKNA_AliasLabel.font = .boldSystemFont(ofSize: 26)
        GLNTRKNA_MainWrapper.addSubview(GLNTRKNA_AliasLabel)

        GLNTRKNA_BioProse.frame = CGRect(x: 20 * GLNTRKNA_ScaleX, y: 275 * GLNTRKNA_ScaleY, width: GLNTRKNA_ScrW - 40, height: 45)
        GLNTRKNA_BioProse.textColor = .lightGray
        GLNTRKNA_BioProse.numberOfLines = 2
        GLNTRKNA_BioProse.font = .systemFont(ofSize: 14)
        GLNTRKNA_MainWrapper.addSubview(GLNTRKNA_BioProse)

        let gln_stat_y = 340 * GLNTRKNA_ScaleY
        let gln_stat_w = GLNTRKNA_ScrW / 3
        
        GLNTRKNA_MetricHeart.frame = CGRect(x: 0, y: gln_stat_y, width: gln_stat_w, height: 30)
        GLNTRKNA_MetricHeart.textAlignment = .center
        GLNTRKNA_MetricHeart.textColor = .white
        GLNTRKNA_MetricHeart.font = .boldSystemFont(ofSize: 20)
        GLNTRKNA_MainWrapper.addSubview(GLNTRKNA_MetricHeart)
        
        GLNTRKNA_MetricTribe.frame = CGRect(x: gln_stat_w, y: gln_stat_y, width: gln_stat_w, height: 30)
        GLNTRKNA_MetricTribe.textAlignment = .center
        GLNTRKNA_MetricTribe.textColor = .white
        GLNTRKNA_MetricTribe.font = .boldSystemFont(ofSize: 20)
        GLNTRKNA_MainWrapper.addSubview(GLNTRKNA_MetricTribe)
        
        GLNTRKNA_MetricPath.frame = CGRect(x: gln_stat_w * 2, y: gln_stat_y, width: gln_stat_w, height: 30)
        GLNTRKNA_MetricPath.textAlignment = .center
        GLNTRKNA_MetricPath.textColor = .white
        GLNTRKNA_MetricPath.font = .boldSystemFont(ofSize: 20)
        GLNTRKNA_MainWrapper.addSubview(GLNTRKNA_MetricPath)
        
        let gln_titles = ["Likes", "Followers", "Following"]
        for i in 0..<3 {
            let gln_l = UILabel(frame: CGRect(x: CGFloat(i) * gln_stat_w, y: gln_stat_y + 30, width: gln_stat_w, height: 20))
            gln_l.text = gln_titles[i]
            gln_l.textColor = .gray
            gln_l.textAlignment = .center
            gln_l.font = .systemFont(ofSize: 13)
            GLNTRKNA_MainWrapper.addSubview(gln_l)
        }

        let gln_coin_bar = UIView(frame: CGRect(x: 15 * GLNTRKNA_ScaleX, y: 425 * GLNTRKNA_ScaleY, width: GLNTRKNA_ScrW - 30 * GLNTRKNA_ScaleX, height: 75 * GLNTRKNA_ScaleY))
//        gln_coin_bar.backgroundColor = UIColor(red: 0.96, green: 0.64, blue: 0.82, alpha: 1.0)
        gln_coin_bar.layer.cornerRadius = 20 * GLNTRKNA_ScaleY
        gln_coin_bar.layer.masksToBounds = true
        gln_coin_bar.isUserInteractionEnabled = true
        GLNTRKNA_MainWrapper.addSubview(gln_coin_bar)
        gln_coin_bar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(GLNTRKNA_FetchIdentityBlance)))
        
        let bgLayer1 = CAGradientLayer()
        bgLayer1.colors = [UIColor(red: 0.87, green: 0.46, blue: 0.98, alpha: 1).cgColor, UIColor(red: 0.98, green: 0.73, blue: 0.78, alpha: 1).cgColor]
        bgLayer1.locations = [0, 1]
        bgLayer1.frame = gln_coin_bar.bounds
        bgLayer1.startPoint = CGPoint(x: 1, y: 0.5)
        bgLayer1.endPoint = CGPoint(x: 0.5, y: 0.5)
        gln_coin_bar.layer.addSublayer(bgLayer1)
        
        
        let gln_coin_icon = UIImageView(frame: CGRect(x: 20, y: 20 * GLNTRKNA_ScaleY, width: 35 * GLNTRKNA_ScaleY, height: 35 * GLNTRKNA_ScaleY))
        gln_coin_icon.image = UIImage(named: "gln_coin_icon")
        gln_coin_bar.addSubview(gln_coin_icon)

        let gln_coin_txt = UILabel(frame: CGRect(x: 65, y: 0, width: 150, height: 75 * GLNTRKNA_ScaleY))
        gln_coin_txt.text = "Available coins"
        gln_coin_txt.textColor = .black
        gln_coin_txt.font = .boldSystemFont(ofSize: 16)
        gln_coin_bar.addSubview(gln_coin_txt)

        self.gln_amount = UILabel(frame: CGRect(x: gln_coin_bar.frame.width - 100, y: 0, width: 80, height: 75 * GLNTRKNA_ScaleY))
        gln_amount.text = "2222 >"
        gln_amount.textColor = .purple
        gln_amount.textAlignment = .right
        gln_amount.font = .boldSystemFont(ofSize: 18)
        gln_coin_bar.addSubview(gln_amount)

        GLNTRKNA_ConstructVoidZone()
    }

    
    
    @objc func GLNTRKNAgln_edit()  {
        self.navigationController?.pushViewController(GLNTRKNA_IdentityRefiner(), animated: true)
     }
    
    
   @objc func GLNTRKNAgln_gear()  {
       self.navigationController?.pushViewController(GLNTRKNA_SettlementController(), animated: true)
    }
    private func GLNTRKNA_ConstructVoidZone() {
        GLNTRKNA_VoidStation.frame = CGRect(x: 0, y: 500 * GLNTRKNA_ScaleY, width: GLNTRKNA_ScrW, height: 300 * GLNTRKNA_ScaleY)
        GLNTRKNA_MainWrapper.addSubview(GLNTRKNA_VoidStation)

        let gln_planet = UIImageView(frame: CGRect(x: (GLNTRKNA_ScrW - 160)/2, y: 40 * GLNTRKNA_ScaleY, width: 160, height: 120))
        gln_planet.image = UIImage(named: "GLNTRKNA_EmptyNebula")
        gln_planet.contentMode = .scaleAspectFit
        GLNTRKNA_VoidStation.addSubview(gln_planet)

        let gln_hint = UILabel(frame: CGRect(x: 40, y: 170 * GLNTRKNA_ScaleY, width: GLNTRKNA_ScrW - 80, height: 50))
        gln_hint.text = "Haven't reproduced the nail art yet,\nnow go publish!"
        gln_hint.textColor = .lightGray
        gln_hint.numberOfLines = 2
        gln_hint.textAlignment = .center
        gln_hint.font = .systemFont(ofSize: 15)
        GLNTRKNA_VoidStation.addSubview(gln_hint)
        
        GLNTRKNA_MainWrapper.contentSize = CGSize(width: GLNTRKNA_ScrW, height: 850 * GLNTRKNA_ScaleY)
    }

    @objc private func GLNTRKNA_FetchIdentityPulse() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.GLNTRKNA_AliasLabel.text = "Bronwyn"
            self.GLNTRKNA_BioProse.text = "Nail artist, creating little masterpieces one finger at a time."
            self.GLNTRKNA_MetricHeart.text = "0"
            self.GLNTRKNA_MetricTribe.text = "0"
            self.GLNTRKNA_MetricPath.text = "0"
            
            UIView.animate(withDuration: 0.5) {
                self.GLNTRKNA_PortraitNode.alpha = 1.0
            }
            self.GLNTRKNA_Refresher.endRefreshing()
        }
    }
    
   @objc func GLNTRKNA_FetchIdentityBlance() {
       self.navigationController?.pushViewController(GLNTRKNA_TreasureVault(), animated: true)
    }
}
