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
            let rowCount = sut.tableView(sut.tableView, numberOfRowsInSection: section)
            XCTAssertEqual(rowCount, 1, "Expected 1, got \(rowCount) instead")
        }
    }
    
    func test_sut_tableShouldHaveCorrectCellTypePerSectionType() {
        let (sut, viewModel) = makeSUT()
        viewModel.sections = [
            .grid(ScrollingMenuGridViewModel(gridItems: [])),
            .horizontal(ScrollingMenuHorizontalViewModel(title: "a title", items: [])),
            .single(ScrollingMenuSingleViewModel<UIImage>(data: anyTitleImageURL(), imageLoader: imageLoader(), imageTransformer: UIImage.init))
        ]
        
        sut.loadViewIfNeeded()
        
        expect(cellAtSection: 0, inSUT: sut, toBe: ScrollingMenuGridCell.self)
        expect(cellAtSection: 1, inSUT: sut, toBe: ScrollingMenuHorizontalCell.self)
        expect(cellAtSection: 2, inSUT: sut, toBe: ScrollingMenuSingleCell.self)
    }
    
    func test_viewDidLoad_rendersSingleCellTitleAndURL() throws {
        let (sut, viewModel) = makeSUT()
        let title = "a title"
        let url = URL(string: "http://any-url.com")!
        let data = TitleImageURLMock(title: title, imageURL: url)
        viewModel.sections = [
            .single(ScrollingMenuSingleViewModel<UIImage>(data: data, imageLoader: imageLoader(), imageTransformer: UIImage.init))
        ]
        
        sut.loadViewIfNeeded()
        
        let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath(forSection: 0)) as? ScrollingMenuSingleCell
        
        XCTAssertEqual(cell?.headerLabel.text, title)
            
    }
    
    // MARK: - Helper
    
    func makeSUT() -> (sut: ScrollingMenuViewController, viewModel: ScrollingMenuViewModelSpy) {
        let viewModel = ScrollingMenuViewModelSpy(developedBy: anyTitleImageURL(), managedBy: anyTitleImageURL(), systemItems: [anyTitleImageData()], aboutItems: [anyTitleImageData()], gridItems: [anyTitleImageData()])
        let storyboard = UIStoryboard(name: "ScrollingMenu", bundle: Bundle(for: ScrollingMenuViewController.self))
        let sut = storyboard.instantiateInitialViewController() as! ScrollingMenuViewController
        sut.viewModel = viewModel
        
        return (sut, viewModel)
    }
    
    private func indexPath(forSection section: Int) -> IndexPath {
        return IndexPath(row: 0, section: section)
    }
    
    private func expect<T>(cellAtSection section: Int,
                           inSUT sut: ScrollingMenuViewController,
                           toBe expectedCell: T.Type,
                           file: StaticString = #filePath,
                           line: UInt = #line) {
        let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath(forSection: section))
        XCTAssertTrue(cell is T, "Expected \(T.self), got \(String(describing: cell)) instead", file: file, line: line)
    }
}
