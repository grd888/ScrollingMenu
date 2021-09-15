//
//  TestHelpers.swift
//  ScrollingMenuTests
//
//  Created by GD on 9/14/21.
//

import Foundation
@testable import ScrollingMenu

func anyTitleImageData() -> TitleImageURL {
    return TitleImageDataMock(title: "any title", imageURL: URL(string: "http://anyurl.com")!)
}

struct TitleImageDataMock: TitleImageURL {
    var title: String
    var imageURL: URL
}

func imageLoader() -> ImageDataLoader {
    return ImageDataLoaderService()
}
