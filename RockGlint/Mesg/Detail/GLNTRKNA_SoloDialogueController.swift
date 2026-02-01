import UIKit
struct GLNTRKNA_ConvergeModel {
    let userModel:GLNTRKNA_MomentEntry
    var convert:[GLNTRKNA_MsgPacket]
    
}

struct GLNTRKNA_MsgPacket {
    let gln_txt: String
    let gln_isSelf: Bool
    let gln_time:String
}
class GLNTRKNA_SoloDialogueController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // GLNTRKNA: External Data Injection
    var GLNTRKNA_ContextCarrier: GLNTRKNA_ConvergeModel
    init(GLNTRKNA_ContextCarrier: GLNTRKNA_ConvergeModel) {
        self.GLNTRKNA_ContextCarrier = GLNTRKNA_ContextCarrier
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private let GLNTRKNA_ChatVault = UITableView()
    private let GLNTRKNA_EntryPlate = UIView()
    private let GLNTRKNA_WriteField = UITextField()
    private let GLNTRKNA_RelayBtn = UIButton()
    
    private let GLNTRKNA_RatioW = UIScreen.main.bounds.width / 393.0
    private let GLNTRKNA_RatioH = UIScreen.main.bounds.height / 852.0

    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_ConstructCanvas()
        GLNTRKNA_HydrateDialogue()
    }
    
    private func GLNTRKNA_ConstructCanvas() {
        view.backgroundColor = UIColor(red: 0.05, green: 0.04, blue: 0.16, alpha: 1.0)
        
        // GLNTRKNA: Custom Top Bar
        let gln_top_nav = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 110 * GLNTRKNA_RatioH))
        view.addSubview(gln_top_nav)
        
        let gln_exit = UIButton(frame: CGRect(x: 15, y: 60 * GLNTRKNA_RatioH, width: 40, height: 40))
        gln_exit.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        gln_exit.tintColor = .white
        gln_exit.addTarget(self, action: #selector(GLNTRKNA_PopView), for: .touchUpInside)
        gln_top_nav.addSubview(gln_exit)
        
        let gln_partner_lbl = UILabel(frame: CGRect(x: 80, y: 60 * GLNTRKNA_RatioH, width: view.bounds.width - 160, height: 40))
        gln_partner_lbl.text = GLNTRKNA_ContextCarrier.userModel.glnt_userName
        gln_partner_lbl.textColor = .white
        gln_partner_lbl.textAlignment = .center
        gln_partner_lbl.font = .boldSystemFont(ofSize: 18)
        gln_top_nav.addSubview(gln_partner_lbl)
        
        let gln_options = UIButton(frame: CGRect(x: view.bounds.width - 55, y: 60 * GLNTRKNA_RatioH, width: 40, height: 40))
        gln_options.isUserInteractionEnabled = true
        gln_options.setImage(UIImage(named: "gln_report"), for: .normal)
        gln_options.addTarget(self, action: #selector(gln_reportTraiiler), for: .touchUpInside)
        gln_top_nav.addSubview(gln_options)
        
        // GLNTRKNA: Message List
        GLNTRKNA_ChatVault.frame = CGRect(x: 0, y: 110 * GLNTRKNA_RatioH, width: view.bounds.width, height: view.bounds.height - (210 * GLNTRKNA_RatioH))
        GLNTRKNA_ChatVault.backgroundColor = .clear
        GLNTRKNA_ChatVault.separatorStyle = .none
        GLNTRKNA_ChatVault.dataSource = self
        GLNTRKNA_ChatVault.delegate = self
        GLNTRKNA_ChatVault.register(GLNTRKNA_DialogueBubbleCell.self, forCellReuseIdentifier: "GLNTRKNA_Bubble")
        view.addSubview(GLNTRKNA_ChatVault)
        
        // GLNTRKNA: Input Area
        GLNTRKNA_EntryPlate.frame = CGRect(x: 0, y: view.bounds.height - (100 * GLNTRKNA_RatioH), width: view.bounds.width, height: 100 * GLNTRKNA_RatioH)
        GLNTRKNA_EntryPlate.backgroundColor = UIColor(white: 1, alpha: 0.02)
        view.addSubview(GLNTRKNA_EntryPlate)
        
        let gln_cam = UIButton(frame: CGRect(x: 15, y: 15 * GLNTRKNA_RatioH, width: 45, height: 45))
        gln_cam.backgroundColor = UIColor(white: 1, alpha: 0.1)
        gln_cam.layer.cornerRadius = 22.5
        gln_cam.setImage(UIImage(systemName: "video.fill"), for: .normal)
        gln_cam.tintColor = .cyan
        gln_cam.addTarget(self, action: #selector(gln_avioTraiiler), for: .touchUpInside)
        
        GLNTRKNA_EntryPlate.addSubview(gln_cam)
        
        GLNTRKNA_WriteField.frame = CGRect(x: 75, y: 15 * GLNTRKNA_RatioH, width: view.bounds.width - 150, height: 45)
        GLNTRKNA_WriteField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        GLNTRKNA_WriteField.layer.cornerRadius = 22.5
        GLNTRKNA_WriteField.textColor = .white
        GLNTRKNA_WriteField.font = .systemFont(ofSize: 15)
        GLNTRKNA_WriteField.placeholder = "Say something..."
        GLNTRKNA_WriteField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 1))
        GLNTRKNA_WriteField.leftViewMode = .always
        GLNTRKNA_EntryPlate.addSubview(GLNTRKNA_WriteField)
        
        GLNTRKNA_RelayBtn.frame = CGRect(x: view.bounds.width - 60, y: 15 * GLNTRKNA_RatioH, width: 45, height: 45)
        GLNTRKNA_RelayBtn.backgroundColor = .systemPink
        GLNTRKNA_RelayBtn.layer.cornerRadius = 22.5
        GLNTRKNA_RelayBtn.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        GLNTRKNA_RelayBtn.tintColor = .white
        GLNTRKNA_RelayBtn.addTarget(self, action: #selector(GLNTRKNA_Transmit), for: .touchUpInside)
        GLNTRKNA_EntryPlate.addSubview(GLNTRKNA_RelayBtn)
    }
    
    
    @objc func gln_avioTraiiler()  {
        let safetyvc =  GLNTRKNA_FaceMirrorController.init()
        safetyvc.modalPresentationStyle = .fullScreen
        self.present(safetyvc, animated: true)
     }
    
    //report
   @objc func gln_reportTraiiler()  {
       let safetyvc =  GLNTRKNA_SafetyHubController.init(GLNTRKNA_ActiveMode: .GLNTRKNA_PrimarySelection)
       self.present(safetyvc, animated: true)
    }
    private func GLNTRKNA_HydrateDialogue() {
      
        GLNTRKNA_ChatVault.reloadData()
    }
    
    @objc private func GLNTRKNA_Transmit() {
        guard let gln_text = GLNTRKNA_WriteField.text, !gln_text.isEmpty else {
            GLNTRKNA_ToastVisuals(gln_msg: "Please enter your message...")
            return
        }
        
        let gln_new_packet = GLNTRKNA_MsgPacket(gln_txt: gln_text, gln_isSelf: true, gln_time: "09:15 am")
        self.GLNTRKNA_ContextCarrier.convert.append(gln_new_packet)
        
        if let gln_index = GLNTRKNA_CentralAuthority.GLNTRKNA_MesageData.firstIndex(where: {
            $0.userModel.glnt_userId == self.GLNTRKNA_ContextCarrier.userModel.glnt_userId
            
        }) {
            // 更新全局数组中对应位置的消息包数组
            GLNTRKNA_CentralAuthority.GLNTRKNA_MesageData[gln_index].convert = self.GLNTRKNA_ContextCarrier.convert
            
        }
        
        GLNTRKNA_WriteField.text = ""
        GLNTRKNA_ChatVault.reloadData()
        
        let gln_path = IndexPath(row: GLNTRKNA_ContextCarrier.convert.count - 1, section: 0)
        GLNTRKNA_ChatVault.scrollToRow(at: gln_path, at: .bottom, animated: true)
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

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


    @objc private func GLNTRKNA_PopView() {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - TableView Protocols
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GLNTRKNA_ContextCarrier.convert.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gln_cell = tableView.dequeueReusableCell(withIdentifier: "GLNTRKNA_Bubble", for: indexPath) as! GLNTRKNA_DialogueBubbleCell
        gln_cell.GLNTRKNA_Configure(gln_packet: GLNTRKNA_ContextCarrier.convert[indexPath.row])
        return gln_cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let gln_item = GLNTRKNA_ContextCarrier.convert[indexPath.row]
        let gln_width = UIScreen.main.bounds.width * 0.65
        let gln_size = gln_item.gln_txt.boundingRect(with: CGSize(width: gln_width, height: 1000), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: 16)], context: nil)
        return gln_size.height + 60
    }
}

// MARK: - GLNTRKNA Custom Cell
class GLNTRKNA_DialogueBubbleCell: UITableViewCell {
    private let GLNTRKNA_Cloud = UIView()
    private let GLNTRKNA_Prose = UILabel()
    private let GLNTRKNA_Ava = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        GLNTRKNA_Ava.layer.cornerRadius = 20
        GLNTRKNA_Ava.clipsToBounds = true
        GLNTRKNA_Ava.backgroundColor = .gray
        contentView.addSubview(GLNTRKNA_Ava)
        
        GLNTRKNA_Cloud.layer.cornerRadius = 18
        contentView.addSubview(GLNTRKNA_Cloud)
        
        GLNTRKNA_Prose.numberOfLines = 0
        GLNTRKNA_Prose.font = .systemFont(ofSize: 16)
        GLNTRKNA_Cloud.addSubview(GLNTRKNA_Prose)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func GLNTRKNA_Configure(gln_packet: GLNTRKNA_MsgPacket) {
        GLNTRKNA_Prose.text = gln_packet.gln_txt
        let gln_max_w = UIScreen.main.bounds.width * 0.65
        let gln_size = gln_packet.gln_txt.boundingRect(with: CGSize(width: gln_max_w, height: 1000), options: .usesLineFragmentOrigin, attributes: [.font: GLNTRKNA_Prose.font!], context: nil)
        
        let gln_cloud_w = gln_size.width + 30
        let gln_cloud_h = gln_size.height + 25
        
        if gln_packet.gln_isSelf {
            GLNTRKNA_Ava.frame = CGRect(x: UIScreen.main.bounds.width - 55, y: 10, width: 40, height: 40)
            GLNTRKNA_Cloud.frame = CGRect(x: UIScreen.main.bounds.width - gln_cloud_w - 65, y: 10, width: gln_cloud_w, height: gln_cloud_h)
            GLNTRKNA_Cloud.backgroundColor = UIColor(red: 0.96, green: 0.64, blue: 0.82, alpha: 1.0)
            GLNTRKNA_Prose.textColor = .white
        } else {
            GLNTRKNA_Ava.frame = CGRect(x: 15, y: 10, width: 40, height: 40)
            GLNTRKNA_Cloud.frame = CGRect(x: 65, y: 10, width: gln_cloud_w, height: gln_cloud_h)
            GLNTRKNA_Cloud.backgroundColor = .white
            GLNTRKNA_Prose.textColor = .black
        }
        
        GLNTRKNA_Prose.frame = CGRect(x: 15, y: 12.5, width: gln_size.width, height: gln_size.height)
    }
}
