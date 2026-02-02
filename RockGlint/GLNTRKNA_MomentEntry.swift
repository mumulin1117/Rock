//
//  GLNTRKNA_MomentEntry.swift
//  RockGlint
//
//  Created by mumu on 2026/2/1.
//

import Foundation

// 统一的动态模型，兼容图片和视频类型
struct GLNTRKNA_MomentEntry: Codable {
    let glnt_is_video: Bool // 用于区分图片动态和视频动态
    
    
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
    
    // 初始化方法，手动解析从 Plist 读入的原始字典
    init(fromDictionary dict: [String: Any]) {
        self.glnt_userId = dict["GTRKnauserIId"] as? String ?? ""
        self.glnt_userName = dict["GTRKnauserNaami"] as? String ?? ""
        self.glnt_signature = dict["GTRKnauserSigture"] as? String ?? ""
        
        self.GTRKnafancCount =  dict["GTRKnafancCount"] as? String ?? ""
        self.GTRKnafFollwerCount =  dict["GTRKnafFollwerCount"] as? String ?? ""
        
        
        // 区分视频(SPPContent)和图片(momentContent)字段
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
    
    
    // 内存缓存：存储所有解析后的动态
    private(set) var GLNTRKNA_AllMoments: [GLNTRKNA_MomentEntry] = []
    
    private init() {
        GLNTRKNA_LoadLocalArtifacts()
       
    }
    
    /// 从 RGlinkMoment.plist 加载原始数据
    private func GLNTRKNA_LoadLocalArtifacts() {
        guard let path = Bundle.main.path(forResource: "RGlinkMoment", ofType: "plist"),
              let rawArray = NSArray(contentsOfFile: path) as? [[String: Any]] else {
            print("Failed to locate or parse RGlinkMoment.plist")
            return
        }
        
        // 将字典数组转化为模型数组
        self.GLNTRKNA_AllMoments = rawArray.map { GLNTRKNA_MomentEntry(fromDictionary: $0) }
    }
    
    /// 获取过滤黑名单后的动态列表
    /// - Parameter isVideo: true 获取视频流，false 获取图片流
    func GLNTRKNA_FetchFilteredStream(isVideo: Bool) -> [GLNTRKNA_MomentEntry] {
        // 1. 获取当前用户的黑名单列表
        let glnt_blacklisted = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_GetCurrentProfile()?.glnt_obsidian_list ?? []
        
        // 2. 过滤：非黑名单用户 && 类型匹配
        return GLNTRKNA_AllMoments.filter { moment in
            let isNotBlocked = !glnt_blacklisted.contains(moment.glnt_userId)
            return isNotBlocked && (moment.glnt_is_video == isVideo)
        }
    }
    
    /// 清除内存缓存（例如切换账号时使用）
    func GLNTRKNA_PurgeMemory() {
        GLNTRKNA_AllMoments.removeAll()
        GLNTRKNA_LoadLocalArtifacts()
    }
}
