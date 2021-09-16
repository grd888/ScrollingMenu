//
//  GridButton.swift
//  ScrollingMenu
//
//  Created by GD on 9/15/21.
//

import UIKit

class GridButton: UIView, HasNib {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        loadNibContent()
    }

}
