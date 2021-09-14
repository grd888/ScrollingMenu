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

    func test_viewController_tableViewOutletShouldBeSet() {
        let sut = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_viewController_tableViewDataSourceAndDelegateShouldBeSet() {
        let sut = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    // MARK: - Helper
    
    func makeSUT() -> ScrollingMenuViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: ScrollingMenuViewController.self))
        let sut = storyboard.instantiateInitialViewController() as! ScrollingMenuViewController
        
        return sut
    }

}
