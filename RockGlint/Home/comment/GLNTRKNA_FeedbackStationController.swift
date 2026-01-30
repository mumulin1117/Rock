//
//  GLNTRKNA_FeedbackStationController.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/29.
//

import UIKit

class GLNTRKNA_FeedbackStationController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let GLNTRKNA_GlassOverlay = UIView()
    private let GLNTRKNA_ContentSheet = UIView()
    private let GLNTRKNA_SignalTable = UITableView()
    private let GLNTRKNA_ClosePortal = UIButton()
    private let GLNTRKNA_Headliner = UILabel()
    
    private var GLNTRKNA_EchoRegistry: [GLNTRKNA_FeedbackEntity] = [
        GLNTRKNA_FeedbackEntity(GLNTRKNA_VoxName: "Joren Veyra", GLNTRKNA_VoxAvatar: "gln_ava_1", GLNTRKNA_VoxProse: "Nails > words!"),
        GLNTRKNA_FeedbackEntity(GLNTRKNA_VoxName: "Cerys Elara", GLNTRKNA_VoxAvatar: "gln_ava_2", GLNTRKNA_VoxProse: "Haha, YES! Who needs words when your nails are this fabulous? 🙌"),
        GLNTRKNA_FeedbackEntity(GLNTRKNA_VoxName: "Galen Jax", GLNTRKNA_VoxAvatar: "gln_ava_3", GLNTRKNA_VoxProse: "I'm here for nails that speak louder than my thoughts")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        GLNTRKNA_SetupEnvironment()
        GLNTRKNA_ConstructArchitecture()
    }

    private func GLNTRKNA_SetupEnvironment() {
        view.backgroundColor = .clear
        GLNTRKNA_GlassOverlay.frame = view.bounds
        GLNTRKNA_GlassOverlay.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.addSubview(GLNTRKNA_GlassOverlay)
        
        let gln_tap = UITapGestureRecognizer(target: self, action: #selector(GLNTRKNA_DismissPortal))
        GLNTRKNA_GlassOverlay.addGestureRecognizer(gln_tap)
    }

    private func GLNTRKNA_ConstructArchitecture() {
        let gln_sw = UIScreen.main.bounds.width
        let gln_sh = UIScreen.main.bounds.height
        let gln_sheet_h = GLNTRKNA_RatioH(520)
        
        GLNTRKNA_ContentSheet.frame = CGRect(x: 0, y: gln_sh, width: gln_sw, height: gln_sheet_h)
        GLNTRKNA_ContentSheet.backgroundColor = UIColor(red: 0.08, green: 0.05, blue: 0.18, alpha: 1.0)
        GLNTRKNA_ContentSheet.layer.cornerRadius = 30
        GLNTRKNA_ContentSheet.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.addSubview(GLNTRKNA_ContentSheet)
        
        GLNTRKNA_Headliner.frame = CGRect(x: 0, y: 25, width: gln_sw, height: 30)
        GLNTRKNA_Headliner.text = "\(GLNTRKNA_EchoRegistry.count) comments"
        GLNTRKNA_Headliner.textColor = .white
        GLNTRKNA_Headliner.font = .boldSystemFont(ofSize: 20)
        GLNTRKNA_Headliner.textAlignment = .center
        GLNTRKNA_ContentSheet.addSubview(GLNTRKNA_Headliner)
        
        GLNTRKNA_ClosePortal.frame = CGRect(x: gln_sw - 50, y: 20, width: 40, height: 40)
        GLNTRKNA_ClosePortal.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        GLNTRKNA_ClosePortal.tintColor = .white.withAlphaComponent(0.6)
        GLNTRKNA_ClosePortal.addTarget(self, action: #selector(GLNTRKNA_DismissPortal), for: .touchUpInside)
        GLNTRKNA_ContentSheet.addSubview(GLNTRKNA_ClosePortal)
        
        GLNTRKNA_SignalTable.frame = CGRect(x: 0, y: 70, width: gln_sw, height: gln_sheet_h - 70)
        GLNTRKNA_SignalTable.backgroundColor = .clear
        GLNTRKNA_SignalTable.separatorStyle = .none
        GLNTRKNA_SignalTable.delegate = self
        GLNTRKNA_SignalTable.dataSource = self
        GLNTRKNA_SignalTable.register(GLNTRKNA_VoxCell.self, forCellReuseIdentifier: "GLNTRKNA_Vox")
        GLNTRKNA_ContentSheet.addSubview(GLNTRKNA_SignalTable)
        
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut) {
            self.GLNTRKNA_ContentSheet.frame.origin.y = gln_sh - gln_sheet_h
        }
    }

    @objc private func GLNTRKNA_DismissPortal() {
        UIView.animate(withDuration: 0.25, animations: {
            self.GLNTRKNA_ContentSheet.frame.origin.y = UIScreen.main.bounds.height
            self.GLNTRKNA_GlassOverlay.alpha = 0
        }) { _ in
            self.dismiss(animated: false)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GLNTRKNA_EchoRegistry.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gln_cell = tableView.dequeueReusableCell(withIdentifier: "GLNTRKNA_Vox", for: indexPath) as! GLNTRKNA_VoxCell
        let gln_data = GLNTRKNA_EchoRegistry[indexPath.row]
        gln_cell.GLNTRKNA_Hydrate(gln_data)
        return gln_cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GLNTRKNA_RatioH(90)
    }

    private func GLNTRKNA_RatioW(_ val: CGFloat) -> CGFloat { return (UIScreen.main.bounds.width / 393.0) * val }
    private func GLNTRKNA_RatioH(_ val: CGFloat) -> CGFloat { return (UIScreen.main.bounds.height / 852.0) * val }
}

class GLNTRKNA_VoxCell: UITableViewCell {
    private let GLNTRKNA_Portrait = UIImageView()
    private let GLNTRKNA_Identity = UILabel()
    private let GLNTRKNA_Prose = UILabel()
    private let GLNTRKNA_Divider = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        
        let gln_w = UIScreen.main.bounds.width
        GLNTRKNA_Portrait.frame = CGRect(x: 20, y: 15, width: 50, height: 50)
        GLNTRKNA_Portrait.layer.cornerRadius = 25
        GLNTRKNA_Portrait.clipsToBounds = true
        GLNTRKNA_Portrait.contentMode = .scaleAspectFill
        contentView.addSubview(GLNTRKNA_Portrait)
        
        GLNTRKNA_Identity.frame = CGRect(x: 85, y: 15, width: gln_w - 100, height: 20)
        GLNTRKNA_Identity.textColor = .systemPurple
        GLNTRKNA_Identity.font = .boldSystemFont(ofSize: 16)
        contentView.addSubview(GLNTRKNA_Identity)
        
        GLNTRKNA_Prose.frame = CGRect(x: 85, y: 40, width: gln_w - 105, height: 40)
        GLNTRKNA_Prose.textColor = .white
        GLNTRKNA_Prose.font = .systemFont(ofSize: 14)
        GLNTRKNA_Prose.numberOfLines = 2
        contentView.addSubview(GLNTRKNA_Prose)
        
        GLNTRKNA_Divider.frame = CGRect(x: 85, y: 89, width: gln_w - 85, height: 1)
        GLNTRKNA_Divider.backgroundColor = UIColor.white.withAlphaComponent(0.05)
        contentView.addSubview(GLNTRKNA_Divider)
    }

    required init?(coder: NSCoder) { fatalError() }

    func GLNTRKNA_Hydrate(_ gln_model: GLNTRKNA_FeedbackEntity) {
        GLNTRKNA_Portrait.image = UIImage(named: gln_model.GLNTRKNA_VoxAvatar)
        GLNTRKNA_Identity.text = gln_model.GLNTRKNA_VoxName
        GLNTRKNA_Prose.text = gln_model.GLNTRKNA_VoxProse
    }
}

struct GLNTRKNA_FeedbackEntity {
    let GLNTRKNA_VoxName: String
    let GLNTRKNA_VoxAvatar: String
    let GLNTRKNA_VoxProse: String
}
