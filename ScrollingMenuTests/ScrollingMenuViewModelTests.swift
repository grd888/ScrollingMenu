//
//  ScrollingMenuViewModelTests.swift
//  ScrollingMenuTests
//
//  Created by GD on 9/14/21.
//

import XCTest
@testable import ScrollingMenu

class ScrollingMenuViewModelTests: XCTestCase {

    func test_viewModel_containsSectionsInCorrectOrder() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.sections, [
            .grid,
            .horizontal,
            .single,
            .horizontal,
            .single
        ], "Sections should be in correct order and count")
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> ScrollingMenuViewModelSpy {
        let sut = ScrollingMenuViewModelSpy()
        return sut
    }
}

