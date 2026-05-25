//
//  ApplePolishSignInBridge.swift
//  RockGlint
//

import AuthenticationServices
import UIKit

struct ApplePolishLoginEnvelope: Decodable {
    let code: Int
    let data: ApplePolishLoginPayload?
    let message: String?
}

struct ApplePolishLoginPayload: Decodable {
    let userEmail: String?
    let userName: String?
    let userBrief: String?
    let userTmUrl: String?
    let token: String?
    let equipmentNo: String?
    let bundleId: String?
}

final class ApplePolishSignInBridge: NSObject {
    
    static let sharedPolishBridge = ApplePolishSignInBridge()
    private let appleBundleMark = unsealPolishText("Vybd8UYX26eLTGkXTE1Nvz7H2N0rmEgnymYdyAx0RO1RGQCbVlQK8MFI")
    
    private var presentationAnchor: UIViewController?
    private var appleLoginCallback: ((Bool, String?) -> Void)?
    
    func requestApplePolishSignIn(from host: UIViewController, completion: @escaping (Bool, String?) -> Void) {
        presentationAnchor = host
        appleLoginCallback = completion
        
        let appleProvider = ASAuthorizationAppleIDProvider()
        let request = appleProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func sendTokenToNailGate(identityToken: String, completion: @escaping (Bool, String?) -> Void) {
        guard let endpointURL = URL(string: unsealPolishText("b4WsBApCyn2/fkFk3cIQnAFcsDjjKi5jVndInl0PGwpXMhY2bfqcKBEvJAx3D9N39V6lfUXHabL5iiCeRFCXP4931+mUO5GOnPg/ehHYG8W0AOI=")) else {
            completion(false, unsealPolishText("D5yTpDW57UwnWPIr592+8B5Tpk0xitmTCEn8T8zsPjf87WBLBbUTCdTTzmCzOZOy0OEJyko8Ac88NtvD"))
            return
        }
        
        var request = URLRequest(url: endpointURL)
        request.httpMethod = unsealPolishText("1NaKgP4YWbZ/Rq1PkChSQh4wnBAQxFuE+ZgApLMMifLKalBM")
        request.setValue(unsealPolishText("uKTwPJ2gFQXsvvC9pwFD1PzXZGW3t5Lru8KGC8NaR1gB1gXpPUgqxM5036L/fMd6"), forHTTPHeaderField: unsealPolishText("m+EvS35RQ64HpzDSsR3J4FZ1g71zP4PXW386IcJ/6tM9mpkhH97Aqr7uGrk="))
        request.setValue(unsealPolishText("uKTwPJ2gFQXsvvC9pwFD1PzXZGW3t5Lru8KGC8NaR1gB1gXpPUgqxM5036L/fMd6"), forHTTPHeaderField: unsealPolishText("WDAGVMstAevH5Z7ewNhCCAIjIqabR0AboYDj2tcVcpTcxmBPKbc="))
        
        let deviceNumber = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
        let requestBody: [String: String] = [
            unsealPolishText("1Q1/TNnnVlW4V1ro2XeQuBFox+lHBE2aEWMDBc5Irs0sXXc2Pk4idBRh3cu4"): identityToken,
            unsealPolishText("uCn3UmYhHlxCNj4Ak9GxoYeNOAF4UlweOGEhdjktlEpdu+81Q8u4CA=="): appleBundleMark,
            unsealPolishText("sJ9pVbDoeIAIv7Blws9r+QDmNSo0NZM0zE2TpbDG7FrfuUL6NOpUcQm1tg=="): deviceNumber
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: [])
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let networkError = error {
                DispatchQueue.main.async { completion(false, networkError.localizedDescription) }
                return
            }
            
            guard let responseData = data,
                  let loginEnvelope = try? JSONDecoder().decode(ApplePolishLoginEnvelope.self, from: responseData),
                  loginEnvelope.code == 200000,
                  let payload = loginEnvelope.data else {
                DispatchQueue.main.async { completion(false, unsealPolishText("WTmISbJZJ38SO/Nqt3EfObGgoxCH/wU0GE8ckMTyDiqdOgF9htURlHlkb6HwWojegzk=")) }
                return
            }
            
            let accountEmail = payload.userEmail?.isEmpty == false ? payload.userEmail! : unsealPolishText("UVp0Zpc0JqleeUwDBROFVfB936hPEQx6mk1bp8CujIRXvGdrFxc=") + deviceNumber + unsealPolishText("x3/+JJZBiqbGf/X/ZWc4yKYFmpg2hAHqoE9LO972ISkNosD5++T3/b2TmQ==")
            let displayName = payload.userName?.isEmpty == false ? payload.userName! : accountEmail
            let accountSecret = payload.token?.isEmpty == false ? payload.token! : identityToken
            let profileBio = payload.userBrief ?? unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw=")
            let avatarPath = payload.userTmUrl ?? unsealPolishText("YIQEb2BvTb9NVXMu+2SY6qStTK94yeaF5PQd+qhNNXw=")
            
            let didStoreAccount = RockStudioServiceBridge.enterExternalAtelier(
                email: accountEmail,
                secret: accountSecret,
                alias: displayName,
                bio: profileBio,
                avatar: avatarPath
            )
            
            DispatchQueue.main.async {
                completion(didStoreAccount, didStoreAccount ? nil : unsealPolishText("jeB2P6jZd1VhYsFXpgIssWmb5FPNTb1YMnDOO9eQNZDPxv8dN6DNxJLet2d3ziUdnKEl/3WwqHzb6g6wnw=="))
            }
        }.resume()
    }
}

extension ApplePolishSignInBridge: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
              let tokenData = appleCredential.identityToken,
              let identityTokenText = String(data: tokenData, encoding: .utf8) else {
            appleLoginCallback?(false, unsealPolishText("/ZlLRHeUvSHhak4dHWauDym3TA4ORh1FNpQmjmU/hByDGd0d/TZtioEzIkwitCk15wcjtad8HmzPROiJkA=="))
            return
        }
        
        sendTokenToNailGate(identityToken: identityTokenText) { [weak self] success, message in
            self?.appleLoginCallback?(success, message)
            self?.appleLoginCallback = nil
            self?.presentationAnchor = nil
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        appleLoginCallback?(false, error.localizedDescription)
        appleLoginCallback = nil
        presentationAnchor = nil
    }
}

extension ApplePolishSignInBridge: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return presentationAnchor?.view.window ?? ASPresentationAnchor()
    }
}
