//
//  ViewController.swift
//  SwiftBondSample
//
//  Created by Kosuke Ogawa on 2016/06/12.
//  Copyright © 2016 koogawa. All rights reserved.
//

import UIKit
import Bond
import SafariServices

class ViewController: UITableViewController {

    var viewModel = ViewModel()
    var dataSource = DataSource()
    var delegate = Delegate()
    var items = ObservableArray<ObservableArray<Venue>>([])
    let disposeBag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        // RxSwift
//        self.viewModel.venues
//            .asDriver()
//            .drive (
//                self.tableView.rx_itemsWithDataSource(self.dataSource)
//            )
//            .addDisposableTo(self.disposeBag)
        self.items = ObservableArray([self.viewModel.venues])
        self.items.bindTo(self.tableView, proxyDataSource: self.dataSource) { (indexPath, items, tableView) in
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            let item = items[indexPath.section][indexPath.row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = item.address
            return cell
        }
        self.viewModel.fetch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let venue = self.viewModel.venues.array[indexPath.row]
        let urlString = "https://foursquare.com/v/" + venue.venueId
        if let url = NSURL(string: urlString) {
            let safariViewController = SFSafariViewController(URL: url)
            self.presentViewController(
                safariViewController,
                animated: true,
                completion: nil
            )
        }
    }
}
