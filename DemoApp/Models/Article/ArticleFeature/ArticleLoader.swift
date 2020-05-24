// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

enum ArticleLoaderError : Error{
    case empty
    case dbError
    case otherError(Error)

    init(error:Error) {
        self = .otherError(error)
    }
}

protocol ArticleLoader {
    typealias ArticleLoaderResult = Swift.Result<[Article], ArticleLoaderError>

    func load(articles : [String:String]?,date:String, completion: @escaping (ArticleLoaderResult) -> Void) 
}
