// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

typealias PictureLoaderResult = Swift.Result<[Picture], Error>

protocol PictureLoader {
    func load(date:String, completion: @escaping (PictureLoaderResult) -> Void)
}


//class func sortPictures(_ pictures: Set<AnyHashable>?) -> [AnyHashable]? {
//    let sortByPictureType = [NSSortDescriptor(key: "pictureClass.displayOrder", ascending: false), NSSortDescriptor(key: "hasPrecedenceWithinSameClass", ascending: false)]
//    return pictures?.sortedArray(usingDescriptors: sortByPictureType)
//}
//
