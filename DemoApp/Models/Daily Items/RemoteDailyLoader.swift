// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

final class RemoteDailyLoader : DailyLoader {
    let client = HttpClient()
    let type : DailyItemType
    init(type:DailyItemType) {
        self.type = type
    }

    func load(completion: @escaping (DailyLoaderResult) -> Void) {
        let DAILY_DOMAIN = "http://www.quartos.org.lb/iTypikon/dailyquote/"
        let api = type == .inspiration ? "dailyinspiration.php" : "dailyquote.php"
        let url = URL(string: DAILY_DOMAIN + api )
        client.getRequest(url: url!, payload: nil) { (result) in
            switch result{
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }

    }

    



}
