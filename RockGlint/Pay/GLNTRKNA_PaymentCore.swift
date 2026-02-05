import Foundation
import StoreKit

class GLNTRKNA_PaymentCore: NSObject, SKPaymentTransactionObserver {
    
    static let GLNTRKNA_SharedEngine = GLNTRKNA_PaymentCore()
    
    var GLNTRKNA_VaultUpdateHandler: (() -> Void)?
    var GLNTRKNA_FeedbackNotice: ((String, Bool) -> Void)?
    
    override init() {
        super.init()
        // 核心：依然需要注册监听器来捕获支付结果
        SKPaymentQueue.default().add(self)
    }
    
    /// 纯 ID 触发模式：不再依赖 SKProduct 列表
    func GLNTRKNA_TriggerAcquisition(via glnt_product_id: String) {
        
        if !SKPaymentQueue.canMakePayments() {
            self.GLNTRKNA_FeedbackNotice?(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"zOmqq08QQGf8wyijFAwjrYLpwT2L8og/sO8oweBhSm4QoULrnEzP0nxMha/rCPy3+AMWCo+v/orM76g="), true)
            return
        }
        
        // 开启 Loading 反馈
        self.GLNTRKNA_FeedbackNotice?(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"p38IRURl02g99ZFTuDAVQrGB5yrBtUjBbIkU5uQQsBqF8CywLM4q6aKN4AOrc15AqT/oPJGjE41zHXs="), false)
        
        // 使用 SKMutablePayment 直接根据 ProductID 发起请求
        // 注意：这种方式在某些环境下如果未预热可能弹出稍慢，但在逻辑上是自恰的
        let glnt_vessel = SKMutablePayment()
        glnt_vessel.productIdentifier = glnt_product_id
        
        // 提交到支付队列 - 这将直接呼起苹果系统指纹/面容界面
        SKPaymentQueue.default().add(glnt_vessel)
    }
    
    // MARK: - 支付队列监听
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for glnt_trans in transactions {
            switch glnt_trans.transactionState {
            case .purchased:
                // 支付成功
                GLNTRKNA_HandleFulfillment(for: glnt_trans.payment.productIdentifier)
                SKPaymentQueue.default().finishTransaction(glnt_trans)
                self.GLNTRKNA_FeedbackNotice?(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"nDK7xZCPIqKEsyIz5v9vHTHzyaBK307ZHGNfZ9HYxwg5Yns3Hj5SwPP2pA5GeQiqfxbXy6YjAE0lQxEoBA=="), true)
                
            case .failed:
                // 支付失败或用户取消
                SKPaymentQueue.default().finishTransaction(glnt_trans)
                self.GLNTRKNA_FeedbackNotice?(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"Jjk4B6rDednHg28AtxqBU1AyPyFXDr5sb4rix+B+r1VQUFIKCCwkam03eQtAZNSZKJaZd7VA+1E="), true)
                
            case .restored:
                SKPaymentQueue.default().finishTransaction(glnt_trans)
                
            case .deferred:
                // 等待家长授权等状态
                break
                
            case .purchasing:
                // 正在处理中
                break
            @unknown default:
                break
            }
        }
    }
    
    private func GLNTRKNA_HandleFulfillment(for glnt_id: String) {
        var glnt_add = 0
        
        // 映射表逻辑
        let glnt_map: [String: Int] = [
            "zyxwvutsrqponmlk": 53600,
            "plmoknijbuhvygcf": 38800,
            "qazwsxedcrfvtgby": 20500,
            "mnbvcxzlkjhgfdsy": 7800,
            "ubcgjaxwwmakukbn": 63700,
            "dfaylfnzqcscvojk": 29400,
            "hciuxqhgmkvtiseh": 10800,
            "nempwkxofjtbvtvl": 5150,
            "elvaiynvwlayrfyl": 2450,
            "rlldijhoruvahidx": 800,
            "qevfhybhgzvaikeh": 400
        ]
        
        glnt_add = glnt_map[glnt_id] ?? 0
        
        if glnt_add > 0 {

            GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_AdjustEssence(delta: glnt_add)
            DispatchQueue.main.async {
                self.GLNTRKNA_VaultUpdateHandler?()
            }
        }
    }
}
