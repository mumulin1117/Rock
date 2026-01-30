//
//  RNL_GlintVault.swift
//  RockGlint
//
//  Created by RockGlint on 2026/1/27.
//

import Foundation

final class RNL_GlintVault {
    static let shard = RNL_GlintVault()
    private let kArtisanRegistry = "RNL_Registry_Key"
    private let kActiveArtisan = "RNL_Active_Session"

    // 模拟注册：保存工匠信息
    func enrollArtisan(identity: String, secret: String) {
        var registry = UserDefaults.standard.dictionary(forKey: kArtisanRegistry) as? [String: String] ?? [:]
        registry[identity] = secret
        UserDefaults.standard.set(registry, forKey: kArtisanRegistry)
    }

    // 验证登录
    func authenticate(identity: String, secret: String) -> Bool {
        let registry = UserDefaults.standard.dictionary(forKey: kArtisanRegistry) as? [String: String] ?? [:]
        if registry[identity] == secret {
            UserDefaults.standard.set(identity, forKey: kActiveArtisan)
            return true
        }
        return false
    }

    // 退出与注销
    func evacuateSession() {
        UserDefaults.standard.removeObject(forKey: kActiveArtisan)
    }

    var isArtisanPresent: Bool {
        return UserDefaults.standard.string(forKey: kActiveArtisan) != nil
    }
}
