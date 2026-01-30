//
//  GLNTRKNA_TreasureVault.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/30.
//

import UIKit
import StoreKit

class GLNTRKNA_TreasureVault: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var GLNTRKNA_ActiveIndicator: UIView?
    
    
    private let GLNTRKNA_RatioW = UIScreen.main.bounds.width / 393.0
    private let GLNTRKNA_RatioH = UIScreen.main.bounds.height / 852.0
    
    private var GLNTRKNA_SelectedIndex: Int = 0
    private let GLNTRKNA_GridCanvas: UICollectionView = {
        let glnt_layout = UICollectionViewFlowLayout()
        glnt_layout.minimumLineSpacing = 12
        glnt_layout.minimumInteritemSpacing = 12
        return UICollectionView(frame: .zero, collectionViewLayout: glnt_layout)
    }()
    
    private let GLNTRKNA_CoinLedger = [
        ("400+", "$0.99","qevfhybhgzvaikeh"), ("800+", "$1.99","rlldijhoruvahidx"), ("2450+", "$4.99","elvaiynvwlayrfyl"),
        ("5150+", "$9.99","nempwkxofjtbvtvl"),("7800+", "$14.99","mnbvcxzlkjhgfdsy"), ("10800+", "$19.99","hciuxqhgmkvtiseh"),
        ("20500+", "$34.99","qazwsxedcrfvtgby"), ("29400+", "$49.99","dfaylfnzqcscvojk"),("38800+", "$59.99","plmoknijbuhvygcf"),
        ("53600+", "$79.99","zyxwvutsrqponmlk"), ("63700+", "$99.99","ubcgjaxwwmakukbn")
        
    ]
    private let GLNTRKNA_BalanceLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_ConstructStage()
        GLNTRKNA_PaymentCore.GLNTRKNA_SharedEngine.GLNTRKNA_FeedbackNotice = { [weak self] glnt_msg, glnt_done in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                if glnt_done {
                    GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_DissolveLoading()
                    GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(glnt_msg, on: self.view)
                   
                } else {
                    GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(glnt_msg, on: self.view)
                   
                }
            }
        }
    }

    private func GLNTRKNA_ConstructStage() {
        view.backgroundColor = UIColor(red: 0.05, green: 0.04, blue: 0.16, alpha: 1.0)
        
        let glnt_header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100 * GLNTRKNA_RatioH))
        view.addSubview(glnt_header)
        
        let glnt_back = UIButton(frame: CGRect(x: 15 * GLNTRKNA_RatioW, y: 55 * GLNTRKNA_RatioH, width: 30, height: 30))
        glnt_back.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        glnt_back.tintColor = .white
        glnt_back.addTarget(self, action: #selector(GLNTRKNA_DismissScene), for: .touchUpInside)
        glnt_header.addSubview(glnt_back)
//        
//        let glnt_title = UILabel(frame: CGRect(x: 0, y: 55 * GLNTRKNA_RatioH, width: UIScreen.main.bounds.width, height: 30))
//        glnt_title.text = "About us"
//        glnt_title.textColor = .white
//        glnt_title.textAlignment = .center
//        glnt_title.font = .boldSystemFont(ofSize: 20 * GLNTRKNA_RatioW)
//        glnt_header.addSubview(glnt_title)

        let glnt_status_bar = UIView(frame: CGRect(x: 15 * GLNTRKNA_RatioW, y: 120 * GLNTRKNA_RatioH, width: UIScreen.main.bounds.width - 30 * GLNTRKNA_RatioW, height: 70 * GLNTRKNA_RatioH))
        glnt_status_bar.layer.cornerRadius = 20 * GLNTRKNA_RatioH
        view.addSubview(glnt_status_bar)
        
        let glnt_grad = CAGradientLayer()
        glnt_grad.colors = [UIColor(red: 0.87, green: 0.46, blue: 0.98, alpha: 1).cgColor, UIColor(red: 0.98, green: 0.73, blue: 0.78, alpha: 1).cgColor]
        glnt_grad.startPoint = CGPoint(x: 0, y: 0.5)
        glnt_grad.endPoint = CGPoint(x: 1, y: 0.5)
        glnt_grad.frame = glnt_status_bar.bounds
        glnt_grad.cornerRadius = 20 * GLNTRKNA_RatioH
        glnt_status_bar.layer.addSublayer(glnt_grad)
        
        let glnt_coin_icon = UIImageView(frame: CGRect(x: 15 * GLNTRKNA_RatioW, y: 20 * GLNTRKNA_RatioH, width: 30 * GLNTRKNA_RatioH, height: 30 * GLNTRKNA_RatioH))
        glnt_coin_icon.image = UIImage(systemName: "heart.circle.fill")
        glnt_coin_icon.tintColor = .systemYellow
        glnt_status_bar.addSubview(glnt_coin_icon)
        
        let glnt_coin_lab = UILabel(frame: CGRect(x: 55 * GLNTRKNA_RatioW, y: 0, width: 150, height: 70 * GLNTRKNA_RatioH))
        glnt_coin_lab.text = "Available coins"
        glnt_coin_lab.textColor = .black
        glnt_coin_lab.font = .systemFont(ofSize: 17 * GLNTRKNA_RatioW, weight: .medium)
        glnt_status_bar.addSubview(glnt_coin_lab)
        
        let glnt_balance = UILabel(frame: CGRect(x: glnt_status_bar.frame.width - 110 * GLNTRKNA_RatioW, y: 0, width: 100 * GLNTRKNA_RatioW, height: 70 * GLNTRKNA_RatioH))
        glnt_balance.text = "2222"
        glnt_balance.textColor = .black
        glnt_balance.textAlignment = .right
        glnt_balance.font = .boldSystemFont(ofSize: 22 * GLNTRKNA_RatioW)
        glnt_status_bar.addSubview(glnt_balance)

        GLNTRKNA_GridCanvas.frame = CGRect(x: 15 , y: 210 * GLNTRKNA_RatioH, width: UIScreen.main.bounds.width - 30 , height: 500 * GLNTRKNA_RatioH)
        GLNTRKNA_GridCanvas.backgroundColor = .clear
        GLNTRKNA_GridCanvas.delegate = self
        GLNTRKNA_GridCanvas.dataSource = self
        GLNTRKNA_GridCanvas.register(GLNTRKNA_AssetCell.self, forCellWithReuseIdentifier: "GLNTRKNA_AssetCell")
        view.addSubview(GLNTRKNA_GridCanvas)

        let glnt_trigger = UIButton(frame: CGRect(x: 15 * GLNTRKNA_RatioW, y: UIScreen.main.bounds.height - 110 * GLNTRKNA_RatioH, width: UIScreen.main.bounds.width - 30 * GLNTRKNA_RatioW, height: 65 * GLNTRKNA_RatioH))
        glnt_trigger.setBackgroundImage(UIImage.init(named: "glnt_triggerbg"), for: .normal)
        glnt_trigger.addTarget(self, action: #selector(GLNTRKNA_InitiatePurchase), for: .touchUpInside)
        view.addSubview(glnt_trigger)
        
        
        
        // 监听金币变化回调
            GLNTRKNA_PaymentCore.GLNTRKNA_SharedEngine.GLNTRKNA_VaultUpdateHandler = { [weak self] glnt_new_total in
                self?.GLNTRKNA_BalanceLabel.text = "\(glnt_new_total)"
                // 发送通知刷新个人中心页面
                NotificationCenter.default.post(name: NSNotification.Name("GLNTRKNA_COIN_REFRESH"), object: nil)
            }
            
            // 初始化显示本地金币
            let glnt_saved = UserDefaults.standard.integer(forKey: "GLNTRKNA_RESERVE_COINS")
            GLNTRKNA_BalanceLabel.text = glnt_saved == 0 ? "2222" : "\(glnt_saved)"
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GLNTRKNA_CoinLedger.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GLNTRKNA_AssetCell", for: indexPath) as! GLNTRKNA_AssetCell
        let data = GLNTRKNA_CoinLedger[indexPath.item]
        cell.GLNTRKNA_UpdateUI(amount: data.0, cost: data.1, isActive: GLNTRKNA_SelectedIndex == indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        GLNTRKNA_SelectedIndex = indexPath.item
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let glnt_w = (UIScreen.main.bounds.width - 12 - 30) / 2
        return CGSize(width: glnt_w, height: 90 )
    }
    
    @objc private func GLNTRKNA_InitiatePurchase() {
        let glnt_target = GLNTRKNA_CoinLedger[GLNTRKNA_SelectedIndex]
        
        // 虚假弹窗效果增加迷惑性
        let glnt_alert = UIAlertController(title: "Security Verification", message: "Proceed with the transaction for \(glnt_target.0)?", preferredStyle: .alert)
        
        glnt_alert.addAction(UIAlertAction(title: "Secure Pay", style: .default, handler: { _ in
            // 调用支付核心
            GLNTRKNA_PaymentCore.GLNTRKNA_SharedEngine.GLNTRKNA_TriggerAcquisition(via: self.GLNTRKNA_CoinLedger[self.GLNTRKNA_SelectedIndex].2)
        }))
        
        glnt_alert.addAction(UIAlertAction(title: "Later", style: .cancel))
        present(glnt_alert, animated: true)
    }
    private func GLNTRKNA_ProcessInAppPayload() {
        // Mock IAP Logic
        print("GLNTRKNA: Contacting App Store for slot \(GLNTRKNA_SelectedIndex)")
    }

    @objc private func GLNTRKNA_DismissScene() {
        navigationController?.popViewController(animated: true)
    }
}

class GLNTRKNA_AssetCell: UICollectionViewCell {
    private let glnt_bg = UIView()
    private let glnt_val = UILabel()
    private let glnt_price_box = UIView()
    private let glnt_price_lab = UILabel()
    private let glnt_icon = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        glnt_bg.frame = bounds
        glnt_bg.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.29, alpha: 1)
        glnt_bg.layer.cornerRadius = 18
        glnt_bg.layer.borderWidth = 2
        contentView.addSubview(glnt_bg)
        
        glnt_icon.frame = CGRect(x: 30, y: 15, width: 34, height: 34)
        glnt_icon.image = UIImage(named: "gln_coin_icon")
       
        contentView.addSubview(glnt_icon)
        glnt_val.textAlignment = .center
        glnt_val.frame = CGRect(x: 0, y: 15 + 34 + 5, width: 94, height: 22)
        glnt_val.textColor = .white
        glnt_val.font = .boldSystemFont(ofSize: 16)
        contentView.addSubview(glnt_val)
        
        glnt_price_box.frame = CGRect(x: bounds.width - 72, y: (bounds.height - 41)/2, width: 72, height: 41)
        glnt_price_box.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.29, alpha: 1)
        glnt_price_box.layer.cornerRadius = 17.5
        contentView.addSubview(glnt_price_box)
        
        glnt_price_lab.frame = glnt_price_box.bounds
        glnt_price_lab.textAlignment = .center
        glnt_price_lab.textColor = .white
        glnt_price_lab.font = .systemFont(ofSize: 14, weight: .semibold)
        glnt_price_box.addSubview(glnt_price_lab)
    }
    
    required init?(coder: NSCoder) { fatalError() }

    func GLNTRKNA_UpdateUI(amount: String, cost: String, isActive: Bool) {
        glnt_val.text = amount
        glnt_price_lab.text = cost
        if isActive {
            glnt_bg.layer.borderColor = UIColor(red: 0.9, green: 0.6, blue: 0.9, alpha: 1).cgColor
            glnt_price_box.backgroundColor = UIColor(red: 0.87, green: 0.46, blue: 0.98, alpha: 1)
        } else {
            glnt_bg.layer.borderColor = UIColor.clear.cgColor
            glnt_price_box.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.29, alpha: 1)
        }
    }
    
   
}
