import UIKit
import PhotosUI

enum GLNTRKNA_PublishMode {
    case gln_artisan_image
    case gln_artisan_video
    case gln_nail_recreate
}

class GLNTRKNA_CreativeStudioController: UIViewController, PHPickerViewControllerDelegate, UITextViewDelegate {

    private let GLNTRKNA_WorkMode: GLNTRKNA_PublishMode
    private let GLNTRKNA_StageScroll = UIScrollView()
    
    private let GLNTRKNA_MediaGallery = UIView()
    private var GLNTRKNA_SelectedAssets: UIImage?
    private var addPickImgIndex:Int = 100
    
    private var GLNTRKNA_VideoURL: URL?
    
//    private let GLNTRKNA_DraftLabel = UILabel()
    private let GLNTRKNA_ManifestInput = UITextView()
    private let GLNTRKNA_CommitTrigger = UIButton()
    
    init(gln_mode: GLNTRKNA_PublishMode) {
        self.GLNTRKNA_WorkMode = gln_mode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("GLNTRKNA_Init_Error") }

    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_ForgeBaseAesthetics()
        GLNTRKNA_ConstructLayout()
        GLNTRKNA_BindActions()
    }
    
    private func GLNTRKNA_ForgeBaseAesthetics() {
        view.backgroundColor = UIColor(red: 0.02, green: 0.02, blue: 0.1, alpha: 1.0)
        
        switch GLNTRKNA_WorkMode {
        case .gln_artisan_image:
            title = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"ymTTamMsP9sAGbmZRi6v2iRxGdfA2lLVrt6FRRqE9t+0UusAQe3YmExCXlo=")
        case .gln_artisan_video:
            title = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"TDl8EHuitIZrf36eyFNVVLfnO5Rs67p5j5QihLROpf0ZvIL9ba4hhydA5R4x")
        case .gln_nail_recreate:
            title = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"RSNzXNcPV+WAhVPQh2Xjtmtu7l5ZhgUWurVHnNPbVaF1NYbEjquEIC86STuAeMEk")
        
        }
        let gln_text_attr: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = gln_text_attr
        navigationController?.navigationBar.tintColor = .white
        
        GLNTRKNA_StageScroll.frame = view.bounds
        GLNTRKNA_StageScroll.alwaysBounceVertical = true
        view.addSubview(GLNTRKNA_StageScroll)
    }
    
    private func GLNTRKNA_ConstructLayout() {
        let gln_sw = view.frame.width
        let gln_side_pad = GLNTRKNA_ScaleW(20)
        
        if GLNTRKNA_WorkMode == .gln_artisan_image {
            let gln_item_w = (gln_sw - (gln_side_pad * 4)) / 3
            GLNTRKNA_MediaGallery.frame = CGRect(x: 0, y: GLNTRKNA_ScaleH(30), width: gln_sw, height: gln_item_w)
            for i in 0..<3 {
                let gln_slot = GLNTRKNA_CreateAssetSlot(index: i, size: gln_item_w, pad: gln_side_pad)
                GLNTRKNA_MediaGallery.addSubview(gln_slot)
            }
        } else if GLNTRKNA_WorkMode == .gln_artisan_video {
            let gln_video_h = GLNTRKNA_ScaleH(380)
            GLNTRKNA_MediaGallery.frame = CGRect(x: gln_side_pad, y: GLNTRKNA_ScaleH(30), width: gln_sw - (gln_side_pad * 2), height: gln_video_h)
            GLNTRKNA_MediaGallery.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
            GLNTRKNA_MediaGallery.layer.cornerRadius = 15
            
            let gln_plus = UIImageView(image: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_addplus"))
            gln_plus.tintColor = UIColor(white: 1.0, alpha: 0.3)
            gln_plus.frame = CGRect(x: (GLNTRKNA_MediaGallery.frame.width - 60)/2, y: (gln_video_h - 60)/2, width: 60, height: 60)
            GLNTRKNA_MediaGallery.addSubview(gln_plus)
            
            let gln_tap = UITapGestureRecognizer(target: self, action: #selector(GLNTRKNA_TriggerVideoPicker))
            GLNTRKNA_MediaGallery.addGestureRecognizer(gln_tap)
            GLNTRKNA_MediaGallery.isUserInteractionEnabled = true
        }else{
            let gln_video_h = GLNTRKNA_ScaleH(533)
            GLNTRKNA_MediaGallery.frame = CGRect(x: gln_side_pad, y: GLNTRKNA_ScaleH(30), width: gln_sw - (15 * 2), height: gln_video_h)
            
            let ganartbutton = UIButton.init(frame: GLNTRKNA_MediaGallery.bounds)
            ganartbutton.setBackgroundImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "normailADSsimg"), for: .normal)
            ganartbutton.tag = 1999
            ganartbutton.addTarget(self, action: #selector(GLNTRKNA_TriggerComment), for: .touchUpInside)
            GLNTRKNA_MediaGallery.addSubview(ganartbutton)
           
        }
        GLNTRKNA_StageScroll.addSubview(GLNTRKNA_MediaGallery)
        
        let gln_form_y = GLNTRKNA_MediaGallery.frame.maxY + GLNTRKNA_ScaleH(40)
        let GLNTRKNA_imag = UIImageView(image: GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "GLNTRKNA_imag"))
        GLNTRKNA_imag.frame = CGRect(x: gln_side_pad, y: gln_form_y, width: 111, height:(GLNTRKNA_WorkMode == .gln_nail_recreate) ? 0 : 24)
        GLNTRKNA_imag.isHidden = (GLNTRKNA_WorkMode == .gln_nail_recreate)
       
//        GLNTRKNA_DraftLabel.text = "Copywriting"
//        GLNTRKNA_DraftLabel.textColor = .white
//        GLNTRKNA_DraftLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 22)
//        GLNTRKNA_DraftLabel.frame = CGRect(x: gln_side_pad, y: gln_form_y, width: 200, height: 30)
        GLNTRKNA_StageScroll.addSubview(GLNTRKNA_imag)
        GLNTRKNA_ManifestInput.isHidden = (GLNTRKNA_WorkMode == .gln_nail_recreate)
        GLNTRKNA_ManifestInput.frame = CGRect(x: gln_side_pad, y: gln_form_y + 40, width: gln_sw - (gln_side_pad * 2), height: GLNTRKNA_ScaleH((GLNTRKNA_WorkMode == .gln_nail_recreate) ?  0  : 280))
        GLNTRKNA_ManifestInput.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
        GLNTRKNA_ManifestInput.layer.cornerRadius = 15
        GLNTRKNA_ManifestInput.textColor = .white
        GLNTRKNA_ManifestInput.font = .systemFont(ofSize: 16)
        GLNTRKNA_ManifestInput.text = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"hp75aMynXCK2iovDFa05xs9GC3S7qqapTEUeTjonZfuIRCVOJ1cH+dD0ESJRbVARvc6rgGikAUNBO9to8GaDmPKrL2ByvBZnUhHbwYQfOYJby2x4kySJabazIp5y4Q==")
        GLNTRKNA_ManifestInput.delegate = self
        GLNTRKNA_StageScroll.addSubview(GLNTRKNA_ManifestInput)
        
        GLNTRKNA_CommitTrigger.frame = CGRect(x: gln_side_pad, y: view.frame.height - GLNTRKNA_ScaleH(140), width: gln_sw - (gln_side_pad * 2), height: GLNTRKNA_ScaleH(60))
        GLNTRKNA_CommitTrigger.backgroundColor = UIColor.systemPurple
        
        switch GLNTRKNA_WorkMode {
        case .gln_artisan_image:
            GLNTRKNA_CommitTrigger.setTitle(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"PHQV8knjcKQgwqzEDehl0z0NoKq0Mnzdj/0sUANjALLzNrxh") , for: .normal)
        case .gln_artisan_video:
            GLNTRKNA_CommitTrigger.setTitle(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"z1WSWXUsiN72xzkZqw+9UCifiDV026MNrxip7kALGEbDgNUWFPuF"), for: .normal)
        case .gln_nail_recreate:
            GLNTRKNA_CommitTrigger.setTitle(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"lKPsABZD6WooKSE3t2k6RWcLA4duUJjU9uv6GVepWrwRxd/nmUvX"), for: .normal)
        
        }
        
        GLNTRKNA_CommitTrigger.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        GLNTRKNA_CommitTrigger.layer.cornerRadius = GLNTRKNA_CommitTrigger.frame.height / 2
        view.addSubview(GLNTRKNA_CommitTrigger)
    }
    
    private func GLNTRKNA_CreateAssetSlot(index: Int, size: CGFloat, pad: CGFloat) -> UIButton {
        let gln_btn = UIButton(frame: CGRect(x: pad + CGFloat(index) * (size + pad), y: 0, width: size, height: size))
        gln_btn.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        gln_btn.layer.cornerRadius = 12
        gln_btn.setImage(GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: "gln_addplus"), for: .normal)
        gln_btn.tintColor = .gray
        gln_btn.tag = 100 + index
        gln_btn.addTarget(self, action: #selector(GLNTRKNA_TriggerPicker(index:)), for: .touchUpInside)
        return gln_btn
    }
    
    private func GLNTRKNA_BindActions() {
        GLNTRKNA_CommitTrigger.addTarget(self, action: #selector(GLNTRKNA_ExecuteUpload), for: .touchUpInside)
        let gln_hide = UITapGestureRecognizer(target: self, action: #selector(GLNTRKNA_CollapseInput))
        view.addGestureRecognizer(gln_hide)
    }
    
    
    @objc private func GLNTRKNA_TriggerComment() {
        var gln_config = PHPickerConfiguration()
        gln_config.filter =  .images
        gln_config.selectionLimit =  1
        self.addPickImgIndex = 1999
        let gln_picker = PHPickerViewController(configuration: gln_config)
        gln_picker.delegate = self
        present(gln_picker, animated: true)
    }
    
    
    @objc private func GLNTRKNA_TriggerPicker(index:UIButton) {
        var gln_config = PHPickerConfiguration()
        gln_config.filter = (GLNTRKNA_WorkMode == .gln_artisan_image) ? .images : .videos
        gln_config.selectionLimit = (GLNTRKNA_WorkMode == .gln_artisan_image) ? 3 : 1
        self.addPickImgIndex = index.tag
        let gln_picker = PHPickerViewController(configuration: gln_config)
        gln_picker.delegate = self
        present(gln_picker, animated: true)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let gln_result = results.first else { return }
        let gln_provider = gln_result.itemProvider

        if gln_provider.canLoadObject(ofClass: UIImage.self) {
            // Image logic remains the same...
            gln_provider.loadObject(ofClass: UIImage.self) { [weak self] (gln_image, _) in
                guard let gln_img = gln_image as? UIImage, let self = self else { return }
                DispatchQueue.main.async {
                    self.GLNTRKNA_SelectedAssets = gln_img
                    if let gln_btn = self.GLNTRKNA_MediaGallery.viewWithTag(self.addPickImgIndex) as? UIButton {
                        self.GLNTRKNA_ApplyAesthetic(gln_img, to: gln_btn)
                    }
                }
            }
        } else if gln_provider.hasItemConformingToTypeIdentifier(UTType.movie.identifier) {
            gln_provider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { [weak self] (gln_url, _) in
                guard let gln_path = gln_url, let self = self else { return }
                let gln_thumb = self.GLNTRKNA_CaptureVideoFrame(at: gln_path)
                self.GLNTRKNA_VideoURL = gln_path
                
                DispatchQueue.main.async {
                    // If it's the video gallery (the UIView), we add/update a cover image
                    let gln_cover = UIImageView(frame: self.GLNTRKNA_MediaGallery.bounds)
                    gln_cover.contentMode = .scaleAspectFill
                    gln_cover.clipsToBounds = true
                    gln_cover.image = gln_thumb
                    gln_cover.layer.cornerRadius = 15
                    // Remove the plus icon and previous covers
                    self.GLNTRKNA_MediaGallery.subviews.forEach { $0.removeFromSuperview() }
                    self.GLNTRKNA_MediaGallery.addSubview(gln_cover)
                }
            }
        }
    }
    
    @objc private func GLNTRKNA_ExecuteUpload() {
        if GLNTRKNA_WorkMode == .gln_nail_recreate {
            if GLNTRKNA_SelectedAssets == nil {
                let gln_error = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"PutBzkd6HJ5LcYPR3rCKcFkZrtnKWVmXYtgjFlIMHfIiG6C2y/yM2NWY1J96GE41xvbaQUbcpEMXG5t7ew==")
                GLNTRKNA_PostAlert(gln_msg: gln_error)
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.GLNTRKNA_CommitTrigger.isEnabled = true
                self.GLNTRKNA_CommitTrigger.alpha = 1.0
                
                // Notify user of success before popping
                let gln_success = UIAlertController(title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"mNnggS3CtYoUQ8zjoJB7x3gm671OsHaha3uwvLrtpf0zCn12P2uyC2Q2ng=="), message: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"rG6jrZiLaC2V3XrKxfze1UUVxActfsS1SJA3RiKDjmZuYd3bsDqHpw6RrDVTOtW5J9W9rHJSzPGJznVnB5dn9Oym40msjl7E1IGxILW67cmOUtQiU2LzB6Bp2fRdHIKNPZ6bgFjefpB0vam8FUcp"), preferredStyle: .alert)
                gln_success.addAction(UIAlertAction(title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"nRP1+RoezDGmVkuaIe9Eba1xp+x6UPM+XLCN8+GihXz6VJRHSA=="), style: .default, handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(gln_success, animated: true)
            }
            
            return
        }
        let gln_text = GLNTRKNA_ManifestInput.text.trimmingCharacters(in: .whitespacesAndNewlines)
        let gln_is_placeholder = gln_text.contains(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"t4nzHl8ZMeROOcs8sXJv7F35ZdBYaNCaJkj579LlriEGAGixT0pyTZSVo6FS9sFo7jKcCnY/sg==")) || gln_text.isEmpty
        
        if gln_is_placeholder && GLNTRKNA_WorkMode != .gln_nail_recreate {
            GLNTRKNA_PostAlert(gln_msg: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"yIn+VwIV5w+HizWcpJshqFg9yNFEz3n6RCIcnEesPN8jNjCnGVyHgIWN8nJpg4ooyUotPCS2ZBiQfRS+Ts610go/i5HBIW0="))
            return
        }

        // 2. Validate Media Presence
        var gln_media_ready = false
        
        if GLNTRKNA_WorkMode == .gln_artisan_image {
            // Check if any of the buttons in the gallery have a background image set
            for i in 0..<3 {
                if let gln_btn = GLNTRKNA_MediaGallery.viewWithTag(i + 100) as? UIButton,
                   gln_btn.backgroundImage(for: .normal) != nil {
                    gln_media_ready = true
                    break
                }
            }
        } else {
            // For Video or Recreation, check the single large preview container
            // Assuming we check the background image of the primary trigger button
            if let gln_main_btn = GLNTRKNA_MediaGallery as? UIButton {
                gln_media_ready = gln_main_btn.backgroundImage(for: .normal) != nil
            } else {
                // If AssetPreview is a view, check its subviews for an image
                gln_media_ready = GLNTRKNA_VideoURL != nil
            }
        }

        if !gln_media_ready {
            let gln_error = (GLNTRKNA_WorkMode == .gln_artisan_video) ? GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"FNzbOXJeyKv8MfzBfcqLKGgPcopV9qlZ1XgSEKww9H/xUxsLhorLi4r4N1scd8fAJlJevdwlB+dhyq4=") : GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"hUsvWS5i0bysJRuzDhCStigfKoB8Acm2FTzwdQL6418a+gCh8qptUJ3OIq/jMgfBFv218NOiiAm19g5frAcIlnYbDw==")
            GLNTRKNA_PostAlert(gln_msg: gln_error)
            return
        }

        // 3. Proceed with Rock Cloud Sync
        GLNTRKNA_CommitTrigger.isEnabled = false
        GLNTRKNA_CommitTrigger.alpha = 0.5
        
        // UI Feedback: Show a "Syncing" state
        GLNTRKNA_CommitTrigger.setTitle(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"I8oGaL9j7jhUZpwZwppRwHMD72ZheJAwo+YNNrEWIO0A2Cop7/xG64+8uv04bTsze4Y="), for: .normal)
        
        

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.GLNTRKNA_CommitTrigger.isEnabled = true
            self.GLNTRKNA_CommitTrigger.alpha = 1.0
            
            // Notify user of success before popping
            let gln_success = UIAlertController(title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"wSvdZQmpiNEEr15R5hvr9uzBUStVdbEIVZrOX+BmqbUYk6bB9r1hNgs3Pg=="), message: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"szsSgbRAC8fISdT3Og73Q9Ykzdb0mSPfH6/vH2CgXr714U7mAgVCA4YOixjN95KuKr1g17RFzRDq0U3v+R9GIL56U49ajiU="), preferredStyle: .alert)
            gln_success.addAction(UIAlertAction(title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"+qTJliXx0JFK2PEQ7hOvt4ekaKm1ywxckut1IhVH7pR0upGsKA=="), style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(gln_success, animated: true)
        }
    }
    
    private func GLNTRKNA_PostAlert(gln_msg: String) {
        let gln_alert = UIAlertController(title:GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"cfBoFUI4tIcepNSKwANxWjDRn1Gk8mVdJrhbzcxEeo84ZmEK12QMWZ9nwQ=="), message: gln_msg, preferredStyle: .alert)
        gln_alert.addAction(UIAlertAction(title: GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"HUsE7TH05zcuaJfHZ61/RAkPM/kXy1XanSnJrMJciOV+2TqDuO46yOI="), style: .default))
        present(gln_alert, animated: true)
    }
    
    @objc private func GLNTRKNA_CollapseInput() { view.endEditing(true) }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text.contains(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"BwgRMGnH6VKNTRyyfl7anvebucp/A15YDebuA/pIbbIf81f/hsaf4PBG+r8dwOa1GWNz9Fbe7g==")) { textView.text = "" }
    }
    
    private func GLNTRKNA_ApplyAesthetic(_ gln_img: UIImage?, to gln_btn: UIButton) {
        guard let gln_final_img = gln_img else { return }
        
        // GLNTRKNA: Set as background and remove the 'plus' icon/title
        gln_btn.setBackgroundImage(gln_final_img, for: .normal)
        gln_btn.setImage(nil, for: .normal)
        gln_btn.setTitle("", for: .normal)
        
        // Add a slight border to show it's selected
        gln_btn.layer.borderWidth = 2
        gln_btn.layer.borderColor = UIColor.systemPink.cgColor
        gln_btn.clipsToBounds = true
        gln_btn.imageView?.contentMode = .scaleAspectFill
    }

    private func GLNTRKNA_CaptureVideoFrame(at gln_url: URL) -> UIImage? {
        let gln_asset = AVAsset(url: gln_url)
        let gln_generator = AVAssetImageGenerator(asset: gln_asset)
        gln_generator.appliesPreferredTrackTransform = true
        
        let gln_time = CMTime(seconds: 1, preferredTimescale: 60)
        do {
            let gln_cg_img = try gln_generator.copyCGImage(at: gln_time, actualTime: nil)
            return UIImage(cgImage: gln_cg_img)
        } catch {
            return nil
        }
    }
    
    
    @objc private func GLNTRKNA_TriggerVideoPicker() {
        // In video mode, we don't need a specific button tag,
        // but we set addPickImgIndex to a unique value if needed.
        self.addPickImgIndex = 999
        var gln_config = PHPickerConfiguration()
        gln_config.filter = .videos
        gln_config.selectionLimit = 1
        let gln_picker = PHPickerViewController(configuration: gln_config)
        gln_picker.delegate = self
        present(gln_picker, animated: true)
    }
}
