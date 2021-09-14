//
//  ScrollingMenuViewModel.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import Foundation
import UIKit

class ScrollingMenuViewModel {
    enum SectionType: Equatable {
        static func == (lhs: ScrollingMenuViewModel.SectionType, rhs: ScrollingMenuViewModel.SectionType) -> Bool {
            return true
        }
        
        case grid(ScrollingMenuGridViewModel)
        case horizontal(ScrollingMenuHorizontalViewModel)
        case single(ScrollingMenuSingleViewModel<UIImage>)
    }
    var imageLoader: ImageDataLoader = ImageDataLoaderService()
    
    lazy var sections: [SectionType] = [
        .grid(ScrollingMenuGridViewModel()),
        .horizontal(ScrollingMenuHorizontalViewModel()),
        .single(ScrollingMenuSingleViewModel(data: developedBy,
                                             imageLoader: imageLoader,
                                             imageTransformer: UIImage.init)),
        .horizontal(ScrollingMenuHorizontalViewModel()),
        .single(ScrollingMenuSingleViewModel(data: managedBy,
                                             imageLoader: imageLoader,
                                             imageTransformer: UIImage.init))
    ]
    
    private var developedBy: TitleImageData
    private var managedBy: TitleImageData
    
    init(developedBy: TitleImageData, managedBy: TitleImageData) {
        self.developedBy = developedBy
        self.managedBy = managedBy
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func section(at index: Int) -> SectionType {
        return sections[index]
    }
    
}
