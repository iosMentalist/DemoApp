//
//  Copyright © 2019 . All rights reserved.
//

import Foundation

/* IMPLEMENTING CACHING FEATRUE */

final class ArticleLoaderCacheDecorator: ArticleLoader {
	private let decoratee: ArticleLoader
	private let cache: ArticleCache
	
	init(decoratee: ArticleLoader, cache: ArticleCache) {
		self.decoratee = decoratee
		self.cache = cache
	}

    func load(articles: [String : String]?, date: String, completion: @escaping (ArticleLoaderResult) -> Void) {
        decoratee.load(articles: articles, date: date) { [weak self] result in
            completion(result.map { feed in
                self?.cache.saveIgnoringResult(feed)
                return feed
            })
        }
    }
}

private extension ArticleCache {
	func saveIgnoringResult(_ article: [Article]) {
        save(articles: article) { _ in }
	}
}
