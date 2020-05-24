// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

final class LocalPictureLoader {
    private let store: ArticleStore
    public init(store: ArticleStore) {
        self.store = store
    }
}


extension LocalPictureLoader : PictureLoader {
    func load(date: String, completion: @escaping (PictureLoaderResult) -> Void) {
        
        store.getPictures(date: date) { (result) in
            switch result{
            case .success(let pictures):
                print("get picture success \(pictures)")
                completion(.success(pictures))

            case .failure(let error):
                print("getPictures fail \(error)")
                completion(.failure(error))
            }
        }
    }
}
