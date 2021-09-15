//
//  HorizontalItemCell.swift
//  ScrollingMenu
//
//  Created by GD on 9/15/21.
//

import UIKit

class HorizontalItemCell: UICollectionViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var menuItemContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        menuItemContainer.layer.borderWidth = 1.0
        menuItemContainer.layer.borderColor = UIColor.lightGray.cgColor
        menuItemContainer.layer.cornerRadius = 10.0
    }
    
}
