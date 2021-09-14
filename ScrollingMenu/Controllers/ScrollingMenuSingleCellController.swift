//
//  ScrollingMenuSingleCellController.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

final class ScrollingMenuSingleCellController {
    private let viewModel: ScrollingMenuSingleViewModel<UIImage>
    private var cell: ScrollingMenuSingleCell?
    
    init(viewModel: ScrollingMenuSingleViewModel<UIImage>) {
        self.viewModel = viewModel
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        let cell = bind(tableView.dequeueReusableCell())
        viewModel.loadImageData()
        return cell
    }
    
    func preload() {
        viewModel.loadImageData()
    }
    
    func cancelLoad() {
        releaseCellForReuse()
        viewModel.cancelImageDataLoad()
    }
    
    private func bind(_ cell: ScrollingMenuSingleCell) -> ScrollingMenuSingleCell {
        self.cell = cell
        
        cell.headerLabel.text = viewModel.title
        
        viewModel.onImageLoad = { [weak self] image in
            self?.cell?.bannerImageView.setImageAnimated(image)
        }
        
        viewModel.onImageLoadingStateChange = { [weak self] isLoading in
            self?.cell?.imageContainer.isShimmering = isLoading
        }
        
        return cell
    }
    
    private func releaseCellForReuse() {
        cell = nil
    }
}
