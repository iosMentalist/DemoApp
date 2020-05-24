// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

enum Category : Int {
    case picture = 1
    case todayArticle = 2
    case sport = 3
    case otherArticles = 4
    case pictureArticle = 5
    case unknown
}

struct Article {
    var ID : String
    var date : Date
    var name : String
    var category : Category
    var articleTypeId : Int
    var articleTexts : [ArticleText]
}
