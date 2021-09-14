//
//  ScrollingMenuViewModel.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import Foundation

class ScrollingMenuViewModel {
    enum SectionType {
        case grid
        case horizontal
        case single
    }
    
    var sections: [ScrollingMenuViewModel.SectionType] = [
        .grid,
        .horizontal,
        .single,
        .horizontal,
        .single
    ]
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func section(at index: Int) -> SectionType {
        return sections[index]
    }
}
