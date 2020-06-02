//
//  Copyright © 2019 . All rights reserved.
//
import Foundation


/* COMBINING ARTICLE AND PICTURE DECORATOR */

final class ArticlePictureLoader  {
    typealias ArticlePictureLoaderLoaderResult = Swift.Result<([Picture],[Article]), Error>
    private let articleLoader: ArticleLoader
    private let pictureLoader: PictureLoader

    init(articleLoader: ArticleLoader, pictureLoader: PictureLoader) {
        self.articleLoader = articleLoader
        self.pictureLoader = pictureLoader
    }

    func load(articles: [String : String]?, date: String, completion: @escaping (ArticlePictureLoaderLoaderResult) -> Void) {
        articleLoader.load(articles: articles, date: date) { [weak self] result in
            guard let self = self else { assertionFailure(); return }
            switch result {
            case .success(let articlesResult):
                self.loadPictures(date:date, articles: articlesResult, completion:completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    private func loadPictures(date:String,articles:[Article], completion:@escaping (ArticlePictureLoaderLoaderResult) -> Void){
        self.pictureLoader.load(date: date) { (result) in
            switch  result {
            case .success(let picture):
                completion(.success((picture, articles)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
