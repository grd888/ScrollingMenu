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
    
    var viewModel: ScrollingMenuHorizontalViewModel<UIImage>!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func configure(with viewModel: ScrollingMenuHorizontalViewModel<UIImage>) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.cellTitle
        
        collectionView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.reloadData()
    }
}

extension ScrollingMenuHorizontalCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HorizontalItemCell.self), for: indexPath) as! HorizontalItemCell
        let menuItem = viewModel.menuItems[indexPath.item]
        cell.itemTitle.text = menuItem.title
        cell.itemImageView.image = UIImage(named: menuItem.imageName)!
        
        return cell
    }
}

extension ScrollingMenuHorizontalCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let SPACING: CGFloat = 10.0
        let side = (width - SPACING) / 2
        print("Item size: \(side)")

        return CGSize(width: side , height: side)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
}
