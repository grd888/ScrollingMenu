//
//  CompanyData.swift
//  ScrollingMenu
//
//  Created by GD on 9/15/21.
//

import Foundation

struct CompanyData: TitleImageURL {
    private(set) var title: String
    
    private(set) var imageURL: URL
    
    init(title: String, imageURL: URL) {
        self.title = title
        self.imageURL = imageURL
    }
}
