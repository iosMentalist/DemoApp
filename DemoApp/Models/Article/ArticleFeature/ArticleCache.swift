// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

protocol ArticleCache {
    typealias CacheResult = Swift.Result<Void,Error>

    func save(articles :[Article], completion: @escaping(CacheResult)->Void)
}
