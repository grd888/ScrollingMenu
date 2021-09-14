//
//  UITableView+Dequeueing.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
