// Copyright © 2020 Shady Kahaleh. All rights reserved.

import CoreData

@objc(ManagedArticleText)
class ManagedArticleText: NSManagedObject {
    @NSManaged var articleText: String
}

extension ManagedArticleText{
    var localArticleText : LocalArticleText {
        return LocalArticleText(text: articleText)
    }


    static func articlesTexts(from articlesTexts: [LocalArticleText], in context: NSManagedObjectContext) -> NSOrderedSet {
        return NSOrderedSet(array: articlesTexts.map { svcText in
            let managed = ManagedArticleText(context: context)
            managed.articleText = svcText.text
            return managed
        })
    }
}
