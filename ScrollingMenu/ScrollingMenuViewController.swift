//
//  ScrollingMenuViewController.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

class ScrollingMenuGridCell: UITableViewCell {
    
}

class ScrollingMenuHorizontalCell: UITableViewCell {
    
}

class ScrollingMenuSingleCell: UITableViewCell {
    
}

class ScrollingMenuViewController: UIViewController {
    @IBOutlet private(set) public var tableView: UITableView!
    
    typealias Section = ScrollingMenuViewModel.SectionType
    
    var viewModel: ScrollingMenuViewModel!
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
        return cellForSection(section)
    }
    
    private func cellForSection(_ section: Section) -> UITableViewCell {
        switch section {
        case .grid:
            return ScrollingMenuGridCell()
        case .horizontal:
            return ScrollingMenuHorizontalCell()
        case .single:
            return ScrollingMenuSingleCell()
        }
    }
}

