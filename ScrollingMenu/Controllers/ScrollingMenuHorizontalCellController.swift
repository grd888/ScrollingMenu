//
//  ScrollingMenuHorizontalCellController.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

final class ScrollingMenuHorizontalCellController: CellController {
    func cancelLoad() {
        
    }
    
    func preload() {
        
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        return ScrollingMenuHorizontalCell()
    }
}
