//
//  ScrollingMenuViewController.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

struct ScrollingMenuGridViewModel {
    
}


struct ScrollingMenuHorizontalViewModel {
    
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
        
        return controller.view(in: tableView)
    }
    
    private func cellController(for section: Section, in tableView: UITableView) -> CellController {
        switch section {
        case .grid:
            fatalError()
        case .horizontal:
            fatalError()
        case let .single(viewModel):
            return ScrollingMenuSingleCellController(viewModel: viewModel)
        }
    }
    
//    private func cellForSection(_ section: Section, in tableView: UITableView) -> UITableViewCell {
//        switch section {
//        case .grid:
//            return ScrollingMenuGridCell()
//        case .horizontal:
//            return ScrollingMenuHorizontalCell()
//        case let .single(viewModel):
//            let controller = ScrollingMenuSingleCellController(viewModel: viewModel)
//            return controller.view(in: tableView)
//        }
//    }
    
    
}

