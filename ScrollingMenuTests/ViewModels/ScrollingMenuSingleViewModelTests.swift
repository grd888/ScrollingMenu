//
//  ScrollingMenuSingleViewModelTests.swift
//  ScrollingMenuTests
//
//  Created by GD on 9/14/21.
//

import XCTest
@testable import ScrollingMenu

class ScrollingMenuSingleViewModelTests: XCTestCase {
    func test_sut_returnsCorrectComputedValues() {
        let title = "a title"
        let url = URL(string: "http://any-url.com")!
        
        let titleImageData = TitleImageDataMock(title: title, imageURL: url)
        let sut = ScrollingMenuSingleViewModel<UIImage>(data: titleImageData, imageLoader: imageLoader() , imageTransformer: UIImage.init)
        
        XCTAssertEqual(sut.title, title)
        XCTAssertEqual(sut.url, url)
    }

}
