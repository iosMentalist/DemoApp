// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation
class RemoteArticleLoader : ArticleLoader {

    let client : HttpClient
    init() {
        self.client = HttpClient.shared
    }
    func load(articles : [String:String]? = nil,date:String, completion: @escaping (ArticleLoaderResult) -> Void) {
       let payload = "";

        let url = URL(string: "https://testapi.io/api/shadyk/main")!
        //FIXME: shady
        client.postRequset(url: url,payload: payload) { (result) in
            switch result {
            case .success(let responseString):
                completion(.success(RemoteArticleMapper.map(responseString)))
            case .failure(let error):
                completion(.failure(.otherError(error)))
            }
        }
        
    }
}
