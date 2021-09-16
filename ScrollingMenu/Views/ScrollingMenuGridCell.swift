//
//  ScrollingMenuGridCell.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

class ScrollingMenuGridCell: UITableViewCell {
    
    @IBOutlet weak var collectionContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: ScrollingMenuGridViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func configure(with viewModel: ScrollingMenuGridViewModel) {
        self.viewModel = viewModel
    }
}

extension ScrollingMenuGridCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.gridItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GridItemCell.self), for: indexPath) as! GridItemCell
        let menuItem = viewModel.gridItems[indexPath.item]
        cell.configure(with: menuItem)
        
        return cell
    }
}

extension ScrollingMenuGridCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return viewModel.sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = viewModel.itemSize(forTotalWidth: collectionView.bounds.width)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectItem(at: indexPath.item)
    }
}
