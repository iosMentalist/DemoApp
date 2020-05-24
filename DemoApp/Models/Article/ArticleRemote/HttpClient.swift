// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation
import Alamofire

class HttpClient {
    static let shared = HttpClient()

    typealias RemoteResult = Swift.Result<String,Error>

    let session = Session.init(configuration: .default, delegate: CustomSession(),serverTrustManager: CustomServerTrustPolicyManager(evaluators: [:]) )

    func getRequest(url:URL,payload:String?, completion: @escaping (RemoteResult)->Void){
        sendRequest(url: url, payload: payload, isPost: false, completion: completion)
    }

    func postRequset(url:URL,payload:String?, completion: @escaping (RemoteResult)->Void){
        sendRequest(url: url, payload: payload, isPost: true, completion: completion)
    }

    private func sendRequest(url : URL,payload:String?,isPost:Bool,completion: @escaping (RemoteResult)->Void) {
        debugPrint("sending request: \(url)")
        let request = self.makeRequest(url,payload:payload, isPost: true )
        session.request(request!).response { response in
            debugPrint("status code response :\(response.response?.statusCode ?? 1)")
            switch response.result{
            case .success(let data):
                if  let data = data , let utf8Text = String(data: data, encoding: .utf8){
                    completion(.success(utf8Text))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}

extension HttpClient {

    private func makeRequest(_ url : URL,payload:String?,isPost:Bool) -> URLRequest?{
        var request = URLRequest(url: url)
        request.httpMethod = isPost ? HTTPMethod.post.rawValue : HTTPMethod.get.rawValue
        if payload != nil {
            let data = (payload!.data(using: .utf8))! as Data
            request.httpBody = data
        }
        return request
    }
}

