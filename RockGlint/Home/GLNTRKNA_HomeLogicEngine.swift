//
//  GLNTRKNA_HomeLogicEngine.swift
//  RockGlint
//
//  Created by mumu on 2026/2/1.
//

import UIKit


class GLNTRKNA_HomeLogicEngine {
    
    // 顶部随机用户：从本地数据中随机抽取4个
    func GLNTRKNA_FetchRandomArtisans() -> [GLNTRKNA_MomentEntry] {
        let allEntries = GLNTRKNA_MomentCacheManager.GLNTRKNA_SharedVault.GLNTRKNA_AllMoments
        // 过滤掉黑名单用户后随机洗牌取前4个
        let blocked = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_GetCurrentProfile()?.glnt_obsidian_list ?? []
        let available = allEntries.filter { !blocked.contains($0.glnt_userId) }
        return Array(available.shuffled().prefix(4))
    }
    
    // 底部动态过滤逻辑
    func GLNTRKNA_FilterFeed(by type: Int) -> [GLNTRKNA_MomentEntry] {
        let manager = GLNTRKNA_MomentCacheManager.GLNTRKNA_SharedVault
        // 获取所有图片类型的动态 (isVideo: false)
        let baseFeed = manager.GLNTRKNA_FetchFilteredStream(isVideo: false)
        
        switch type {
        case 0:
            // 模拟热门：根据评论数降序排序
            return baseFeed.sorted { ($0.glnt_comments.count) > ($1.glnt_comments.count) }
            
        case 1:
            // 模拟推荐：随机乱序
            return baseFeed.shuffled()
            
        case 2:
            // 模拟最新：由于Plist是按顺序写的，这里直接反转或保持原样
            return baseFeed.reversed()
            
        case 3:
            // 关注逻辑：只显示已关注用户的动态
            let followed = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_GetCurrentProfile()?.glnt_adored_list ?? []
            return baseFeed.filter { followed.contains($0.glnt_userId) }
        default:
            return []
        }
    }
    
    
    // 底部视频过滤逻辑
    func GLNTRKNA_FilterVadio(by type: Int) -> [GLNTRKNA_MomentEntry] {
        let manager = GLNTRKNA_MomentCacheManager.GLNTRKNA_SharedVault
        // 获取所有图片类型的动态 (isVideo: false)
        let baseFeed = manager.GLNTRKNA_FetchFilteredStream(isVideo: true)
        
        switch type {
        case 0:
            // 模拟热门：根据评论数降序排序
            return baseFeed.sorted { ($0.glnt_comments.count) > ($1.glnt_comments.count) }
            
        case 1:
            // 模拟推荐：随机乱序
            return baseFeed.shuffled()
            
        case 2:
            // 模拟最新：由于Plist是按顺序写的，这里直接反转或保持原样
            return baseFeed.reversed()
            
        case 3:
            // 关注逻辑：只显示已关注用户的动态
            let followed = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_GetCurrentProfile()?.glnt_adored_list ?? []
            return baseFeed.filter { followed.contains($0.glnt_userId) }
        default:
            return []
        }
    }
}

// 定义四个按钮的枚举类型
enum GLNTRKNA_FeedType {
    case hot, foryou, new, follow
}
