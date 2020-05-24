//
//  Copyright © 2019. All rights reserved.
//
import Foundation

class ArticleLoaderWithFallbackComposite: ArticleLoader {
    private let primary: ArticleLoader
    private let fallback: ArticleLoader

    init(primary: ArticleLoader, fallback: ArticleLoader) {
        self.primary = primary
        self.fallback = fallback
    }

    func load(articles: [String : String]?, date: String, completion: @escaping (ArticleLoaderResult) -> Void) {
        primary.load(articles: articles, date: date) { [weak self](result) in
            guard self != nil else {assertionFailure(); return }
            switch result {
            case .success(let articleArray):
                if articleArray.count > 0 {
                    completion(.success(articleArray))
                }
                else{
                    self!.fallback.load(articles: articles, date: date, completion: completion)
                }

            case .failure:
                self!.fallback.load(articles: articles, date: date, completion: completion)
            }
        }
    }
}
