// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation


struct LocalArticleText{
    var text: String
    var articleText : ArticleText {
        return ArticleText(articleText: text)
    }
}
//MARK: Mapper from/to ArticleText , LocalArticleText
extension Array where Element == ArticleText {
    func toLocal() -> [LocalArticleText] {
        return map { LocalArticleText(text: $0.articleText) }
    }
}

extension Array where Element == LocalArticleText {
    func toModels() -> [ArticleText] {
        return map { ArticleText(articleText: $0.articleText.articleText) }
    }
}
