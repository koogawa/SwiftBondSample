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
    var items = ObservableArray<ObservableArray<Venue>>([])
    let disposeBag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()
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
}
