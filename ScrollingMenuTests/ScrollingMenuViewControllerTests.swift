//
//  ScrollingMenuViewControllerTests.swift
//  ScrollingMenuTests
//
//  Created by GD on 9/14/21.
//

import XCTest
import UIKit
@testable import ScrollingMenu

class ScrollingMenuViewControllerTests: XCTestCase {

    func test_sut_tableViewOutletShouldBeSet() {
        let (sut, _) = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_sut_tableViewDataSourceAndDelegateShouldBeSet() {
        let (sut, _) = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func test_sutOnViewLoad_displaysCorrectNumberOfSections() {
        let (sut, viewModel) = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.tableView.numberOfSections, viewModel.numberOfSections())
    }
    
    func test_sut_tableShouldHaveOneRowPerSection() {
        let (sut, _) = makeSUT()
        
        sut.loadViewIfNeeded()
        
        for section in 0 ..< sut.tableView.numberOfSections {
            XCTAssertEqual(sut.tableView.numberOfRows(inSection: section), 1)
        }
    }
    
    // MARK: - Helper
    
    func makeSUT() -> (sut: ScrollingMenuViewController, viewModel: ScrollingMenuViewModelSpy) {
        let viewModel = ScrollingMenuViewModelSpy()
        let storyboard = UIStoryboard(name: "ScrollingMenu", bundle: Bundle(for: ScrollingMenuViewController.self))
        let sut = storyboard.instantiateInitialViewController() as! ScrollingMenuViewController
        sut.viewModel = viewModel
        
        return (sut, viewModel)
    }

}
