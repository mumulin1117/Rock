//
//  RockStudioServiceBridge.swift
//  RockGlint
//

import UIKit

func unsealPolishText(_ cipherText: String) -> String {
    RockStudioServiceBridge.unsealPolishText(cipherText)
}

enum RockStudioServiceBridge {
    
    static func unsealPolishText(_ cipherText: String) -> String {
        GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64: cipherText)
    }
    
    static func vaultGraphic(named alias: String) -> UIImage? {
        GLNTRKnaAuraResourceVault.GLNTRKnaGetGlintyGraphic(GLNTRKnaAlias: alias)
    }
    
    static func showLoading(_ message: String, on view: UIView) {
        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_ProjectLoading(with: message, on: view)
    }
    
    static func hideLoading() {
        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_DissolveLoading()
    }
    
    static func flash(_ message: String, on view: UIView) {
        GLNTRKNA_AmbienceManager.GLNTRKNA_SharedOrb.GLNTRKNA_FlashMessage(message, on: view)
    }
    
    static func verifyIdentity(email: String, secret: String) -> Bool {
        GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_VerifyIdentity(email: email, secret: secret)
    }
    
    static func enterExternalAtelier(email: String, secret: String, alias: String, bio: String, avatar: String) -> Bool {
        GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_EnterExternalAtelier(
            email: email,
            secret: secret,
            alias: alias,
            bio: bio,
            avatar: avatar
        )
    }
    
    static func reviseProfileVisual(alias: String?, bio: String?, birthday: String?, avatarImage: UIImage?) {
        GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_ReviseProfileVisual(
            alias: alias,
            bio: bio,
            birthday: birthday,
            avatarImage: avatarImage
        )
    }
    
    static func studioTabController() -> UIViewController {
        GLNTRKNA_StudioTabController()
    }
}
