//
//  GridItemCell.swift
//  ScrollingMenu
//
//  Created by GD on 9/16/21.
//

import UIKit

class GridItemCell: UICollectionViewCell {
    @IBOutlet weak var itemContainer: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    func configure(with model: TitleImageData) {
        itemImage.image = UIImage(named: model.imageName)
        itemLabel.text = model.title
    }
}
