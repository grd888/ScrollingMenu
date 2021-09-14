//
//  ScrollingMenuViewModelTests.swift
//  ScrollingMenuTests
//
//  Created by GD on 9/14/21.
//

import XCTest
@testable import ScrollingMenu

class ScrollingMenuViewModelTests: XCTestCase {

    typealias Section = ScrollingMenuViewModel.SectionType
    
    func test_viewModel_containsSectionsInCorrectOrder() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.sections, [
            .grid(ScrollingMenuGridViewModel()),
            .horizontal(ScrollingMenuHorizontalViewModel()),
            .single(ScrollingMenuSingleViewModel()),
            .horizontal(ScrollingMenuHorizontalViewModel()),
            .single(ScrollingMenuSingleViewModel())
        ], "Sections should be in correct order and count")
    }
    
    func test_viewModel_deliversCorrectNumberOfSections() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.numberOfSections(), sut.sections.count)
    }
    
    func test_sut_deliversCorrectSectionBasedOnIndex() {
        let sut = makeSUT()
        
        for (index, section) in sut.sections.enumerated() {
            XCTAssertEqual(sut.section(at: index), section)
        }
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> ScrollingMenuViewModelSpy {
        let sut = ScrollingMenuViewModelSpy()
        return sut
    }
}

