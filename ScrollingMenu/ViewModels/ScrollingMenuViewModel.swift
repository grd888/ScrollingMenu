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
        case horizontal(ScrollingMenuHorizontalViewModel<UIImage>)
        case single(ScrollingMenuSingleViewModel<UIImage>)
    }
    var imageLoader: ImageDataLoader = ImageDataLoaderService()
    
    lazy var sections: [SectionType] = [
//        .grid(ScrollingMenuGridViewModel()),
        .horizontal(ScrollingMenuHorizontalViewModel(title: "My QA Tower", items: systemItems)),
        .single(ScrollingMenuSingleViewModel(data: developedBy,
                                             imageLoader: imageLoader,
                                             imageTransformer: UIImage.init)),
        .horizontal(ScrollingMenuHorizontalViewModel(title: "About QA Tower", items: aboutItems)),
        .single(ScrollingMenuSingleViewModel(data: managedBy,
                                             imageLoader: imageLoader,
                                             imageTransformer: UIImage.init))
    ]
    
    private var developedBy: TitleImageURL
    private var managedBy: TitleImageURL
    private var systemItems: [TitleImageData]
    private var aboutItems: [TitleImageData]
    
    init(developedBy: TitleImageURL,
         managedBy: TitleImageURL,
         systemItems: [TitleImageData],
         aboutItems: [TitleImageData]) {
        self.developedBy = developedBy
        self.managedBy = managedBy
        self.systemItems = systemItems
        self.aboutItems = aboutItems
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func section(at index: Int) -> SectionType {
        return sections[index]
    }
    
}
