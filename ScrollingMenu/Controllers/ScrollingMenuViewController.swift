//
//  ScrollingMenuViewController.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

struct ScrollingMenuGridViewModel {
    
}
class ScrollingMenuGridCell: UITableViewCell {
    
}

struct ScrollingMenuHorizontalViewModel {
    
}
class ScrollingMenuHorizontalCell: UITableViewCell {
    
}

class ScrollingMenuSingleCell: UITableViewCell {
    @IBOutlet private(set) weak var headerLabel: UILabel!
    @IBOutlet private(set) weak var bannerImageView: UIImageView!
    
    func configure(with viewModel: ScrollingMenuSingleViewModel<UIImage>) {
        headerLabel.text = viewModel.title
    }
}

class ScrollingMenuViewController: UIViewController {
    @IBOutlet private(set) public var tableView: UITableView!
    
    typealias Section = ScrollingMenuViewModel.SectionType
    
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
        return cellForSection(section, in: tableView)
    }
    
    private func cellForSection(_ section: Section, in tableView: UITableView) -> UITableViewCell {
        switch section {
        case .grid:
            return ScrollingMenuGridCell()
        case .horizontal:
            return ScrollingMenuHorizontalCell()
        case let .single(viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScrollingMenuSingleCell") as! ScrollingMenuSingleCell
            cell.configure(with: viewModel)
            return cell
        }
    }
}

