//
//  ScrollingMenuSingleViewModel.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import Foundation

protocol TitleImageData {
    var title: String { get }
    var imageURL: URL { get }
}

struct ScrollingMenuSingleViewModel {
    var title: String {
        data.title
    }
    var url: URL {
        data.imageURL
    }
    
    private let data: TitleImageData
    init(data: TitleImageData) {
        self.data = data
    }
}
