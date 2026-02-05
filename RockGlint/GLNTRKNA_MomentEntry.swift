//
//  GLNTRKNA_MomentEntry.swift
//  RockGlint
//
//  Created by mumu on 2026/2/1.
//

import Foundation


struct GLNTRKNA_MomentEntry: Codable {
    let glnt_is_video: Bool 
    
    
    let glnt_userId: String
    let glnt_userName: String
    let glnt_signature: String
    
    let GTRKnafancCount: String
    let GTRKnafFollwerCount: String
    
    var momentPics:[String] = []
    var momentreprintPic:String = ""
    var SPPuuuRRll:String  = ""
    
    
    let glnt_content: String
    var glnt_comments: [String] = []
   
    var glntifFollowed:Bool = false
    var glntisHearted:Bool = false

    init(fromDictionary dict: [String: Any]) {
        self.glnt_userId = dict["GTRKnauserIId"] as? String ?? ""
        self.glnt_userName = dict["GTRKnauserNaami"] as? String ?? ""
        self.glnt_signature = dict["GTRKnauserSigture"] as? String ?? ""
        
        self.GTRKnafancCount =  dict["GTRKnafancCount"] as? String ?? ""
        self.GTRKnafFollwerCount =  dict["GTRKnafFollwerCount"] as? String ?? ""
        
        
        if let videoContent = dict["SPPContent"] as? String {
            self.glnt_content = videoContent
            self.glnt_is_video = true
            let commentStr = dict["SPPComments"] as? String ?? ""
            self.glnt_comments = commentStr.components(separatedBy: "()")
            self.SPPuuuRRll = dict["SPPuuuRRll"] as? String ?? ""
        } else {
            self.glnt_content = dict["momentContent"] as? String ?? ""
            self.glnt_is_video = false
            let commentStr = dict["momentComments"] as? String ?? ""
            self.glnt_comments = commentStr.components(separatedBy: "()")
            momentPics = (dict["momentPics"] as? String ?? "").components(separatedBy: "()")
            momentreprintPic = dict["momentreprintPic"] as? String ?? ""
        }
    }
}


final class GLNTRKNA_MomentCacheManager {
    
    static let GLNTRKNA_SharedVault = GLNTRKNA_MomentCacheManager()
    
    
    private(set) var GLNTRKNA_AllMoments: [GLNTRKNA_MomentEntry] = []
    
    private init() {
        GLNTRKNA_LoadLocalArtifacts()
       
    }
    
    private func GLNTRKNA_LoadLocalArtifacts() {
        guard let path = Bundle.main.path(forResource: "RGlinkMoment", ofType: "plist"),
              let rawArray = NSArray(contentsOfFile: path) as? [[String: Any]] else {
           
            return
        }
   
        self.GLNTRKNA_AllMoments = rawArray.map { GLNTRKNA_MomentEntry(fromDictionary: $0) }
    }

    func GLNTRKNA_FetchFilteredStream(isVideo: Bool) -> [GLNTRKNA_MomentEntry] {
      
        let glnt_blacklisted = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_GetCurrentProfile()?.glnt_obsidian_list ?? []
       
        return GLNTRKNA_AllMoments.filter { moment in
            let isNotBlocked = !glnt_blacklisted.contains(moment.glnt_userId)
            return isNotBlocked && (moment.glnt_is_video == isVideo)
        }
    }
    
    func GLNTRKNA_PurgeMemory() {
        GLNTRKNA_AllMoments.removeAll()
        GLNTRKNA_LoadLocalArtifacts()
    }
}
