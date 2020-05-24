// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

struct LocalArticle {
    var ID : String
    var date : String
    var name : String
    var category : Category
    var articleTypeId : Int
    var articleTexts : [LocalArticleText]
}

//MARK: - mappers from Article from/to LocalArticle
extension Array where Element == Article {
    func toLocal() -> [LocalArticle] {
        return map { LocalArticle(ID: $0.ID, date: $0.date.toString(), name: $0.name, category: $0.category, articleTypeId: $0.articleTypeId, articleTexts: $0.articleTexts.toLocal()) }
    }
}

extension Array where Element == LocalArticle {
    func toModels() -> [Article] {
        return map { Article(ID: $0.ID, date: $0.date.toDate()!, name: $0.name, category: $0.category, articleTypeId: $0.articleTypeId, articleTexts: $0.articleTexts.toModels()) }
    }
}
