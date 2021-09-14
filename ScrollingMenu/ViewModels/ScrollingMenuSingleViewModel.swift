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

class ScrollingMenuSingleViewModel<Image> {
    typealias Observer<T> = (T) -> Void
    
    private var task: ImageDataLoaderTask?
    private let data: TitleImageData
    private let imageLoader: ImageDataLoader
    private let imageTransformer: (Data) -> Image?
    
    init(data: TitleImageData, imageLoader: ImageDataLoader, imageTransformer: @escaping (Data) -> Image?) {
        self.data = data
        self.imageLoader = imageLoader
        self.imageTransformer = imageTransformer
    }
    
    var title: String {
        data.title
    }
    var url: URL {
        data.imageURL
    }
    
    var onImageLoad: Observer<Image>?
    var onImageLoadingStateChange: Observer<Bool>?
    
    func loadImageData() {
        onImageLoadingStateChange?(true)
        task = imageLoader.loadImageData(from: data.imageURL, completion: { [weak self] result in
            self?.handle(result)
        })
    }
    
    private func handle(_ result: ImageDataLoader.Result) {
        if let image = (try? result.get()).flatMap(imageTransformer) {
            onImageLoad?(image)
        }
        onImageLoadingStateChange?(false)
    }
    
    func cancelImageDataLoad() {
        task?.cancel()
        task = nil
    }
}
