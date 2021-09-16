//
//  TestHelpers.swift
//  ScrollingMenuTests
//
//  Created by GD on 9/14/21.
//

import Foundation
@testable import ScrollingMenu

func anyTitleImageURL() -> TitleImageURL {
    return TitleImageURLMock(title: "any title", imageURL: URL(string: "http://anyurl.com")!)
}

func anyTitleImageData() -> TitleImageData {
    return TitleImageDataMock(title: "any title", imageName: "image")
}

struct TitleImageURLMock: TitleImageURL {
    var title: String
    var imageURL: URL
}

struct TitleImageDataMock: TitleImageData {
    var title: String
    var imageName: String
}

func imageLoader() -> ImageDataLoader {
    return ImageDataLoaderService()
}
