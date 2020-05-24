// Copyright © 2020 Shady Kahaleh. All rights reserved.

import UIKit

class MainViewComposer {
    static var store : CoreDataStore!
    static var pictureLoader : LocalPictureLoader!
    static var remoteArticle : RemoteArticleLoader!
    static var localArticle  : LocalArticleLoader!
    static var composite  : ArticleLoaderWithFallbackComposite!
    static var cacheDecorater : ArticleLoaderCacheDecorator!
    static var mainloader : ArticlePictureLoader?
    static func create() -> MainViewController{
        store = try! CoreDataStore(storeName: "Store.sqlite")
        pictureLoader = LocalPictureLoader(store: store)
        remoteArticle = RemoteArticleLoader()
        localArticle = LocalArticleLoader(store: store)
        cacheDecorater = ArticleLoaderCacheDecorator(decoratee: remoteArticle, cache: localArticle)
        composite = ArticleLoaderWithFallbackComposite(primary: cacheDecorater, fallback: self.remoteArticle)
        
        mainloader = ArticlePictureLoader(articleLoader: composite, pictureLoader: pictureLoader)

        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        vc.mainloader = mainloader
        return vc
    }
}
