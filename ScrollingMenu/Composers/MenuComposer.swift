//
//  MenuComposer.swift
//  ScrollingMenu
//
//  Created by GD on 9/15/21.
//

import UIKit

final class MenuComposer {
    private init() {}
    
    public static func menuController() -> ScrollingMenuViewController {
        let developedBy = CompanyData(title: "Developed By", imageURL: URL(string: "https://picsum.photos/id/1000/1600/900")!)
        let managedBy = CompanyData(title: "Managed By", imageURL: URL(string: "https://picsum.photos/id/101/1600/900")!)
        let systemItems: [TitleImageData] = [
            MenuItemData(title: "Tasks & Approvals", imageName: "tile_task-approval"),
            MenuItemData(title: "Support", imageName: "tile_support"),
        ]
        let aboutItems: [TitleImageData] = [
            MenuItemData(title: "Building Information", imageName: "building_info_widget"),
            MenuItemData(title: "Moving In", imageName: "tile_move-in"),
            MenuItemData(title: "Moving Out", imageName: "tile_move-out"),
            MenuItemData(title: "Spaces", imageName: "tile_space"),
            MenuItemData(title: "Assets", imageName: "tile_asset"),
        ]
        let viewModel = ScrollingMenuViewModel(developedBy: developedBy,
                                               managedBy: managedBy,
                                               systemItems: systemItems,
                                               aboutItems: aboutItems)
        return makeMenuController(viewModel: viewModel)
    }
    
    private static func makeMenuController(viewModel: ScrollingMenuViewModel) -> ScrollingMenuViewController {
        let storyboard = UIStoryboard(name: "ScrollingMenu", bundle: Bundle(for: ScrollingMenuViewController.self))
        
        let viewController = storyboard.instantiateInitialViewController() as! ScrollingMenuViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
