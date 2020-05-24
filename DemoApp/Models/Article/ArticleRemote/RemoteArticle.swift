// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

struct RemoteArticle {
    var categoryID: Int
    var articleDate: String
    var articleGenerationDate: String
    var articleID: Int
    var articleName: String
    var articleOrder: Int
    var articleTypeID: Int
    var articleTexts: [RemoteArticleText]

    private enum CodingKeys : String, CodingKey {
        case categoryID = "CategoryID",
        articleDate = "ServiceDate",
        articleGenerationDate = "ServiceGenerationDate",
        articleID = "ServiceID",
        articleName = "ServiceName",
        articleOrder = "ServiceOrder",
        articleTypeID = "ServiceTypeID",
        articleTexts = "serviceTexts"
    }

    init(fromDict dict: [String:Any]){
        self.categoryID = dict[CodingKeys.categoryID.rawValue] as! Int
        self.articleDate = dict[CodingKeys.articleDate.rawValue] as! String
        self.articleGenerationDate = dict[CodingKeys.articleGenerationDate.rawValue] as! String
        self.articleID = dict[CodingKeys.articleID.rawValue] as! Int
        self.articleName = (dict[CodingKeys.articleName.rawValue] as! String).stripHTML()
        self.articleOrder = dict[CodingKeys.articleOrder.rawValue] as! Int
        if let articleTextDicts =  dict[CodingKeys.articleTexts.rawValue] as? [[String:Any]]{
            self.articleTexts = articleTextDicts.map{RemoteArticleText(fromDict: $0)}
        }else{
            self.articleTexts = []
        }
        self.articleTypeID = dict[CodingKeys.articleTypeID.rawValue] as! Int
    }


    func toArticle() -> Article{
        let dateFormat = DateFormatter.init()
        dateFormat.dateFormat = "yyyy-MM-dd"
        let date = dateFormat.date(from: self.articleDate) ?? Date()
        let texts  = self.articleTexts
        return Article(ID: "\(self.articleID)", date: date, name: self.articleName, category: Category(rawValue: self.categoryID) ?? .unknown, articleTypeId: self.articleTypeID, articleTexts: texts.map{$0.toArticleText()})
    }
}

