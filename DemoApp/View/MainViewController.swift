// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation
import UIKit


class TablePrayerController {

}

class MainViewController: BaseViewController{
    //UITableViewDelegate,UITableViewDataSource,{

    @IBOutlet var tableView : UITableView!
    @IBOutlet var btnDate : UIButton!
    @IBOutlet var tblViewHeight: NSLayoutConstraint!

    @IBOutlet var collectionPageController : CollectionPageController!

    let tableController: TablePrayerController? = nil
    var picturesArray = [Picture]()

    let date = Date(timeIntervalSince1970: 1590253536)


    var mainloader : ArticlePictureLoader?

    private var dailyInspirationLoader = RemoteDailyLoader.init(type: .inspiration)
    private var dailyQuoteLoader = RemoteDailyLoader.init(type: .quote)
    private var dailyInspiration = ""
    private  var dailyQuote = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllData()
    }

    func refreshCollection(_ pictures:[Picture]) {
        DispatchQueue.main.async { [weak self] in
           guard let self = self else { assertionFailure(); return }
            self.collectionPageController!.setup(model: pictures)
        }
    }

    func loadAllData(){

        self.mainloader!.load(articles: nil, date: date.toString()) { [weak self](result) in
            guard let self = self else { assertionFailure(); return }
            switch result{
            case .success(let tuple):
                let pictures = tuple.0
                let articles = tuple.1
                self.refreshCollection(pictures)
                print ("success \(pictures),\(articles.count)")
            case .failure(let error):
                print("error in main load \(error)")
            }
        }

        self.dailyQuoteLoader.load { [weak self](result) in
            guard let self = self else { assertionFailure(); return }
            switch result{
            case .success(let result):
                self.dailyQuote = result
            case .failure(let error):
                print(error)
            }
        }

        self.dailyInspirationLoader.load { [weak self](result) in
            guard let self = self else { assertionFailure(); return }
            switch result{
            case .success(let result):
                self.dailyInspiration = result
            case .failure(let error):
                print(error)
            }
        }
    }

    //func setupViewData(with date: Date?) {
    //
    //    let ddmmyyDate = Utility.getDDMMYYFrom(date)
    //    resetViewModels()
    //    self.dateTitleFromDate = date
    //    self.picturesIconArrayFromDateString = ddmmyyDate
    //    generateArticles(forDateString: ddmmyyDate)
    //    self.nashraTableViewContentForDate = date
    //}
    //
    //func resetViewModels() {
    //    tableSectionsArray.removeAll()
    //    pictureIconsArray.removeAll()
    //}
    //
    //func setupReloadViews() {
    //    iconCollectionView.reloadData()
    //    tableView.reloadData()
    //    setupPageControlCurrentPage(0)
    //    tblViewHeight.constant = tableView.contentSize.height
    //    view.updateConstraints()
    //    mainScrollView.scrollsToTop = true
    //    mainScrollView.contentOffset = CGPoint.zero
    //}

}
