// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

extension CoreDataStore : ArticleStore {


    //MARK: - SERVICES
    func insert(articles: [LocalArticle], completion: @escaping (InsertResult) -> Void) {
        debugPrint("saving \(articles.count) articles")
        for svc in articles {
            self.insert(localArticle: svc, completion: completion)
        }
    }

    private func insert(localArticle svc: LocalArticle,completion: @escaping (InsertResult) -> Void){
        perform { context in
            completion( InsertResult{

                let managedArticle = try ManagedArticle.newUniqueInstance(in: context)
                managedArticle.id = svc.ID
                managedArticle.name = svc.name
                managedArticle.date = svc.date
                managedArticle.categoryId = Int16(svc.category.rawValue)
                managedArticle.articleTypeId = Int16(svc.articleTypeId)
                managedArticle.articleTexts =  ManagedArticleText.articlesTexts(from: svc.articleTexts, in: context)
                debugPrint("saving \(managedArticle.name) ")
                try context.save()
            })
        }
    }

    func retrieve(date: String, completion: @escaping (RetrieveResult) -> Void) {
        perform { context in
            completion(RetrieveResult {
                try ManagedArticle.find(date:date, context: context)!.map{
                    $0.localArticle
                }
            })
        }
    }

    //MARK: - FEASTS

    func getPictures(date: String, completion: @escaping (GetPicturesResult) -> Void) {
        perform { context in
            completion(GetPicturesResult{
                try  ManagedArticle.find(date: date, categoryId: Int16(Category.picture.rawValue), context: context)!.map{
                    Picture(name: $0.name, imageURL: ($0.articleTexts.firstObject as! ManagedArticleText).localArticleText.articleText.articleText)
                }
            })
        }
    }

    //MARK: - LENT

    func getSport(date: String, completion: @escaping (RetrieveResult) -> Void) {
        perform { context in
            completion(RetrieveResult{
                try  ManagedArticle.find(date: date, categoryId: Int16(Category.sport.rawValue), context: context)!.map{
                    $0.localArticle
                }
            })
        }
    }

    //MARK: - otherArticles

    func getOtherArticles(date: String, completion: @escaping (RetrieveResult) -> Void) {
        perform { context in
            completion(RetrieveResult{
                try  ManagedArticle.find(date: date, categoryId: Int16(Category.otherArticles.rawValue), context: context)!.map{
                    $0.localArticle
                }
            })
        }
    }

    //MARK: - otherArticles

    func getTodayArticle(date: String, completion: @escaping (RetrieveResult) -> Void) {
        perform { context in
            completion(RetrieveResult{
                try  ManagedArticle.find(date: date, categoryId: Int16(Category.todayArticle.rawValue), context: context)!.map{
                    $0.localArticle
                }
            })
        }
    }


    //    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
    //        perform { context in
    //            completion(Result {
    ////                try ManagedCache.find(in: context).map(context.delete).map(context.save)
    //            })
    //        }
    //    }

}
