//
//  ScrollingMenuViewController.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

struct ScrollingMenuGridViewModel {
    
}

class ScrollingMenuViewController: UIViewController {
    @IBOutlet private(set) public var tableView: UITableView!
    
    typealias Section = ScrollingMenuViewModel.SectionType
    var cellControllers = [IndexPath: CellController]()
    var viewModel: ScrollingMenuViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ScrollingMenuViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = viewModel.section(at: indexPath.section)
        let controller = cellController(for: section, in: tableView)
        cellControllers[indexPath] = controller
        
        return controller.view(in: tableView)
    }
    
    private func cellController(for section: Section, in tableView: UITableView) -> CellController {
        switch section {
        case .grid:
            return ScrollingMenuGridCellController()
        case let .horizontal(viewModel):
            return ScrollingMenuHorizontalCellController(viewModel: viewModel)
        case let .single(viewModel):
            return ScrollingMenuSingleCellController(viewModel: viewModel)
        }
    }
}

extension ScrollingMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellControllers[indexPath]?.cancelLoad()
    }
}

extension ScrollingMenuViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { indexPath in
            cellControllers[indexPath]?.preload()
        }
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { indexPath in
            cellControllers[indexPath]?.cancelLoad()
        }
    }
}

