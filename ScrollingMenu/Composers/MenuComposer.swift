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
       
        let viewModel = ScrollingMenuViewModel(developedBy: developedBy, managedBy: managedBy)
        return makeMenuController(viewModel: viewModel)
    }
    
    private static func makeMenuController(viewModel: ScrollingMenuViewModel) -> ScrollingMenuViewController {
        let storyboard = UIStoryboard(name: "ScrollingMenu", bundle: Bundle(for: ScrollingMenuViewController.self))
        
        let viewController = storyboard.instantiateInitialViewController() as! ScrollingMenuViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
