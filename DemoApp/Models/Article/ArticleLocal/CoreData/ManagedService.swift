// Copyright © 2020 Shady Kahaleh. All rights reserved.

import CoreData

@objc(ManagedArticle)
class ManagedArticle: NSManagedObject {
    @NSManaged var categoryId: Int16
    @NSManaged var articleTypeId: Int16
    @NSManaged var name: String
    @NSManaged var date: String
    @NSManaged var id: String
    @NSManaged var articleTexts: NSOrderedSet
}


extension ManagedArticle {
    static func find(in context: NSManagedObjectContext) throws -> ManagedArticle? {
        let request = NSFetchRequest<ManagedArticle>(entityName: entity().name!)
        request.returnsObjectsAsFaults = false
        return try context.fetch(request).first
    }

    static func find(date:String, context: NSManagedObjectContext) throws -> [ManagedArticle]? {
        let request = NSFetchRequest<ManagedArticle>(entityName: entity().name!)
        request.predicate = NSPredicate(format: "%K = %@", argumentArray: [#keyPath(ManagedArticle.date), date])
        request.returnsObjectsAsFaults = false
        return try context.fetch(request)
    }

    static func find(date:String, categoryId:Int16, context: NSManagedObjectContext) throws -> [ManagedArticle]? {
        let request = NSFetchRequest<ManagedArticle>(entityName: entity().name!)
        request.predicate = NSPredicate(format: "%K = %@ AND %K = %@", argumentArray: [#keyPath(ManagedArticle.date),date,#keyPath(ManagedArticle.categoryId), categoryId])
        request.returnsObjectsAsFaults = false
        return try context.fetch(request)
    }

    static func newUniqueInstance(in context: NSManagedObjectContext) throws -> ManagedArticle {
//        try find(in: context).map(context.delete)
        return ManagedArticle(context: context)
    }

    var localArticle : LocalArticle {
        let managedArticleTexts : [ManagedArticleText] = self.articleTexts.array as! [ManagedArticleText]
        return LocalArticle(ID: "\(self.id)", date: self.date, name: self.name, category: Category(rawValue: Int(self.categoryId)) ?? .unknown, articleTypeId: Int(self.articleTypeId), articleTexts: managedArticleTexts.map{$0.localArticleText})
    }

//    var localFeed: [LocalFeedImage] {
//        return feed.compactMap { ($0 as? ManagedFeedImage)?.local }
//    }
}
