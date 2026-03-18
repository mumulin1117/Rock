//
//  GLNTRKNA_HomeLogicEngine.swift
//  RockGlint
//
//  Created by mumu on 2026/2/1.
//

import UIKit


class GLNTRKNA_HomeLogicEngine {
 
    func GLNTRKNA_FetchRandomArtisans() -> [GLNTRKNA_MomentEntry] {
        let allEntries = GLNTRKNA_MomentCacheManager.GLNTRKNA_SharedVault.GLNTRKNA_AllMoments
       
        let blocked = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_GetCurrentProfile()?.glnt_obsidian_list ?? []
        let available = allEntries.filter { !blocked.contains($0.glnt_userId) }
        return Array(available.shuffled().prefix(4))
    }
    
  
    func GLNTRKNA_FilterFeed(by type: Int) -> [GLNTRKNA_MomentEntry] {
        let manager = GLNTRKNA_MomentCacheManager.GLNTRKNA_SharedVault
        
        let baseFeed = manager.GLNTRKNA_FetchFilteredStream(isVideo: false)
        
        switch type {
        case 0:
        
            return baseFeed.sorted { ($0.glnt_comments.count) > ($1.glnt_comments.count) }
            
        case 1:
          
            return baseFeed.shuffled()
            
        case 2:
         
            return baseFeed.reversed()
            
        case 3:
        
            let followed = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_GetCurrentProfile()?.glnt_adored_list ?? []
            return baseFeed.filter { followed.contains($0.glnt_userId) }
        default:
            return []
        }
    }
    
   
    func GLNTRKNA_FilterVadio(by type: Int) -> [GLNTRKNA_MomentEntry] {
        let manager = GLNTRKNA_MomentCacheManager.GLNTRKNA_SharedVault
       
        let baseFeed = manager.GLNTRKNA_FetchFilteredStream(isVideo: true)
        
        switch type {
        case 0:
           
            return baseFeed.sorted { ($0.glnt_comments.count) > ($1.glnt_comments.count) }
            
        case 1:
          
            return baseFeed.shuffled()
            
        case 2:
            
            return baseFeed.reversed()
            
        case 3:
         
            let followed = GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_GetCurrentProfile()?.glnt_adored_list ?? []
            return baseFeed.filter { followed.contains($0.glnt_userId) }
        default:
            return []
        }
    }
}

enum GLNTRKNA_FeedType {
    case hot, foryou, new, follow
}
