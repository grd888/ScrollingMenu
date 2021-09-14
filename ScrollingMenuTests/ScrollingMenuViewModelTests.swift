//
//  ScrollingMenuViewModelTests.swift
//  ScrollingMenuTests
//
//  Created by GD on 9/14/21.
//

import XCTest

class ScrollingMenuViewModel {
    enum SectionType {
        case grid
        case horizontal
        case single
    }
    
    func numberOfSections() -> Int {
        return 5
    }
}

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

private class ScrollingMenuViewModelSpy: ScrollingMenuViewModel {
    let sections: [SectionType] = [
        .grid,
        .horizontal,
        .single,
        .horizontal,
        .single
    ]
}
