//
//  ScrollingMenuGridViewModel.swift
//  ScrollingMenu
//
//  Created by GD on 9/16/21.
//

import UIKit

struct ScrollingMenuGridViewModel {
    
    var gridItems: [TitleImageData]
    let H_INSET: CGFloat = 8.0
    let V_INSET: CGFloat = 16.0
    let ITEMS_PER_ROW: CGFloat = 4
    let CELL_ASPECT_RATIO: CGFloat = 9.0 / 8.0
    
    init(gridItems: [TitleImageData]) {
        self.gridItems = gridItems
    }
    
    var sectionInsets: UIEdgeInsets {
        return UIEdgeInsets(top: V_INSET, left: H_INSET, bottom: V_INSET, right: H_INSET)
    }
    
    func computedCellHeight(forTableWidth totalWidth: CGFloat) -> CGFloat {
        let size = itemSize(forTotalWidth: totalWidth)
        let rows = (CGFloat(gridItems.count) / ITEMS_PER_ROW)
        return size.height * rows + 2 * V_INSET
    }
    
    func itemSize(forTotalWidth totalWidth: CGFloat) -> CGSize  {
        let cellWidth = (totalWidth - 2 * H_INSET) / ITEMS_PER_ROW
        let cellHeight = cellWidth * CELL_ASPECT_RATIO
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
