//
//  ScrollingMenuHorizontalCellController.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

final class ScrollingMenuHorizontalCellController: CellController {
    private let viewModel: ScrollingMenuHorizontalViewModel<UIImage>
    private var cell: ScrollingMenuHorizontalCell!
    
    init(viewModel: ScrollingMenuHorizontalViewModel<UIImage>) {
        self.viewModel = viewModel
    }
    
    func cancelLoad() {
        
    }
    
    func preload() {
        
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
        cell.configure(with: viewModel)
        return cell
    }
}
