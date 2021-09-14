//
//  CellController.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

protocol CellController {
    func cancelLoad()
    func preload()
    func view(in tableView: UITableView) -> UITableViewCell
}
