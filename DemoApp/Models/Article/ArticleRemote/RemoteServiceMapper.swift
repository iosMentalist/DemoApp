// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

class RemoteArticleMapper{

    static func map(_ result:String) -> [Article]{
        var array = [Article]()
        if let dicts = result.convertToDictionary(){
            for dict in dicts {
                let remoteArticle = RemoteArticle(fromDict: dict["service"] as! [String:Any])
                array.append(remoteArticle.toArticle())
            }
        }
        return array
    }
}
