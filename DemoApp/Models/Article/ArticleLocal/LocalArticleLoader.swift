// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation



final class LocalArticleLoader{

    private let store: ArticleStore
//    private let currentDate: () -> Date

    public init(store: ArticleStore) {
        self.store = store
    }

}

extension LocalArticleLoader : ArticleLoader {


    func load(articles : [String:String]? = nil, date:String, completion: @escaping (ArticleLoaderResult) -> Void) {

        print("load local for date: \(date)")
        store.retrieve(date: date) { (result) in
            switch result{
            case .success(let local):
                print("load local : \(local.map{$0.name})")
                completion(.success(local.toModels()))

            case .failure(let error):
                print("load locally fail \(error)")
                completion(.failure(.dbError))

            }
        }
    }
}

extension LocalArticleLoader : ArticleCache {
    func save(articles: [Article], completion: @escaping (CacheResult) -> Void) {
        debugPrint("save articles \(articles.map{$0.name})")

            store.insert(articles: articles.toLocal()) { (result) in
             switch result{
             case .success():
                 print("insert finished success")
                 completion(result)


             case .failure(let error):
                 print("insert finished in fail \(error)")
                completion(.failure(error))

             }
        }
    }

}
