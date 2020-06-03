// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation
protocol ArticleStore {
    typealias InsertResult = Swift.Result<Void,Error>
    typealias RetrieveResult = Swift.Result<[LocalArticle],Error>
    typealias GetPicturesResult = Swift.Result<[Picture],Error>

    func insert(articles:[LocalArticle], completion: @escaping(InsertResult)->Void)
    func retrieve(date:String, completion: @escaping(RetrieveResult)->Void)
    func getPictures(date:String, completion: @escaping(GetPicturesResult)->Void)
}
