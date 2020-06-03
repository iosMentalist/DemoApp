// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

enum DailyItemType {
    case quote, inspiration
}


typealias DailyLoaderResult = Swift.Result<String, Error>

protocol DailyLoader {
    func load(completion:@escaping(DailyLoaderResult)->Void)
}
