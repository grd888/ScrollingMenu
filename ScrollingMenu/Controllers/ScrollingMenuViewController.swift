//
//  ScrollingMenuViewController.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

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
        case let .grid(viewModel):
            return ScrollingMenuGridCellController(viewModel: viewModel)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = viewModel.section(at: indexPath.section)
        switch section {
        case .grid:
            let cellController = cellController(for: section, in: tableView) as! ScrollingMenuGridCellController
            return cellController.cellHeight(forTableWidth: tableView.bounds.width)
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let section = viewModel.section(at: indexPath.section)
        switch section {
        case let .single(viewModel):
            viewModel.select()
        default:
            break
        }
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

