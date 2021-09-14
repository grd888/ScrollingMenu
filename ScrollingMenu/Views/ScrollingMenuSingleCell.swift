//
//  ScrollingMenuSingleCell.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

class ScrollingMenuSingleCell: UITableViewCell {
    @IBOutlet private(set) weak var headerLabel: UILabel!
    @IBOutlet private(set) weak var bannerImageView: UIImageView!
    @IBOutlet private(set) weak var imageContainer: UIView!
    
    func configure(with viewModel: ScrollingMenuSingleViewModel<UIImage>) {
        headerLabel.text = viewModel.title
    }
}
