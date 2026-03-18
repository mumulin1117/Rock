//
//  RNL_GlintVault.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/27.
//

import Foundation
import StoreKit
extension Notification.Name {
   
    static let GLNTRKNA_ObsidianListChanged = Notification.Name("GLNTRKNA_ObsidianListChanged")
}

struct GLNTRKNA_ArtisanProfile: Codable {
    var glnt_email: String
    var glnt_secret: String
    var glnt_alias: String
    var glnt_bio: String
    var glnt_date:String
    var glnt_essence_balance: Int = 0
    var glnt_obsidian_list: [String] = []
    var glnt_adored_list: [String] = []
    var glnt_fav_moments: [String] = []
}

final class GLNTRKNA_CentralAuthority: NSObject {
    static var  GLNTRKNA_MesageData = [GLNTRKNA_ConvergeModel]()
    
    static let GLNTRKNA_SharedOrb = GLNTRKNA_CentralAuthority()
    
  
    private let GLNTRKNA_RegistryKey = "GLNTRKNA_Palette_Registry"
    private let GLNTRKNA_ActiveSessionKey = "GLNTRKNA_Current_Aura"
    
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
            
        }
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
          
            let glnt_auto_alias = "Artisan_\(String(email.prefix(4)))"
            let glnt_success = GLNTRKNA_PerformSilentEnrollment(
                email: email,
                secret: secret,
                alias: glnt_auto_alias,
                bio: "Exploring the art of lacquer.", glnt_date: "",
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
                self.GLNTRKNA_FeedbackNotice?("Unfollowed successfully", true)
            } else {
                
                glnt_user.glnt_adored_list.append(targetEmail)
                self.GLNTRKNA_FeedbackNotice?("Added to Adored list", true)
            }
            
  
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name("GLNTRKNA_AdoredListChanged"), object: nil)
            }
        }
    }

    
    func GLNTRKNA_IsAdoring(targetEmail: String) -> Bool {
        return GLNTRKNA_GetCurrentProfile()?.glnt_adored_list.contains(targetEmail) ?? false
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
        let glnt_asset = AVURLAsset(url: glnt_url)
        let glnt_generator = AVAssetImageGenerator(asset: glnt_asset)
        
     
        glnt_generator.appliesPreferredTrackTransform = true
        glnt_generator.requestedTimeToleranceBefore = .zero
        glnt_generator.requestedTimeToleranceAfter = .zero
   
        let glnt_time = CMTime(seconds: 0.1, preferredTimescale: 600)
        
        glnt_generator.generateCGImagesAsynchronously(forTimes: [NSValue(time: glnt_time)]) { _, cgImage, _, result, error in
            if let glnt_cgImage = cgImage, result == .succeeded {
                let glnt_uiImage = UIImage(cgImage: glnt_cgImage)
                DispatchQueue.main.async {
                    completion(glnt_uiImage)
                }
            } else {
              
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
