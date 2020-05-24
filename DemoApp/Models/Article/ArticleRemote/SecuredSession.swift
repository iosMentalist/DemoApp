// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation
import Alamofire

class CustomServerTrustPolicyManager: ServerTrustManager {
    override func serverTrustEvaluator(forHost host: String) throws -> ServerTrustEvaluating? {
        if let policy = try super.serverTrustEvaluator(forHost: host) {
            return policy
        } else {
            return DefaultTrustEvaluator()
        }
    }
}
class CustomSession : SessionDelegate{
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let protectionSpace = challenge.protectionSpace
        guard protectionSpace.authenticationMethod ==
            NSURLAuthenticationMethodServerTrust,
            protectionSpace.host.contains("testapi.io") else {
                completionHandler(.performDefaultHandling, nil)
                return
        }
        guard let serverTrust = protectionSpace.serverTrust else {
            completionHandler(.performDefaultHandling, nil)
            return
        }
        if checkValidity(of: serverTrust) {
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        } else {
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }

    func checkValidity(of serverTrust:SecTrust ) -> Bool{
        return true
    }
}
