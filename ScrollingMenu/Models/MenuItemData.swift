//
//  MenuItemData.swift
//  ScrollingMenu
//
//  Created by GD on 9/15/21.
//

import UIKit

struct MenuItemData: TitleImageData {
    var title: String
    
    var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
