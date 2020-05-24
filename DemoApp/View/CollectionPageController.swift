// Copyright © 2020 Shady Kahaleh. All rights reserved.

import UIKit
import Kingfisher

class CollectionPageController : NSObject,  UICollectionViewDelegate ,UICollectionViewDataSource {

    @IBOutlet var customCollectionView : UICollectionView!
    @IBOutlet var pageControl : UIPageControl!
    var model : [Picture]?

    func setup(model : [Picture]){
        
        customCollectionView.delegate = self
        self.model = model
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: customCollectionView.bounds.width, height: (customCollectionView.bounds.height))
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.minimumLineSpacing = 0
        customCollectionView.collectionViewLayout = collectionViewLayout
    }

    func setupPageControlCurrentPage(_ currentPage: Int) {
        pageControl.currentPage = currentPage
        pageControl.numberOfPages = model?.count ?? 0
    }
 

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model?.count ?? 0
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionViewCell", for: indexPath) as? IconCollectionViewCell
        let item = model![indexPath.row]
        cell?.imgView.kf.setImage(with: URL(string: item.imageURL))
        cell?.lblTitle.text = item.name
        return cell!

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: customCollectionView.bounds.width, height: (customCollectionView.bounds.height))
    }

}
