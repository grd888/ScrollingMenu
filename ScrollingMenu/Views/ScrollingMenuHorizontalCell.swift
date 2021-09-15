//
//  ScrollingMenuHorizontalCell.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

class ScrollingMenuHorizontalCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func configure(with viewModel: ScrollingMenuHorizontalViewModel<UIImage>) {
        titleLabel.text = viewModel.cellTitle
    }
}
