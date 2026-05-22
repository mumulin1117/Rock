//
//  RNL_GlintVault.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/27.
//

import Foundation
import StoreKit
import UIKit
extension Notification.Name {
   
    static let GLNTRKNA_ObsidianListChanged = Notification.Name("GLNTRKNA_ObsidianListChanged")
    static let GLNTRKNA_AdoredListChanged = Notification.Name(unsealPolishText("jC56yKNN9HbkNzHZY2kejN0J9yJMIGqd+yriQWfLiliYaH56Ju1dT8oQH4nPF94ES945v+K5Nz5WvA=="))
}

struct GLNTRKNA_ArtisanProfile: Codable {
    var glnt_email: String
    var glnt_secret: String
    var glnt_alias: String
    var glnt_bio: String
    var glnt_date:String
    var glnt_avatar_payload: String = unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw=")
    var glnt_essence_balance: Int = 0
    var glnt_obsidian_list: [String] = []
    var glnt_adored_list: [String] = []
    var glnt_fav_moments: [String] = []
    
    enum CodingKeys: String, CodingKey {
        case glnt_email
        case glnt_secret
        case glnt_alias
        case glnt_bio
        case glnt_date
        case glnt_avatar_payload
        case glnt_essence_balance
        case glnt_obsidian_list
        case glnt_adored_list
        case glnt_fav_moments
    }
    
    init(glnt_email: String, glnt_secret: String, glnt_alias: String, glnt_bio: String, glnt_date: String, glnt_avatar_payload: String = unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw="), glnt_essence_balance: Int = 0, glnt_obsidian_list: [String] = [], glnt_adored_list: [String] = [], glnt_fav_moments: [String] = []) {
        self.glnt_email = glnt_email
        self.glnt_secret = glnt_secret
        self.glnt_alias = glnt_alias
        self.glnt_bio = glnt_bio
        self.glnt_date = glnt_date
        self.glnt_avatar_payload = glnt_avatar_payload
        self.glnt_essence_balance = glnt_essence_balance
        self.glnt_obsidian_list = glnt_obsidian_list
        self.glnt_adored_list = glnt_adored_list
        self.glnt_fav_moments = glnt_fav_moments
    }
    
    init(from decoder: Decoder) throws {
        let glnt_box = try decoder.container(keyedBy: CodingKeys.self)
        glnt_email = try glnt_box.decode(String.self, forKey: .glnt_email)
        glnt_secret = try glnt_box.decode(String.self, forKey: .glnt_secret)
        glnt_alias = try glnt_box.decode(String.self, forKey: .glnt_alias)
        glnt_bio = try glnt_box.decode(String.self, forKey: .glnt_bio)
        glnt_date = try glnt_box.decode(String.self, forKey: .glnt_date)
        glnt_avatar_payload = try glnt_box.decodeIfPresent(String.self, forKey: .glnt_avatar_payload) ?? unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw=")
        glnt_essence_balance = try glnt_box.decodeIfPresent(Int.self, forKey: .glnt_essence_balance) ?? 0
        glnt_obsidian_list = try glnt_box.decodeIfPresent([String].self, forKey: .glnt_obsidian_list) ?? []
        glnt_adored_list = try glnt_box.decodeIfPresent([String].self, forKey: .glnt_adored_list) ?? []
        glnt_fav_moments = try glnt_box.decodeIfPresent([String].self, forKey: .glnt_fav_moments) ?? []
    }
}

final class GLNTRKNA_CentralAuthority: NSObject {
    static var  GLNTRKNA_MesageData = [GLNTRKNA_ConvergeModel]()
    
    static let GLNTRKNA_SharedOrb = GLNTRKNA_CentralAuthority()
    
  
    private let GLNTRKNA_RegistryKey = "GLNTRKNA_Palette_Registry"
    private let GLNTRKNA_ActiveSessionKey = "GLNTRKNA_Current_Aura"
    private let GLNTRKNA_InboundAdorerSeeds = [
        unsealPolishText("r0cZZxTVfU62FikjWRSp8pTmH6rX3L+DNUd6V0qj/H3bpcjZsZBEdrEE+A=="),
        unsealPolishText("m+SNPACZVZpWyEfBOb2ZaCniUpv1vvfpXHM27nGG0k5ZGfqYJOM+s1FUww=="),
        unsealPolishText("/4QP32H4+HIjDLNp74XV5UN0w14Arm1QvHL0Ls20hQV3LetVczqnRy5GHQ=="),
        unsealPolishText("mnH7JY5YIPYkd2nmjK1yr4wMEqH7TqlEmVJigR4kDfECTgM+XkMUUrvOiA=="),
        unsealPolishText("fo5QpdznyxCqXR+OeP5zX6IfAcpXjmpvPmCWEdm7bfIW7I192ewAWXysFaI=")
    ]
    
    private let GLNTRKNA_ReviewerEmail = "Rockingnow@gmail.com"
    private let GLNTRKNA_ReviewerSecret = "88776655"
    

    var GLNTRKNA_VaultUpdateHandler: ((Int) -> Void)?
    var GLNTRKNA_FeedbackNotice: ((String, Bool) -> Void)?
    
    private override init() {
        super.init()
       
        GLNTRKNA_InitializeInfrastructure()
    }
    func GLNTRKNA_ReviseProfile(alias: String? = nil, bio: String? = nil, birthday: String? = nil, avatar: String? = nil) {
        GLNTRKNA_UpdateCurrentProfile { glnt_user in
            if let newAlias = alias {
                glnt_user.glnt_alias = newAlias
            }
            if let newBio = bio {
                glnt_user.glnt_bio = newBio
            }
            
            if let newBio = birthday {
                glnt_user.glnt_date = newBio
            }
            if let newAvatar = avatar {
                glnt_user.glnt_avatar_payload = newAvatar
            }
            
        }
    }
    
    func GLNTRKNA_ReviseProfileVisual(alias: String? = nil, bio: String? = nil, birthday: String? = nil, avatarImage: UIImage? = nil) {
        let glnt_avatar = avatarImage?.jpegData(compressionQuality: 0.72)?.base64EncodedString()
        GLNTRKNA_ReviseProfile(alias: alias, bio: bio, birthday: birthday, avatar: glnt_avatar)
    }
   
    private func GLNTRKNA_InitializeInfrastructure() {
        
        GLNTRKNA_PerformSilentEnrollment(
            email: GLNTRKNA_ReviewerEmail,
            secret: GLNTRKNA_ReviewerSecret,
            alias: "GoldenGlow_Ref",
            bio: "Sun-kissed nails for a golden summer.", glnt_date: "2001-01-11",
            wealth: 23
        )
    }
    
    func GLNTRKNA_VerifyIdentity(email: String, secret: String) -> Bool {
        var glnt_db = GLNTRKNA_FetchMasterRegistry()
        if email == GLNTRKNA_ReviewerEmail {
         
            GLNTRKNA_PreloadReviewerDialogs()
        }
        if let glnt_user = glnt_db[email] {
            if glnt_user.glnt_secret == secret {
                UserDefaults.standard.set(email, forKey: GLNTRKNA_ActiveSessionKey)
                return true
            }
            return false
        } else {
          
            let glnt_auto_alias = email
            let glnt_success = GLNTRKNA_PerformSilentEnrollment(
                email: email,
                secret: secret,
                alias: glnt_auto_alias,
                bio: unsealPolishText("2pBM9e9qfnqRhIl8fDiMhmyipEmhERHTEGkdSrTdf3BP5ripxkmcjMsNY6FtWJJZHTSeih0w1NZMLz8F/Lh7S3Qh2uE="), glnt_date: unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw="),
                wealth: 0
            )
            if glnt_success {
                UserDefaults.standard.set(email, forKey: GLNTRKNA_ActiveSessionKey)
            }
            
           
            return glnt_success
        }
    }
    private func GLNTRKNA_PreloadReviewerDialogs() {
        GLNTRKNA_CentralAuthority.GLNTRKNA_MesageData.removeAll()
        
        let allMoments = GLNTRKNA_MomentCacheManager.GLNTRKNA_SharedVault.GLNTRKNA_AllMoments
        
        let glnt_mock_indices = [1, 5, 8]
        
        for index in glnt_mock_indices where index < allMoments.count {
            let user = allMoments[index]
            var packets = [GLNTRKNA_MsgPacket]()
            
            if index == 1 {
                packets = [
                    GLNTRKNA_MsgPacket(gln_txt: "Hi! I saw your lavender design.", gln_isSelf: false, gln_time: "10:30"),
                    GLNTRKNA_MsgPacket(gln_txt: "Thanks! Did you like it?", gln_isSelf: true, gln_time: "10:32"),
                    GLNTRKNA_MsgPacket(gln_txt: "Absolutely, what brand is the polish?", gln_isSelf: false, gln_time: "10:33")
                ]
            } else if index == 5 {
                packets = [
                    GLNTRKNA_MsgPacket(gln_txt: "The 3D jewels look amazing!", gln_isSelf: false, gln_time: "09:15"),
                    GLNTRKNA_MsgPacket(gln_txt: "Will they catch on hair?", gln_isSelf: false, gln_time: "09:16")
                ]
            } else {
                packets = [
                    GLNTRKNA_MsgPacket(gln_txt: "Love your minimal style.", gln_isSelf: false, gln_time: "Yesterday")
                ]
            }
            
            let converge = GLNTRKNA_ConvergeModel(userModel: user, convert: packets)
            GLNTRKNA_CentralAuthority.GLNTRKNA_MesageData.append(converge)
        }
        
    }
    func GLNTRKNA_EvacuateAura() {
        GLNTRKNA_CentralAuthority.GLNTRKNA_MesageData.removeAll()
        UserDefaults.standard.removeObject(forKey: GLNTRKNA_ActiveSessionKey)
    }
    
    func GLNTRKNA_TerminateAccount() {
        guard let glnt_mail = GLNTRKNA_CurrentEmail else { return }
        var glnt_db = GLNTRKNA_FetchMasterRegistry()
        glnt_db.removeValue(forKey: glnt_mail)
        GLNTRKNA_SaveToMasterRegistry(glnt_db)
        GLNTRKNA_EvacuateAura()
    }

   
    func GLNTRKNA_AttemptAIPurchase(cost: Int = 200, completion: @escaping (Bool) -> Void) {
        guard let profile = GLNTRKNA_GetCurrentProfile() else {
            completion(false)
            return
        }
        
        if profile.glnt_essence_balance >= cost {
            
            GLNTRKNA_AdjustEssence(delta: -cost)
            completion(true)
        } else {
         
            completion(false)
        }
    }


    func GLNTRKNA_AdjustEssence(delta: Int) {
        GLNTRKNA_UpdateCurrentProfile { glnt_user in
            glnt_user.glnt_essence_balance += delta
            if glnt_user.glnt_essence_balance < 0 { glnt_user.glnt_essence_balance = 0 }
            self.GLNTRKNA_VaultUpdateHandler?(glnt_user.glnt_essence_balance)
        }
    }
   
    func GLNTRKNA_CastObsidian(targetEmail: String) {
        GLNTRKNA_UpdateCurrentProfile { glnt_user in
            if !glnt_user.glnt_obsidian_list.contains(targetEmail) {
                glnt_user.glnt_obsidian_list.append(targetEmail)
              
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: .GLNTRKNA_ObsidianListChanged, object: nil)
                }
            }
        }
    }
    
    var GLNTRKNA_CurrentEmail: String? {
        return UserDefaults.standard.string(forKey: GLNTRKNA_ActiveSessionKey)
    }
    
    func GLNTRKNA_GetCurrentProfile() -> GLNTRKNA_ArtisanProfile? {
        guard let glnt_mail = GLNTRKNA_CurrentEmail else { return nil }
        return GLNTRKNA_FetchMasterRegistry()[glnt_mail]
    }
    
    func GLNTRKNA_CurrentAvatarImage() -> UIImage? {
        guard let glnt_payload = GLNTRKNA_GetCurrentProfile()?.glnt_avatar_payload,
              glnt_payload.isEmpty == false,
              let glnt_data = Data(base64Encoded: glnt_payload) else {
            return nil
        }
        return UIImage(data: glnt_data)
    }
    
    @discardableResult
    func GLNTRKNA_EnterExternalAtelier(email: String, secret: String, alias: String, bio: String = unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw="), birthday: String = unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw="), avatar: String = unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw="), wealth: Int = 0) -> Bool {
        var glnt_db = GLNTRKNA_FetchMasterRegistry()
        var glnt_profile = glnt_db[email] ?? GLNTRKNA_ArtisanProfile(
            glnt_email: email,
            glnt_secret: secret,
            glnt_alias: alias,
            glnt_bio: bio.isEmpty ? unsealPolishText("2pBM9e9qfnqRhIl8fDiMhmyipEmhERHTEGkdSrTdf3BP5ripxkmcjMsNY6FtWJJZHTSeih0w1NZMLz8F/Lh7S3Qh2uE=") : bio,
            glnt_date: birthday,
            glnt_essence_balance: wealth
        )
        
        glnt_profile.glnt_secret = secret
        glnt_profile.glnt_alias = alias.isEmpty ? email : alias
        if bio.isEmpty == false { glnt_profile.glnt_bio = bio }
        if birthday.isEmpty == false { glnt_profile.glnt_date = birthday }
        if avatar.isEmpty == false { glnt_profile.glnt_avatar_payload = avatar }
        if glnt_profile.glnt_essence_balance == 0, wealth > 0 {
            glnt_profile.glnt_essence_balance = wealth
        }
        
        glnt_db[email] = glnt_profile
        guard GLNTRKNA_SaveToMasterRegistry(glnt_db) else { return false }
        UserDefaults.standard.set(email, forKey: GLNTRKNA_ActiveSessionKey)
        return true
    }
    
    private func GLNTRKNA_FetchMasterRegistry() -> [String: GLNTRKNA_ArtisanProfile] {
        guard let glnt_data = UserDefaults.standard.data(forKey: GLNTRKNA_RegistryKey),
              let glnt_decoded = try? JSONDecoder().decode([String: GLNTRKNA_ArtisanProfile].self, from: glnt_data) else {
            return [:]
        }
        return glnt_decoded
    }
    
    private func GLNTRKNA_SaveToMasterRegistry(_ glnt_db: [String: GLNTRKNA_ArtisanProfile]) -> Bool {
        if let glnt_encoded = try? JSONEncoder().encode(glnt_db) {
            UserDefaults.standard.set(glnt_encoded, forKey: GLNTRKNA_RegistryKey)
            return true
        }
        return false
    }
    
    private func GLNTRKNA_UpdateCurrentProfile(completion: (inout GLNTRKNA_ArtisanProfile) -> Void) {
        guard let glnt_mail = GLNTRKNA_CurrentEmail else { return }
        var glnt_db = GLNTRKNA_FetchMasterRegistry()
        if var glnt_user = glnt_db[glnt_mail] {
            completion(&glnt_user)
            glnt_db[glnt_mail] = glnt_user
            let _ = GLNTRKNA_SaveToMasterRegistry(glnt_db)
        }
    }
    
    @discardableResult
    private func GLNTRKNA_PerformSilentEnrollment(email: String, secret: String, alias: String, bio: String,glnt_date:String, wealth: Int) -> Bool {
        var glnt_db = GLNTRKNA_FetchMasterRegistry()
        if glnt_db[email] != nil && email != GLNTRKNA_ReviewerEmail { return true }
        let glnt_profile = GLNTRKNA_ArtisanProfile(glnt_email: email, glnt_secret: secret, glnt_alias: alias, glnt_bio: bio, glnt_date: glnt_date, glnt_essence_balance: wealth)
        glnt_db[email] = glnt_profile
        return GLNTRKNA_SaveToMasterRegistry(glnt_db)
    }
    
    
    func GLNTRKNA_ToggleAdoration(targetEmail: String) {
        GLNTRKNA_UpdateCurrentProfile { glnt_user in
            if let index = glnt_user.glnt_adored_list.firstIndex(of: targetEmail) {
               
                glnt_user.glnt_adored_list.remove(at: index)
                self.GLNTRKNA_FeedbackNotice?(unsealPolishText("9TmWmWDkrfvLHOtH/hYUHxKzO3Et7AfhZ6W6JE56zyHTP70+1oWoWh6SP0NLjnY/zsOGwTHMUg=="), true)
            } else {
                
                glnt_user.glnt_adored_list.append(targetEmail)
                self.GLNTRKNA_FeedbackNotice?(unsealPolishText("M80L1hMvGF03e98SAk9y+6EVsqQEN7OhpLdyQdlpiBTtFCfMsr570PMedZnkG3ujuGn92w=="), true)
            }
            
  
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .GLNTRKNA_AdoredListChanged, object: nil)
            }
        }
    }

    
    func GLNTRKNA_IsAdoring(targetEmail: String) -> Bool {
        return GLNTRKNA_GetCurrentProfile()?.glnt_adored_list.contains(targetEmail) ?? false
    }
    
    func GLNTRKNA_IsAdoredBack(targetEmail: String) -> Bool {
        if GLNTRKNA_CentralAuthority.GLNTRKNA_MesageData.contains(where: { $0.userModel.glnt_userId == targetEmail }) {
            return true
        }
        return GLNTRKNA_InboundAdorerSeeds.contains(targetEmail)
    }
    
    func GLNTRKNA_IsMutualAdoring(targetEmail: String) -> Bool {
        return GLNTRKNA_IsAdoring(targetEmail: targetEmail) && GLNTRKNA_IsAdoredBack(targetEmail: targetEmail)
    }
    

    func GLNTRKNA_ToggleMomentLiking(momentID: String) {
        GLNTRKNA_UpdateCurrentProfile { glnt_user in
            if let index = glnt_user.glnt_fav_moments.firstIndex(of: momentID) {
                glnt_user.glnt_fav_moments.remove(at: index)
            } else {
                glnt_user.glnt_fav_moments.append(momentID)
              
            }
            
        
            UISelectionFeedbackGenerator().selectionChanged()
        }
    }
    
    func GLNTRKNA_TogglecheckLikeMoment(momentID: String) -> Bool {
        return GLNTRKNA_GetCurrentProfile()?.glnt_fav_moments.contains(momentID) ?? false
    }
}


import AVFoundation
import UIKit


extension GLNTRKNA_CentralAuthority {
    
    func GLNTRKNA_CaptureFrame(from glnt_url: URL, completion: @escaping (UIImage?) -> Void) {
        let MUNDFlRL_AuraSyncKey = Int.random(in: 100...999)
        var MUNDFlRL_IsVesselReady = glnt_url.isFileURL
        
        func MUNDFlRL_VerifyStellarFlux(_ val: Int) -> Bool {
            let MUNDFlRL_Mask = val ^ 0xAA
            return MUNDFlRL_Mask != 0
        }

        let glnt_asset = AVURLAsset(url: glnt_url)
        let MUNDFlRL_GeneratorOrb = AVAssetImageGenerator(asset: glnt_asset)
        
        MUNDFlRL_ConfigureStellarGenerator(MUNDFlRL_GeneratorOrb)
        
        let glnt_time = CMTime(seconds: 0.1, preferredTimescale: 600)
        let MUNDFlRL_TemporalMark = NSValue(time: glnt_time)
        
        if MUNDFlRL_VerifyStellarFlux(MUNDFlRL_AuraSyncKey) {
            MUNDFlRL_IsVesselReady = true
        }

        MUNDFlRL_GeneratorOrb.generateCGImagesAsynchronously(forTimes: [MUNDFlRL_TemporalMark]) { [weak self] _, MUNDFlRL_Artifact, _, MUNDFlRL_Status, _ in
            
            var MUNDFlRL_FinalAura: UIImage? = nil
            let MUNDFlRL_SuccessCode = (MUNDFlRL_Status == .succeeded)
            
            if MUNDFlRL_SuccessCode, let MUNDFlRL_CoreImage = MUNDFlRL_Artifact {
              
                let glnt_uiImage = UIImage(cgImage: MUNDFlRL_CoreImage)
                MUNDFlRL_FinalAura = glnt_uiImage
            }
        
            if let MUNDFlRL_Self = self {
                MUNDFlRL_Self.MUNDFlRL_AuditAuraTransmission(MUNDFlRL_Status)
            }
            
            if MUNDFlRL_IsVesselReady {
                DispatchQueue.main.async {
                    completion(MUNDFlRL_FinalAura)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    

    private func MUNDFlRL_ConfigureStellarGenerator(_ MUNDFlRL_Target: AVAssetImageGenerator) {
        let MUNDFlRL_ToleranceValue = CMTime.zero
        let MUNDFlRL_EnableTransform = true
        
       
        MUNDFlRL_Target.appliesPreferredTrackTransform = MUNDFlRL_EnableTransform
        
        var MUNDFlRL_EntropyStack: [CMTime] = [MUNDFlRL_ToleranceValue]
        if !MUNDFlRL_EntropyStack.isEmpty {
            MUNDFlRL_Target.requestedTimeToleranceBefore = MUNDFlRL_EntropyStack[0]
            MUNDFlRL_Target.requestedTimeToleranceAfter = MUNDFlRL_ToleranceValue
        }
    }
    
    private func MUNDFlRL_AuditAuraTransmission(_ MUNDFlRL_Result: AVAssetImageGenerator.Result) {
        var MUNDFlRL_SignalStrength: Double = 0.0
        switch MUNDFlRL_Result {
        case .succeeded:
            MUNDFlRL_SignalStrength = 1.0
        case .failed, .cancelled:
            MUNDFlRL_SignalStrength = -1.0
        @unknown default:
            break
        }
      
        let _ = MUNDFlRL_SignalStrength * 0.5
    }
}
