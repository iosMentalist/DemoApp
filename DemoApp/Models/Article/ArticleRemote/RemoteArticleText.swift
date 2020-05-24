// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

struct RemoteArticleText {
    var choiceID: Int
    var articleID: Int
    var articlePart: Int
    var articleText: String
    var articleTextID: Int
    var articleTextTypeID: Int
    var userTypeID: Int

    private enum CodingKeys : String, CodingKey {
        case choiceID = "ChoiceID",
        articleID = "ServiceID",
        articlePart = "ServicePart",
        articleText = "ServiceText",
        articleTextTypeID = "ServiceTextTypeID",
        articleTextID = "ServiceTextID",
        userTypeID = "UserTypeID"
    }
    init(fromDict dict: [String:Any]){
        self.choiceID = dict[CodingKeys.choiceID.rawValue] as! Int
        self.articleID = dict[CodingKeys.articleID.rawValue] as! Int
        self.articlePart = dict[CodingKeys.articlePart.rawValue] as! Int
        self.articleText = dict[CodingKeys.articleText.rawValue] as! String
        self.articleTextTypeID = dict[CodingKeys.articleTextTypeID.rawValue] as! Int
        self.articleTextID = dict[CodingKeys.articleTextID.rawValue] as! Int
        self.userTypeID =  dict[CodingKeys.userTypeID.rawValue] as! Int
    }

    func toArticleText() -> ArticleText{
        return ArticleText(articleText: self.articleText)
    }
}
