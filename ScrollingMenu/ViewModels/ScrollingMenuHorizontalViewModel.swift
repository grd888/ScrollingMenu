//
//  ScrollingMenuHorizontalViewModel.swift
//  ScrollingMenu
//
//  Created by GD on 9/15/21.
//

import Foundation

protocol TitleImageData {
    var title: String { get }
    var imageData: Data { get }
}

class ScrollingMenuHorizontalViewModel<Image> {
    typealias Observer<T> = (T) -> Void
    
    private var task: ImageDataLoaderTask?
    
    private let title: String
    private let items: [TitleImageData]
    private let imageTransformer: (Data) -> Image?
    
    init(title: String,
         items: [TitleImageData],
         imageTransformer: @escaping (Data) -> Image?) {
        
        self.title = title
        self.items = items
        self.imageTransformer = imageTransformer
    }
    
    var cellTitle: String {
        return title
    }
}
