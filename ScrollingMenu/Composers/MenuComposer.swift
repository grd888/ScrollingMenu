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
        let gridItems: [TitleImageData] = [
            MenuItemData(title: "Ticket", imageName: "ic_ticket_pdf"),
            MenuItemData(title: "Inspect", imageName: "ic_inspect_pdf"),
            MenuItemData(title: "Project", imageName: "ic_project_pdf"),
            MenuItemData(title: "Permit", imageName: "ic_access_pdf"),
            MenuItemData(title: "Notice", imageName: "ic_notice_pdf"),
            MenuItemData(title: "Event", imageName: "ic_event_pdf"),
            MenuItemData(title: "Sell", imageName: "ic_listing_pdf"),
            MenuItemData(title: "Utility", imageName: "ic_utility_pdf"),
            MenuItemData(title: "Snag", imageName: "ic_snag_pdf"),
            MenuItemData(title: "Task", imageName: "ic_task_pdf"),
            MenuItemData(title: "More", imageName: "ic_more_pdf"),
            MenuItemData(title: "Add & Tag", imageName: "ic_add&tag_pdf"),
        ]
        let viewModel = ScrollingMenuViewModel(developedBy: developedBy,
                                               managedBy: managedBy,
                                               systemItems: systemItems,
                                               aboutItems: aboutItems,
                                               gridItems: gridItems)
        return makeMenuController(viewModel: viewModel)
    }
    
    private static func makeMenuController(viewModel: ScrollingMenuViewModel) -> ScrollingMenuViewController {
        let storyboard = UIStoryboard(name: "ScrollingMenu", bundle: Bundle(for: ScrollingMenuViewController.self))
        
        let viewController = storyboard.instantiateInitialViewController() as! ScrollingMenuViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
