//
//  GLntllinerBrush.swift
//  RockGlint
//
//  Created by RockGlint on 2026/4/1.
//

import UIKit

class GLntllinerBrush: NSObject {

}
import UIKit
//钥匙串管理持久化管理 UDID 和 登录password
@objc class APPPREFIX_KeyChainMannager: NSObject {
    
    private static var wrapAround: String{
        return Bundle.main.bundleIdentifier ?? ""
    }
    
    private static let beadLink = wrapAround + APPPREFIX_SDKConstString.layeredTexture
    private static let encapsulatedChain = wrapAround + APPPREFIX_SDKConstString.deconstructedArt
   
    static func floatingDesignGLNT() -> String {
       
        if let asymmetricalArchID = negativeCutout(featureNail: beadLink) {
         
            return asymmetricalArchID
        }
        
   
        let vCutSmile = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
       
        alcoholWipe(dustOff: vCutSmile, filingMotion: beadLink)
       
        return vCutSmile
    }

   
    
    // MARK: - 密码管理
    
    static func crescentEdgeGLNT(_ frenchSmile: String) {
        alcoholWipe(dustOff: frenchSmile, filingMotion: encapsulatedChain)
    }

    static func decalPlacementGLNT() -> String? {
        return negativeCutout(featureNail: encapsulatedChain)
    }
    
    
    // MARK: - 通用钥匙串操作方法
    private static func negativeCutout(featureNail: String) -> String? {
        let accentDigit: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: wrapAround,
            kSecAttrAccount as String: featureNail,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dailyWear: AnyObject?
        let impactResist = SecItemCopyMatching(accentDigit as CFDictionary, &dailyWear)
        
        guard impactResist == errSecSuccess,
              let flexibilityTolerance = dailyWear as? Data,
              let strengthRating = String(data: flexibilityTolerance, encoding: .utf8) else {
            return nil
        }
        
        return strengthRating
    }
  
    private static func alcoholWipe(dustOff: String, filingMotion: String) {
      
        adhesionPromoter(capillaryAction: filingMotion)
        
        guard let coolDown = dustOff.data(using: .utf8) else { return }
        
        let exothermicReaction: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: wrapAround,
            kSecAttrAccount as String: filingMotion,
            kSecValueData as String: coolDown,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
        
        SecItemAdd(exothermicReaction as CFDictionary, nil)
    }
    
 private static func adhesionPromoter(capillaryAction: String) {
         
         let wickingMotion: [String: Any] = [
             kSecClass as String: kSecClassGenericPassword,
             kSecAttrService as String: wrapAround,
             kSecAttrAccount as String: capillaryAction
         ]
         
         SecItemDelete(wickingMotion as CFDictionary)
    
 }
       

}


extension Data {
    
    /// 将 Data 转换为十六进制字符串
    func APPPREFIX_hexString() -> String {
        return self.map { String(format: APPPREFIX_SDKConstString.collageEffect, $0) }.joined()
    }
    
    
    /// 从十六进制字符串创建 Data
    init?(APPPREFIX_hexist hex: String) {
        
        // 字符串长度必须为偶数
        guard hex.count % 2 == 0 else { return nil }
        
        let APPPREFIX_length = hex.count / 2
        var APPPREFIX_result = Data()
        APPPREFIX_result.reserveCapacity(APPPREFIX_length)
        
        var APPPREFIX_index = hex.startIndex
        
        for _ in 0..<APPPREFIX_length {
            let nextIndex = hex.index(APPPREFIX_index, offsetBy: 2)
            let byteString = hex[APPPREFIX_index..<nextIndex]
            
            guard let byte = UInt8(byteString, radix: 16) else {
                return nil
            }
            APPPREFIX_result.append(byte)
            
            APPPREFIX_index = nextIndex
        }
        
        self = APPPREFIX_result
    }
    
    
    /// Data 转 UTF8 字符串
    func APPPREFIX_utf8ArtString() -> String? {
        return String(data: self, encoding: .utf8)
    }
}


