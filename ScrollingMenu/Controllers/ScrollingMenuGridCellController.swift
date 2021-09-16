//
//  ScrollingMenuGridCellController.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

final class ScrollingMenuGridCellController: CellController {
    func cancelLoad() {}
    
    func preload() {}
    
    func cellHeight(forTableWidth tableWidth: CGFloat) -> CGFloat {
        return computedCellHeight(forTableWidth: tableWidth)
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
        cell.configure(with: viewModel)
        return cell
    }
    
    private var viewModel: ScrollingMenuGridViewModel
    private var cell: ScrollingMenuGridCell!
    
    init(viewModel: ScrollingMenuGridViewModel) {
        self.viewModel = viewModel
    }
    
    private func computedCellHeight(forTableWidth totalWidth: CGFloat) -> CGFloat {
        return viewModel.computedCellHeight(forTableWidth: totalWidth)
    }
}
