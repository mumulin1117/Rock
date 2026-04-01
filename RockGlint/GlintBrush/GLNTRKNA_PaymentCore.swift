import Foundation
import StoreKit
//extension GLNTRKNA_PaymentCore: SKProductsRequestDelegate {
//    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
//        for product in response.products {
//            MUNDFlRL_PreheatedProducts[product.productIdentifier] = product
//        }
//    }
//}
//class GLNTRKNA_PaymentCore: NSObject, SKPaymentTransactionObserver {
//    private var MUNDFlRL_AuraRequest: SKProductsRequest?
//    private var MUNDFlRL_PreheatedProducts: [String: SKProduct] = [:]
//    
//    static let GLNTRKNA_SharedEngine = GLNTRKNA_PaymentCore()
//    
//    var GLNTRKNA_VaultUpdateHandler: (() -> Void)?
//    var GLNTRKNA_FeedbackNotice: ((String, Bool) -> Void)?
//    func GLNTRKNA_PreheatVault(with ids: Set<String>) {
//        MUNDFlRL_AuraRequest = SKProductsRequest(productIdentifiers: ids)
//        MUNDFlRL_AuraRequest?.delegate = self
//        MUNDFlRL_AuraRequest?.start()
//    }
//    override init() {
//        super.init()
//    
//        SKPaymentQueue.default().add(self)
//    }
//
//    func GLNTRKNA_TriggerAcquisition(via glnt_product_id: String) {
//        
//        if !SKPaymentQueue.canMakePayments() {
//            self.GLNTRKNA_FeedbackNotice?(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"zOmqq08QQGf8wyijFAwjrYLpwT2L8og/sO8oweBhSm4QoULrnEzP0nxMha/rCPy3+AMWCo+v/orM76g="), true)
//            return
//        }
//        
//        self.GLNTRKNA_FeedbackNotice?(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"p38IRURl02g99ZFTuDAVQrGB5yrBtUjBbIkU5uQQsBqF8CywLM4q6aKN4AOrc15AqT/oPJGjE41zHXs="), false)
//        
//     
//        let glnt_vessel = SKMutablePayment()
//        glnt_vessel.productIdentifier = glnt_product_id
//        
//        let glnt_payment: SKPayment
//            if let glnt_safe_product = MUNDFlRL_PreheatedProducts[glnt_product_id] {
//                glnt_payment = SKPayment(product: glnt_safe_product)
//            } else {
//                let glnt_vessel = SKMutablePayment()
//                glnt_vessel.productIdentifier = glnt_product_id
//                glnt_payment = glnt_vessel
//            }
//        
//        SKPaymentQueue.default().add(glnt_payment)
//    }
//    
//    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
//        for glnt_trans in transactions {
//            switch glnt_trans.transactionState {
//            case .purchased:
//            
//                GLNTRKNA_HandleFulfillment(for: glnt_trans.payment.productIdentifier)
//                SKPaymentQueue.default().finishTransaction(glnt_trans)
//                self.GLNTRKNA_FeedbackNotice?(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"nDK7xZCPIqKEsyIz5v9vHTHzyaBK307ZHGNfZ9HYxwg5Yns3Hj5SwPP2pA5GeQiqfxbXy6YjAE0lQxEoBA=="), true)
//                
//            case .failed:
//               
//                SKPaymentQueue.default().finishTransaction(glnt_trans)
//                self.GLNTRKNA_FeedbackNotice?(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64:"Jjk4B6rDednHg28AtxqBU1AyPyFXDr5sb4rix+B+r1VQUFIKCCwkam03eQtAZNSZKJaZd7VA+1E="), true)
//                
//            case .restored:
//                SKPaymentQueue.default().finishTransaction(glnt_trans)
//                
//            case .deferred:
//             
//                break
//                
//            case .purchasing:
//           
//                break
//            @unknown default:
//                break
//            }
//        }
//    }
//    
//    private func GLNTRKNA_HandleFulfillment(for glnt_id: String) {
//        var glnt_add = 0
//        
//        let glnt_map: [String: Int] = [
//            "zyxwvutsrqponmlk": 53600,
//            "plmoknijbuhvygcf": 38800,
//            "qazwsxedcrfvtgby": 20500,
//            "mnbvcxzlkjhgfdsy": 7800,
//            "ubcgjaxwwmakukbn": 63700,
//            "dfaylfnzqcscvojk": 29400,
//            "hciuxqhgmkvtiseh": 10800,
//            "nempwkxofjtbvtvl": 5150,
//            "elvaiynvwlayrfyl": 2450,
//            "rlldijhoruvahidx": 800,
//            "qevfhybhgzvaikeh": 400
//        ]
//        
//        glnt_add = glnt_map[glnt_id] ?? 0
//        
//        if glnt_add > 0 {
//
//            GLNTRKNA_CentralAuthority.GLNTRKNA_SharedOrb.GLNTRKNA_AdjustEssence(delta: glnt_add)
//            DispatchQueue.main.async {
//                self.GLNTRKNA_VaultUpdateHandler?()
//            }
//        }
//    }
//}

import Foundation
import StoreKit

extension GLNTRKNA_PaymentCore: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        for product in response.products {
            MUNDFlRL_PreheatedProducts[product.productIdentifier] = product
        }
    }
}

class GLNTRKNA_PaymentCore: NSObject, SKPaymentTransactionObserver {
    private var MUNDFlRL_AuraRequest: SKProductsRequest?
    private var MUNDFlRL_PreheatedProducts: [String: SKProduct] = [:]
    
    static let GLNTRKNA_SharedEngine = GLNTRKNA_PaymentCore()
    
    var GLNTRKNA_VaultUpdateHandler: (() -> Void)?
    var GLNTRKNA_FeedbackNotice: ((String, Bool) -> Void)?
    
 
    struct GLNTRKNA_PaymentResult {
        let success: Bool
        let errorMessage: String?
        let transactionIdentifier: String?
        let originalTransactionId: String?
        let productIdentifier: String?
        let receiptData: Data?
    }
    
   
    private var paymentCallbacks: [String: (GLNTRKNA_PaymentResult) -> Void] = [:]
    private var callbackLock = NSLock()
    
    func GLNTRKNA_PreheatVault(with ids: Set<String>) {
        MUNDFlRL_AuraRequest = SKProductsRequest(productIdentifiers: ids)
        MUNDFlRL_AuraRequest?.delegate = self
        MUNDFlRL_AuraRequest?.start()
    }
    
    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    func GLNTRKNA_TriggerAcquisitionWithReceipt(via glnt_product_id: String, completion: @escaping (GLNTRKNA_PaymentResult) -> Void) {
        
       
        if !SKPaymentQueue.canMakePayments() {
            let errorMsg = GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64: "zOmqq08QQGf8wyijFAwjrYLpwT2L8og/sO8oweBhSm4QoULrnEzP0nxMha/rCPy3+AMWCo+v/orM76g=")
            self.GLNTRKNA_FeedbackNotice?(errorMsg, true)
            
            let result = GLNTRKNA_PaymentResult(
                success: false,
                errorMessage: errorMsg,
                transactionIdentifier: nil,
                originalTransactionId: nil,
                productIdentifier: glnt_product_id,
                receiptData: nil
            )
            completion(result)
            return
        }
        
       
        callbackLock.lock()
        paymentCallbacks[glnt_product_id] = completion
        callbackLock.unlock()
        
        self.GLNTRKNA_FeedbackNotice?(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64: "p38IRURl02g99ZFTuDAVQrGB5yrBtUjBbIkU5uQQsBqF8CywLM4q6aKN4AOrc15AqT/oPJGjE41zHXs="), false)
        
      
        let glnt_payment: SKPayment
        if let glnt_safe_product = MUNDFlRL_PreheatedProducts[glnt_product_id] {
            glnt_payment = SKPayment(product: glnt_safe_product)
        } else {
            let glnt_vessel = SKMutablePayment()
            glnt_vessel.productIdentifier = glnt_product_id
            glnt_payment = glnt_vessel
        }
        
        SKPaymentQueue.default().add(glnt_payment)
    }
    
 
    func GLNTRKNA_TriggerAcquisitionWithTransactionInfo(via glnt_product_id: String, completion: @escaping (Bool, String?, String?, String?) -> Void) {
        GLNTRKNA_TriggerAcquisitionWithReceipt(via: glnt_product_id) { result in
            completion(result.success, result.transactionIdentifier, result.originalTransactionId, result.errorMessage)
        }
    }
    
    
    func GLNTRKNA_TriggerAcquisition(via glnt_product_id: String) {
        GLNTRKNA_TriggerAcquisitionWithTransactionInfo(via: glnt_product_id) { [weak self] success, _, _, errorMsg in
            if !success {
                self?.GLNTRKNA_FeedbackNotice?(errorMsg ?? "Payment failed", true)
            }
        }
    }
    
 
    private func GLNTRKNA_FetchReceiptData() -> Data? {
        guard let receiptUrl = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        
        do {
            let receiptData = try Data(contentsOf: receiptUrl)
            return receiptData
        } catch {
            print("Failed to fetch receipt data: \(error)")
            return nil
        }
    }
    
    
    private func GLNTRKNA_ExtractReceiptInfo(from transaction: SKPaymentTransaction) -> (transactionId: String?, originalTransactionId: String?) {
        let transactionId = transaction.transactionIdentifier
        let originalTransactionId: String?
        
       
        if let original = transaction.original {
            originalTransactionId = original.transactionIdentifier
        } else {
            originalTransactionId = transaction.transactionIdentifier
        }
        
        return (transactionId, originalTransactionId)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for glnt_trans in transactions {
            switch glnt_trans.transactionState {
            case .purchased:
                let productId = glnt_trans.payment.productIdentifier
                
                
                let (transactionId, originalTransactionId) = GLNTRKNA_ExtractReceiptInfo(from: glnt_trans)
                let receiptData = GLNTRKNA_FetchReceiptData()
                
              
                GLNTRKNA_HandleFulfillment(for: productId, transactionId: transactionId, receiptData: receiptData)
                
                SKPaymentQueue.default().finishTransaction(glnt_trans)
                
                // 触发成功回调
                callbackLock.lock()
                if let callback = paymentCallbacks.removeValue(forKey: productId) {
                    let result = GLNTRKNA_PaymentResult(
                        success: true,
                        errorMessage: nil,
                        transactionIdentifier: transactionId,
                        originalTransactionId: originalTransactionId,
                        productIdentifier: productId,
                        receiptData: receiptData
                    )
                    callback(result)
                }
                callbackLock.unlock()
                
                self.GLNTRKNA_FeedbackNotice?(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64: "nDK7xZCPIqKEsyIz5v9vHTHzyaBK307ZHGNfZ9HYxwg5Yns3Hj5SwPP2pA5GeQiqfxbXy6YjAE0lQxEoBA=="), true)
                
            case .failed:
                let productId = glnt_trans.payment.productIdentifier
                let errorMsg = glnt_trans.error?.localizedDescription ?? "Unknown error"
                SKPaymentQueue.default().finishTransaction(glnt_trans)
                
               
                callbackLock.lock()
                if let callback = paymentCallbacks.removeValue(forKey: productId) {
                    let result = GLNTRKNA_PaymentResult(
                        success: false,
                        errorMessage: errorMsg,
                        transactionIdentifier: nil,
                        originalTransactionId: nil,
                        productIdentifier: productId,
                        receiptData: nil
                    )
                    callback(result)
                }
                callbackLock.unlock()
                
                self.GLNTRKNA_FeedbackNotice?(GLNTRKnaAuraResourceVault.GLNTRKnaRestoreNailySecret(GLNTRKnaCipherBase64: "Jjk4B6rDednHg28AtxqBU1AyPyFXDr5sb4rix+B+r1VQUFIKCCwkam03eQtAZNSZKJaZd7VA+1E="), true)
                
            case .restored:
                let productId = glnt_trans.payment.productIdentifier
                let (transactionId, originalTransactionId) = GLNTRKNA_ExtractReceiptInfo(from: glnt_trans)
                let receiptData = GLNTRKNA_FetchReceiptData()
                
                // 处理恢复交易
                GLNTRKNA_HandleRestoredFulfillment(for: productId, transactionId: transactionId, originalTransactionId: originalTransactionId, receiptData: receiptData)
                
                SKPaymentQueue.default().finishTransaction(glnt_trans)
                
            case .deferred:
                break
                
            case .purchasing:
                break
                
            @unknown default:
                break
            }
        }
    }
    
   
    private func GLNTRKNA_HandleFulfillment(for glnt_id: String, transactionId: String?, receiptData: Data?) {
        var glnt_add = 0
        
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
            
            // 可选：记录交易日志
            if let transactionId = transactionId {
                print("Payment fulfilled - Product: \(glnt_id), Transaction: \(transactionId)")
            }
            
            // 可选：将收据发送到服务器验证
            if let receiptData = receiptData {
                GLNTRKNA_VerifyReceiptWithServer(receiptData: receiptData, transactionId: transactionId)
            }
            
            DispatchQueue.main.async {
                self.GLNTRKNA_VaultUpdateHandler?()
            }
        }
    }
    
 
    private func GLNTRKNA_HandleRestoredFulfillment(for glnt_id: String, transactionId: String?, originalTransactionId: String?, receiptData: Data?) {
        var glnt_add = 0
        
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
            
            // 记录恢复的交易
            if let originalId = originalTransactionId {
                print("Restored transaction - Product: \(glnt_id), Original Transaction: \(originalId)")
            }
            
            DispatchQueue.main.async {
                self.GLNTRKNA_VaultUpdateHandler?()
            }
        }
    }
    
    // MARK: - 收据验证（可选，与服务器交互）
    private func GLNTRKNA_VerifyReceiptWithServer(receiptData: Data, transactionId: String?) {
        // 将收据发送到您的服务器进行验证
        // 这里只是示例，实际需要实现网络请求
        #if DEBUG
        // 开发环境验证逻辑
        #else
        // 生产环境验证逻辑
        #endif
    }
}
