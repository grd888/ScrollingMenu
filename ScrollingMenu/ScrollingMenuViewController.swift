//
//  ScrollingMenuViewController.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

class ScrollingMenuViewController: UIViewController {
    @IBOutlet private(set) public var tableView: UITableView!
}

extension ScrollingMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

