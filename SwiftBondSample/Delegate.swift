//
//  Delegate.swift
//  SwiftBondSample
//
//  Created by Kosuke Ogawa on 2016/06/12.
//  Copyright © 2016 koogawa. All rights reserved.
//

import UIKit

public final class Delegate: NSObject, UITableViewDelegate {

    // MARK: - UITableView Delegate

    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
