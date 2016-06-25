//
//  Delegate.swift
//  SwiftBondSample
//
//  Created by Kosuke Ogawa on 2016/06/12.
//  Copyright © 2016 koogawa. All rights reserved.
//

import UIKit
import SafariServices

extension ViewController {

    // MARK: - UITableView Delegate

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
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
