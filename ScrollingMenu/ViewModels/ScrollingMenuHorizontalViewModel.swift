//
//  ScrollingMenuHorizontalViewModel.swift
//  ScrollingMenu
//
//  Created by GD on 9/15/21.
//

import Foundation

protocol TitleImageData {
    var title: String { get }
    var imageName: String { get }
}

class ScrollingMenuHorizontalViewModel<Image> {
    private var task: ImageDataLoaderTask?
    
    private let title: String
    private let items: [TitleImageData]
    
    var didSelectItem: ((TitleImageData) -> Void)?
    
    init(title: String,
         items: [TitleImageData]) {
        
        self.title = title
        self.items = items
    }
    
    var cellTitle: String {
        return title
    }
    
    var menuItems: [TitleImageData] {
        return items
    }
    
    func selectItem(at index: Int) {
        didSelectItem?(items[index])
    }
}
